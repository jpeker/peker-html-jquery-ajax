addEventListener("message", ReceiveMessageFromPage, false);
function ReceiveMessageFromPage(evt) {
    var date = new Date();
    var currentDate = null;
    do {
        currentDate = new Date();
    }
    while (currentDate - date < 10000);
    postMessage("Page said : " + evt.data + "\r\n Worker Replied : Hello Page!");
}