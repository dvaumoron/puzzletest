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
	_ "embed"

	"github.com/dvaumoron/puzzleweb"
	adminservice "github.com/dvaumoron/puzzleweb/admin/service"
	"github.com/dvaumoron/puzzleweb/blog"
	"github.com/dvaumoron/puzzleweb/config"
	"github.com/dvaumoron/puzzleweb/forum"
	"github.com/dvaumoron/puzzleweb/wiki"
	"go.uber.org/zap"
)

const wikiGroup1Id = 2
const wikiGroup2Id = 3
const blogGroupId = 4
const forumGroupId = 5

const notFound = "notFound"

//go:embed version.txt
var version string

func main() {
	site, globalConfig, initSpan := puzzleweb.BuildDefaultSite(config.WebKey, version)
	logger := globalConfig.GetLogger()
	rightClient := globalConfig.RightClient

	// create group for permissions
	rightClient.RegisterGroup(wikiGroup1Id, "wikiGroup1")
	rightClient.RegisterGroup(wikiGroup2Id, "wikiGroup2")
	rightClient.RegisterGroup(blogGroupId, "blogGroup")
	rightClient.RegisterGroup(forumGroupId, "forumGroup")

	site.AddPage(puzzleweb.MakeHiddenStaticPage(globalConfig.Tracer, notFound, adminservice.PublicGroupId, notFound))
	site.AddStaticPages(globalConfig.CtxLogger, adminservice.PublicGroupId, []string{"about/", "about/faq"})

	// Warning : the object id should be different even for different kind of dynamic page
	// (currently blog use forum storage for comment)
	aboutPage, _ := site.GetPage("about")
	faqPage, _ := aboutPage.GetSubPage("faq")
	aboutPage.AddSubPage(wiki.MakeWikiPage("wiki", globalConfig.CreateWikiConfig(1, wikiGroup1Id)))
	faqPage.AddSubPage(wiki.MakeWikiPage("wiki2", globalConfig.CreateWikiConfig(2, wikiGroup1Id, "Welcome", "wiki2/view", "wiki2/edit", "wiki2/list")))
	site.AddPage(wiki.MakeWikiPage("wiki3", globalConfig.CreateWikiConfig(3, wikiGroup2Id)))
	site.AddPage(blog.MakeBlogPage("blog", globalConfig.CreateBlogConfig(4, blogGroupId)))
	site.AddPage(forum.MakeForumPage("forum", globalConfig.CreateForumConfig(5, forumGroupId)))

	initSpan.End()

	siteConfig := globalConfig.ExtractSiteConfig()
	// emptying data no longer useful for GC cleaning
	globalConfig = nil

	if err := site.Run(siteConfig); err != nil {
		logger.Fatal("Failed to serve", zap.Error(err))
	}
}
