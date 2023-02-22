Import "main.il"

:= WidgetBody
    Quote
        form @id="loginForm" @action="/login/submit" @method="POST"
            div
                label
                    . Messages LoginLabel
                    input @type="text" @name="Login"
            div
                label
                    . Messages PasswordLabel
                    input @type="password" @id="passwordField" @name="Password"
            div @id="confirmPasswordBlock" @class="hidden"
                label
                    . Messages ConfirmPasswordLabel
                    input @type="password" @id="confirmPasswordField" @name="ConfirmPassword"
            div @class="hidden"
                input @type="text" @id="loginRegisterField" @name="Register"
                input @type="text" @name="Redirect" @value=Redirect
                input @type="text" @name="PrevUrlWithError" @value=PrevUrlWithError
                # to allow JavaScript or WebAssembly to display a localized error message
                span @id="errorWrongConfimPasswordMessage" (. Messages WrongConfirmPassword)
            div (button @type="submit" (. Messages LoginLinkLabel))
            div
                button @type="button" @id="loginRegisterButton" (. Messages RegisterLinkLabel)
                button @type="button" @id="loginRegisterButton2" @class="hidden" (. Messages RegisterLinkLabel)
