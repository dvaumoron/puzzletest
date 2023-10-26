# this file is used to configure permission groups and pages with their widget

permissionGroup "wikiGroup1" {
  id = 2
}

permissionGroup "wikiGroup2" {
  id = 3
}

permissionGroup "blogGroup" {
  id = 4
}

permissionGroup "forumGroup" {
  id = 5
}

pageGroup {
  groupId = 0
  pages   = ["about/", "about/faq"]
}

widget "wiki1" {
  kind     = "wiki"
  objectId = 1
  groupId  = 2
}

widget "wiki2" {
  kind      = "wiki"
  objectId  = 2
  groupId   = 2
  templates = ["Welcome", "wiki2/view", "wiki2/edit", "wiki2/list"]
}

widget "wiki3" {
  kind     = "wiki"
  objectId = 3
  groupId  = 3
}

widget "blog" {
  kind     = "blog"
  objectId = 4
  groupId  = 4
}

widget "forum" {
  kind     = "forum"
  objectId = 5
  groupId  = 5
}

widget "gallery" {
  kind        = "remote"
  serviceAddr = "localhost:51351"
  widgetName  = "gallery"
  objectId    = 6
  groupId     = 0
}

widgetPage "wiki" {
  emplacement = "about"
  widgetRef   = "wiki1"
}

widgetPage "wiki2" {
  emplacement = "about/faq"
  widgetRef   = "wiki2"
}

widgetPage "wiki3" {
  widgetRef = "wiki3"
}

widgetPage "blog" {
  widgetRef = "blog"
}

widgetPage "forum" {
  widgetRef = "forum"
}

widgetPage "gallery" {
  widgetRef = "gallery"
}
