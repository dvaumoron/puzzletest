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
	"github.com/dvaumoron/puzzleweb/admin"
	"github.com/dvaumoron/puzzleweb/admin/client"
	"github.com/dvaumoron/puzzleweb/blog"
	"github.com/dvaumoron/puzzleweb/config"
	"github.com/dvaumoron/puzzleweb/forum"
	"github.com/dvaumoron/puzzleweb/locale"
	"github.com/dvaumoron/puzzleweb/login"
	"github.com/dvaumoron/puzzleweb/profile"
	"github.com/dvaumoron/puzzleweb/settings"
	"github.com/dvaumoron/puzzleweb/wiki"
	"golang.org/x/text/language"
)

const wikiGroup1Id = 2
const wikiGroup2Id = 3
const blogGroupId = 4
const forumGroupId = 5

func main() {
	// init available language
	locale.Availables.Add(language.French)
	locale.Availables.Add(language.English)

	// create group for permissions
	client.RegisterGroup(wikiGroup1Id, "wiki.group1")
	client.RegisterGroup(wikiGroup2Id, "wiki.group2")
	client.RegisterGroup(blogGroupId, "blog.group")
	client.RegisterGroup(forumGroupId, "forum.group")

	site := puzzleweb.NewSite()

	site.SetHTMLRender(adapter.LoadTemplates(config.Shared.TemplatesPath))

	login.AddLoginPage(site)
	admin.AddAdminPage(site)
	profile.AddProfilePage(site, client.PublicGroupId) // make profile page public
	settings.AddSettingsPage(site)

	site.AddPage(puzzleweb.NewStaticPage("about", client.PublicGroupId, "todo"))
	site.AddPage(puzzleweb.NewStaticPage("faq", client.PublicGroupId, "todo"))

	// Warning : the object id should be different even for different kind of dynamic page
	// (currently blog use forum storage for comment)
	site.AddPage(wiki.NewWikiPage("wiki", wikiGroup1Id, 1))
	site.AddPage(wiki.NewWikiPage("wiki2", wikiGroup1Id, 2))
	site.AddPage(wiki.NewWikiPage("wiki3", wikiGroup2Id, 3))
	site.AddPage(blog.NewBlogPage("blog", blogGroupId, 4))
	site.AddPage(forum.NewForumPage("forum", forumGroupId, 5))

	site.Run()
}
