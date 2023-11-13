class ProfileLink extends HTMLElement {
    constructor() {
        super();

        var login = this.getAttribute("login");

        var shadow = this.attachShadow({ mode: 'open' });
        var loadBloc = document.createElement('div');
        loadBloc.setAttribute('hx-get', '/profile/link/'+login+'?pagePart=profileLink')
        loadBloc.setAttribute('hx-trigger', 'load delay:100ms')
        loadBloc.setAttribute('hx-swap', 'outerHTML')
        shadow.appendChild(link);
    }
}

customElements.define('profile-link', ProfileLink);
