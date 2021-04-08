function initMobileMenu() {
    let menuButton = document.getElementById('menu_button');
    let menu = document.getElementById('menu');
    let menuLinks = menu.querySelectorAll('.menu__link');
    let body = document.getElementsByClassName('main')[0];

    function checkHidden(element) {
        let displayStyle = window.getComputedStyle(element).display;

        if (displayStyle === 'none') {
            menu.classList.remove('menu_hidden');
        } else {
            menu.classList.add('menu_hidden');
            menuButton.classList.remove('burger-button_active');
            body.classList.remove('main_without-overflow');
        }
    }

    function toggleMenuClasses() {
        menuButton.classList.toggle('burger-button_active');
        menu.classList.toggle('menu_hidden');
        body.classList.toggle('main_without-overflow');
    }

    checkHidden(menuButton);
    menuButton.onclick = toggleMenuClasses;
    menuLinks.forEach(link => link.onclick = toggleMenuClasses);
    window.onresize = function() {checkHidden(menuButton);}
}

initMobileMenu();