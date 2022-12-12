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
	"github.com/dvaumoron/puzzleweb/locale"
	"github.com/dvaumoron/puzzleweb/login"
	"github.com/dvaumoron/puzzleweb/wiki"
	"golang.org/x/text/language"
)

func main() {
	locale.Availables.Add(language.French)

	site := puzzleweb.CreateSite()

	login.AddLoginPage(site, "login")
	site.AddPage(wiki.NewWikiPage("wiki", 2))
	// TODO

	site.Run()
}
