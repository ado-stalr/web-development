function initMobileMenu() {
    let menuButton = document.getElementById('menu_button');
    let menu = document.getElementById('menu');
    let menuLinks = menu.querySelectorAll('.menu__link');
    let body = document.getElementsByClassName('main')[0];
    let header = document.getElementById('header');
    let background = document.getElementById('promo-background');

    function checkHidden(element) {
        let displayStyle = window.getComputedStyle(element).display;

        if (displayStyle === 'none') {
            menu.classList.remove('menu_hidden');
            background.classList.remove('.promo-slider__background_on-top');
        } else {
            menu.classList.add('menu_hidden');
            menuButton.classList.remove('burger-button_active');
            body.classList.remove('main_without-overflow');
            background.classList.remove('promo-slider__background_on-top');
            header.classList.remove('header_fixed');
        }
    }

    function toggleMenuClasses() {
        menuButton.classList.toggle('burger-button_active');
        menu.classList.toggle('menu_hidden');
        body.classList.toggle('main_without-overflow');
        background.classList.toggle('promo-slider__background_on-top');
        header.classList.toggle('header_fixed');
    }

    checkHidden(menuButton);
    menuButton.onclick = toggleMenuClasses;
    menuLinks.forEach(link => link.onclick = toggleMenuClasses);
    window.onresize = function() {checkHidden(menuButton);}
}

initMobileMenu();