/*
JS function for loading a given .js file.
This is used for switching between the different modes.
*/
function LoadMyJs(scriptName) {
    var docHeadObj = document.getElementsByTagName("head")[0];
    var dynamicScript = document.createElement("script");
    dynamicScript.type = "text/javascript";
    dynamicScript.src = scriptName;
    docHeadObj.appendChild(dynamicScript);
}
