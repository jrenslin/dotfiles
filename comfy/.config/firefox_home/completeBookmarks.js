/* ---------------------------------
// Search function for bookmarks:
// - Loads all bookmarks from file
// - Binds opening the search menu to the corresponding navigation option
// - Searches through the file index using regular expressions
// + Inserts the results into a list
// + Binds opening them on clicking on the list items
// --------------------------------- */

var elements;
var requestURL  = './bookmarks.txt'; // Bookmarks is essentially a CSV file split by tabs
var request     = new XMLHttpRequest();
request.open('GET', requestURL);
request.setRequestHeader("Cache-Control", "no-cache");
request.send();
request.onload = function() {
    elements = request.response;
    elements = elements.split(/\r?\n/); // Split the lines / entries
};

// Open search on click on search
if (document.getElementById('navigation_Search') != null) {
    document.getElementById('navigation_Search').addEventListener("click", function(){
        document.getElementById('search').style = "";
        document.getElementById('searchInput').focus();
    });
}

// Bind functions to search form
if (document.getElementById('search') != null) {
    document.getElementById('search').addEventListener('keydown', complete);
}

// Removes all contents from a given element
function emptyElement (id) {
    var element = document.getElementById(id);
    while (element.firstChild) {
        element.removeChild(element.firstChild);
    }
}

// Add an new option
function addSelectOption (path, number) {

    var contents = path.split(/\t/);

    var li = document.createElement("a");                           // Create a <a> node
    li.id = "link" + number.toString();

    li.href = contents[0];

    var liText = document.createElement("span");                     // Create a <span> node for entry title
    var liTextContents = document.createTextNode(contents[1]);
    liText.appendChild(liTextContents);

    var liTime = document.createElement("time");                     // Create a <span> node for entry title
    var liTimeContents = document.createTextNode(contents[4]);
    liTime.appendChild(liTimeContents);

    li.appendChild(liText); li.appendChild(liTime);                  // Append the text to <li>
    document.getElementById("searchSelectors").appendChild(li);      // Append <a> to <ul> with id="searchSelectors"
}

// Search through list of files and add appropriate options to list
function complete (e) {

    mainComplete(document.getElementById("searchInput").value);

}

function mainComplete (str) {
    emptyElement("searchSelectors");
    var regex = new RegExp(str);

    var hits = 0;
    for (var i = elements.length - 2; i > 0; i--) {

        var match = regex.exec(elements[i]);

        if (match != null) {
            addSelectOption(elements[i], hits + 1);
            hits++;
            if (hits >= 10) { // Display only the last 10 elements
                break;
            }
        }

    }
}

