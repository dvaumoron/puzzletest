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
	"github.com/dvaumoron/puzzleweb/builder"
	"github.com/dvaumoron/puzzleweb/forum"
	"github.com/dvaumoron/puzzleweb/wiki"
)

const wikiGroup1Id = 2
const wikiGroup2Id = 3
const blogGroupId = 4
const forumGroupId = 5

func main() {
	site, globalConfig := builder.BuildDefaultSite()
	rightClient := globalConfig.RightClient

	// create group for permissions
	rightClient.RegisterGroup(wikiGroup1Id, "wiki.group1")
	rightClient.RegisterGroup(wikiGroup2Id, "wiki.group2")
	rightClient.RegisterGroup(blogGroupId, "blog.group")
	rightClient.RegisterGroup(forumGroupId, "forum.group")

	site.HTMLRender = adapter.LoadTemplates(globalConfig.TemplatesPath)

	authConfig := globalConfig.ExtractAuthConfig()
	site.AddPage(puzzleweb.MakeStaticPage("about", adminservice.PublicGroupId, "todo", authConfig))
	site.AddPage(puzzleweb.MakeStaticPage("faq", adminservice.PublicGroupId, "todo", authConfig))

	// Warning : the object id should be different even for different kind of dynamic page
	// (currently blog use forum storage for comment)
	site.AddPage(wiki.MakeWikiPage("wiki", globalConfig.CreateWikiConfig(1, wikiGroup1Id)))
	site.AddPage(wiki.MakeWikiPage("wiki2", globalConfig.CreateWikiConfig(2, wikiGroup1Id)))
	site.AddPage(wiki.MakeWikiPage("wiki3", globalConfig.CreateWikiConfig(3, wikiGroup2Id)))
	site.AddPage(blog.MakeBlogPage("blog", globalConfig.CreateBlogConfig(4, blogGroupId)))
	site.AddPage(forum.MakeForumPage("forum", globalConfig.CreateForumConfig(5, forumGroupId)))

	site.Run(globalConfig.ExtractSiteConfig())
}
