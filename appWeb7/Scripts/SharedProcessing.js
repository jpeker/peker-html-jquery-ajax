﻿var port;
addEventListener("connect", ReceiveMessageFromPage, false);
function ReceiveMessageFromPage(evt) {
    port = evt.ports[0];
    port.addEventListener("message", SendMessageToPage, false);
    port.start();
}
function SendMessageToPage(evt) {
    var date = new Date();
    var currentDate = null;
    do {
        currentDate = new Date();
    }
    while (currentDate - date < 10000);
    port.postMessage("Page said : " + evt.data +
    "\r\n Shared Worker Replied : Hello Page!");
}