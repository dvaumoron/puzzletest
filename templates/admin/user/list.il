Import "main.il"

:= WidgetBody
    Quote
        List
            h2 (. Messages UserListTitle) " (" Total ")"
            search
            paginate

            := viewLinkLabel (. Messages ViewLinkLabel)
            For user Users
                := id (. user Id)
                div @class="grid"
                    p (profileLink user)
                    p (a @href="/admin/user/view/":id @role="button" viewLinkLabel)
