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
	"github.com/dvaumoron/puzzleweb"
	"github.com/dvaumoron/puzzleweb/admin"
	"github.com/dvaumoron/puzzleweb/admin/client"
	"github.com/dvaumoron/puzzleweb/locale"
	"github.com/dvaumoron/puzzleweb/login"
	"github.com/dvaumoron/puzzleweb/wiki"
	"golang.org/x/text/language"
)

const wikiGroup1Id = 2
const wikiGroup2Id = 3

func main() {
	locale.Availables.Add(language.French)
	locale.Availables.Add(language.English)

	client.RegisterGroup(wikiGroup1Id, "wiki.group1")
	client.RegisterGroup(wikiGroup2Id, "wiki.group2")

	site := puzzleweb.CreateSite()

	login.AddLoginPage(site, "login")
	admin.AddAdminPage(site, "admin")
	site.AddPage(wiki.NewWikiPage("wiki", wikiGroup1Id, 1))
	site.AddPage(wiki.NewWikiPage("wiki2", wikiGroup1Id, 2))
	site.AddPage(wiki.NewWikiPage("wiki3", wikiGroup2Id, 3))
	// TODO

	site.Run()
}
