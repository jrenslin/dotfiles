function switchBar (newID, inputText, inputValue) {

    document.getElementsByTagName("form")[0].id = newID;
    document.getElementsByTagName("input")[0].placeholder = inputText;
    document.getElementsByTagName("input")[0].value = inputValue;

    /* Remove script */
    document.getElementsByTagName("form")[0].removeEventListener('keydown', hotkeys);
    var headobj = document.getElementsByTagName("head")[0];
    headobj.removeChild(document.getElementsByTagName("script")[1]);
    LoadMyJs('hotkeys.js');

}

document.onkeydown = function(e) {
    switch (e.keyCode) {
    case 20: // On caps lock (20) make it a search bar
        switchBar ("searchbar", "Search ...", "");
        break;

    case 18: // On alt (18) make it a hot key bar
        switchBar ("hotkeybar", "Press keys ...", "");
        break;

    case 91: // On windows key / hyper (91) make it a URL bar
        switchBar ("urlbar", "Enter URL ...", "https://");
        break;
    }
}
