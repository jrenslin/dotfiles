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
    case 91:
        window.location.replace(document.getElementsByTagName("input")[0].value);
        break;
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
Define usable keybindings.
*/
function hotkeys (e) {

         switch (e.keyCode) {
             /* On Q go to jrenslin.de */
             case 81:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://jrenslin.de/');
                 break;
             /* On B go to Aklaman */
             case 66:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://jrenslin.de/tools/books/');
                 break;
             /* On M go to Money Tool */
             case 77:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://jrenslin.de/tools/business/');
                 break;
             /* On W go to Synthing */
             case 87:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://127.0.0.1:8384/');
                 break;


             /* On R go to OLAT of Uni Frankfurt */
             case 82:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://olat-ce.server.uni-frankfurt.de/');
                 break;
             /* On F go to QIS of Uni Frankfurt */
             case 70:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://qis.server.uni-frankfurt.de');
                 break;
             /* On G go to the website of the University Library of Uni Frankfurt */
             case 71:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://www.ub.uni-frankfurt.de/');
                 break;
             /* On T go to the IZO website */
             case 84:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('http://www.uni-frankfurt.de/43866432/aktuelles');
                 break;

             /* On A go to ppanji.org */
             case 65:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('http://ppanji.org');
                 break;
             /* On Y go to SOA-Verein Dummy Page */
             case 89:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('http://h2383667.stratoserver.net:8001');
                 break;
             /* On X go to Museum-Digital */
             case 88:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://museum-digital.de');
                 break;
             /* On S go to southeastasiaconference.com */
             case 83:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('http://southeastasiaconference.com');
                 break;
             /* On D go to SSK2 group on FB */
             case 68:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://www.facebook.com/groups/410195149324754/');
                 break;

             /* On J go to New Mandala */
             case 74:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://newmandala.org');
                 break;


             /* On Z go to mangaupdates.com */
             case 90:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://mangaupdates.com');
                 break;
             /* On U go to /r/unixporn */
             case 85:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://reddit.com/r/unixporn/');
                 break;
             /* On I go to /r/cyberpunk */
             case 73:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://reddit.com/r/cyberpunk/');
                 break;
             /* On O go to Graphemica */
             case 79:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://graphemica.com/');
                 break;
             /* On P go to Flickr */
             case 80:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('https://flickr.com/');
                 break;

             /* On arrow left open firefox preferences */
             case 37:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('about:preferences');
                 break;
             /* On arrow up open firefox about:home */
             case 38:
                 document.getElementById('loading').style = "display:block;";
                 window.location.replace('about:home');
                 break;
             /* On arrow right go to about:config */
             case 39:
                 document.getElementById('loading').style = "display:block;";
                 window.location.href('about:config');
                 break;
             /* On arrow down go to open about:downloads */
             case 40:
                 document.getElementById('loading').style = "display:block;";
                 window.location.href('about:downloads');
                 break;

             case 37:
                 alert('left');
                 break;
             case 38:
                 alert('up');
                 break;
             case 39:
                 alert('right');
                 break;
             case 40:
                 alert('down');
                 break;
         }
};
