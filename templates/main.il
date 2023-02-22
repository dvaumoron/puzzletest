html
    head
        meta @charset="utf-8"
        title "Title - " PageTitle
        link @rel="stylesheet" @type="text/css" @href="/static/main.css"
        script @type="text/javascript" @src="/static/js/wasm_exec.js"
        script @type="text/javascript" @src="/static/js/main.js"
        WidgetHeader
    body
        header
            h1 PageTitle
            If LoginUrl
                p
                    If Login
                        List
                            Messages.WelcomeLabel Login
                            a @href=LoginUrl Messages.LoginLinkLabel
                        a @href=LoginUrl Messages.LogoutLinkLabel
            If ErrorMsg
                div @class="error" ErrorMsg
            p
                For page Ariane
                    := url (. page Url)
                    "/ " (a @href=url (. page Name)) " "
            ul
                For page SubPages
                    := url (. page Url)
                    li (a @href=url (. page Name))
        main
            Eval WidgetBody
        footer
