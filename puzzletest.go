/*
 *
 * Copyright 2022 puzzletest authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package main

import (
	"github.com/dvaumoron/indentlang/adapter"
	"github.com/dvaumoron/puzzleweb"
	adminservice "github.com/dvaumoron/puzzleweb/admin/service"
	"github.com/dvaumoron/puzzleweb/blog"
	"github.com/dvaumoron/puzzleweb/forum"
	"github.com/dvaumoron/puzzleweb/wiki"
)

const wikiGroup1Id = 2
const wikiGroup2Id = 3
const blogGroupId = 4
const forumGroupId = 5

func main() {
	site, globalConfig := puzzleweb.BuildDefaultSite()
	rightClient := globalConfig.RightClient

	// create group for permissions
	rightClient.RegisterGroup(wikiGroup1Id, "wiki.group1")
	rightClient.RegisterGroup(wikiGroup2Id, "wiki.group2")
	rightClient.RegisterGroup(blogGroupId, "blog.group")
	rightClient.RegisterGroup(forumGroupId, "forum.group")

	ext := globalConfig.TemplatesExt
	if ext == ".il" {
		site.HTMLRender = adapter.LoadTemplates(globalConfig.TemplatesPath)
	} else {
		site.HTMLRender = puzzleweb.LoadTemplates(globalConfig.TemplatesPath)
	}

	site.AddPage(puzzleweb.MakeHiddenStaticPage("notFound", adminservice.PublicGroupId, "notFound"+ext))
	site.AddPage(puzzleweb.MakeStaticPage("about", adminservice.PublicGroupId, "about"+ext))
	site.AddPage(puzzleweb.MakeStaticPage("faq", adminservice.PublicGroupId, "faq"+ext))

	// Warning : the object id should be different even for different kind of dynamic page
	// (currently blog use forum storage for comment)
	wikiPagesLook := []string{"Welcome", "wiki/view" + ext, "wiki/edit" + ext, "wiki/list" + ext}
	wikiPagesLook2 := []string{"Welcome", "wiki2/view" + ext, "wiki2/edit" + ext, "wiki2/list" + ext}
	site.AddPage(wiki.MakeWikiPage("wiki", globalConfig.CreateWikiConfig(1, wikiGroup1Id, wikiPagesLook...)))
	site.AddPage(wiki.MakeWikiPage("wiki2", globalConfig.CreateWikiConfig(2, wikiGroup1Id, wikiPagesLook2...)))
	site.AddPage(wiki.MakeWikiPage("wiki3", globalConfig.CreateWikiConfig(3, wikiGroup2Id, wikiPagesLook...)))
	site.AddPage(blog.MakeBlogPage("blog", globalConfig.CreateBlogConfig(4, blogGroupId, "blog/list"+ext, "blog/view"+ext, "blog/create"+ext, "blog/preview"+ext)))
	site.AddPage(forum.MakeForumPage("forum", globalConfig.CreateForumConfig(5, forumGroupId, "forum/list"+ext, "forum/view"+ext, "forum/create"+ext)))

	site.Page404Url = "/notFound"

	site.Run(globalConfig.ExtractSiteConfig())
}
