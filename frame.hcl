# this file is used to configure permission groups and pages with their widget

permission "wikiGroup1" {
  groupId = 2
}

permission "wikiGroup2" {
  groupId = 3
}

permission "blogGroup" {
  groupId = 4
}

permission "forumGroup" {
  groupId = 5
}

# page location ending with / denote a folder (will use the index template)
staticPages {
  groupId   = 0
  locations = ["about/", "about/faq"]
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
  kind        = "remote/gallery"
  serviceAddr = env("GALLERY_SERVICE_ADDR")
  objectId    = 6
  groupId     = 0
}

widgetPage "about/wiki" {
  widgetRef   = "wiki1"
}

widgetPage "about/faq/wiki2" {
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
