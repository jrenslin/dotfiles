if (window.navigator.onLine == false) {
    document.getElementsByTagName('body')[0].innerHTML = "<span>Sorry, you're offline.</span>";
    document.getElementsByTagName('html')[0].id = "offline";
}
