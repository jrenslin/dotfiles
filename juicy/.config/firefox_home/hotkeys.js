/*
   Hotkeys on Firefox start page.
   The main bar on the start page can be turned to different "modes", depending on the mode behaviour will change.

   urlbar opens urls.
   hotkeybar opens predefined links upon keypresses.
*/
if (document.getElementById('urlbar') != null) {
    document.getElementById('urlbar').addEventListener('keydown', seturlsearch);
}
function seturlsearch (e) {

    switch (e.keyCode) {
    /* On return set name of urlbar to it's content/value */
    case 13:
        e.preventDefault();
        window.location.replace(document.getElementsByTagName("input")[0].value);
    }
}

/*
  "hotkeybar" mode.
  Bind keybindings to the bar.
*/
if (document.getElementById('hotkeybar') != null) {
    document.getElementById('hotkeybar').addEventListener('keydown', hotkeys);
}

/*
  Function for referral.
*/
function goTo (target) {
    document.getElementById('loading').style = "display:block;";
    var aim = document.querySelectorAll("a[href^='" + target.substr(0, 10) + "']");
    aim[0].focus();
    aim[0].classList.add("selectedLink");
    window.location.replace(target);
}

/*
  Define usable keybindings.
*/
function hotkeys (e) {

    switch (e.keyCode) {

    case 91: // If mod is pressed, don't do any of the following.
        break;
    case 81: // On Q go to jrenslin.de
        goTo('https://jrenslin.de/');
        break;
    case 66: // On B go to Aklaman
        goTo('https://jrenslin.de/tools/books/');
        break;
    case 77: // On M go to Money Tool
        goTo('https://jrenslin.de/tools/business/');
        break;
    case 87: // On W go to Synthing
        goTo('http://127.0.0.1:8384/');
        break;

    case 82: // On R go to OLAT of Uni Frankfurt
        goTo('https://olat-ce.server.uni-frankfurt.de/');
        break;
    case 70: // On F go to QIS of Uni Frankfurt
        goTo('https://qis.server.uni-frankfurt.de');
        break;
    case 71: // On G go to the website of the University Library of Uni Frankfurt
        goTo('https://www.ub.uni-frankfurt.de/');
        break;
    case 84: // On T go to the IZO website
        goTo('https://www.uni-frankfurt.de/43866432/aktuelles');
        break;

    case 65: // On A go to ppanji.org
        goTo('http://ppanji.org');
        break;
    case 89: // On Y go to SOA-Verein Dummy Page
        goTo('http://h2383667.stratoserver.net:8001');
        break;
    case 88: // On X go to Museum-Digital
        goTo('https://museum-digital.de');
        break;
    case 83: // On S go to southeastasiaconference.com
        goTo('http://southeastasiaconference.com');
        break;
    case 68: // On D go to SSK2 group on FB
        goTo('https://museumsdokumentation.de');
        break;

    case 74: // On J go to New Mandala
        goTo('https://newmandala.org');
        break;

    case 90: // On Z go to mangaupdates.com
        goTo('https://mangaupdates.com');
        break;
    case 85: // On U go to /r/unixporn
        goTo('https://reddit.com/r/unixporn/');
        break;
    case 73: // On I go to /r/cyberpunk
        goTo('https://reddit.com/r/cyberpunk/');
        break;
    case 79: // On O go to Graphemica
        goTo('https://graphemica.com/');
        break;
    case 80: // On P go to Flickr
        goTo('https://flickr.com/');
        break;

        /*
    case 37: // On arrow left open firefox preferences
        goTo('about:preferences');
        break;
    case 38: // On arrow up open firefox about:home
        goTo('about:home');
        break;
    case 39: // On arrow right go to about:config
        goTo('about:config');
        break;
    case 40: // On arrow down go to open about:downloads
        goTo('about:downloads');
        break;
        */

    case 37: // On arrow left open chromium history
        goTo('chrome://history');
        break;
    case 38: // On arrow up open chromium settings
        goTo('chrome://settings');
        break;
    case 39: // On arrow right open chromium flags
        goTo('chrome://flags');
        break;
    case 40: // On arrow down open chromium downloads page 
        goTo('chrome://downloads');
        break;

    }
};

function navigateSections (direction) {

    // Build array of all available sections
    var navigatable = ["start"];
    var sections = document.getElementsByTagName("section");
    for(var i = 0, max = sections.length; i < max; i++) navigatable.push(sections[i].getAttribute("id"));

    // Get current position in page
    var position = window.location.hash;
    if (position == "") position = "start";

    var index = navigatable.indexOf(position.replace("#", "")); // Get index of current

    if (direction == "down") {
        if (index + 2 > navigatable.length) window.location.hash = navigatable[0]; // Go back to start after last section
        else window.location.hash = navigatable[index + 1];
    } else {
        if (index - 1 < 0) window.location.hash = navigatable[0]; // Disable scrolling further up when already on start
        else window.location.hash = navigatable[index - 1];
    }

}

document.addEventListener('keydown', function (e) {
    switch (e.keyCode) {
    case 33: // On page up, scroll up one section
        e.preventDefault();
        navigateSections("up");
        break;
    case 34: // On page down, scroll down one section
        e.preventDefault();
        navigateSections("down");
        break;
    }
});

