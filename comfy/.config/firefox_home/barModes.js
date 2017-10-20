document.onkeydown = function(e) {
    var headobj = document.getElementsByTagName("head")[0];
    switch (e.keyCode) {
    case 20: // On caps lock (20) make it a search bar
        document.getElementsByTagName("form")[0].id = "searchbar";
        document.getElementsByTagName("input")[0].placeholder = "Search ...";
        document.getElementsByTagName("input")[0].value = "";

        /* Remove script */
        document.getElementById('searchbar').removeEventListener('keydown', hotkeys);
        headobj.removeChild(document.getElementsByTagName("script")[1]);
        LoadMyJs('hotkeys.js');

        break;
    case 18: // On alt (18) make it a hot key bar
        document.getElementsByTagName("form")[0].id = "hotkeybar";
        document.getElementsByTagName("input")[0].placeholder = "Press keys ...";
        document.getElementsByTagName("input")[0].value = "";

        /* Remove script */
        document.getElementsByTagName("form")[0].removeEventListener('keydown', hotkeys);
        headobj.removeChild(document.getElementsByTagName("script")[1]);
        LoadMyJs('hotkeys.js');

        break;

    case 91: // On windows key / hyper (91) make it a URL bar
        document.getElementsByTagName("form")[0].id = "urlbar";
        document.getElementsByTagName("input")[0].placeholder = "Enter URL ...";
        document.getElementsByTagName("form")[0].action = '';
        document.getElementsByTagName("input")[0].value = "https://";

        /* Remove script */
        document.getElementById('urlbar').removeEventListener('keydown', hotkeys);
        headobj.removeChild(document.getElementsByTagName("script")[1]);
        LoadMyJs('hotkeys.js');

        break;
    }
}
