<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
    <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js">
    </script>
    <script type="text/javascript" >
  var worker;
        $(document).ready(function () {
        $("#getOrders").click(function () {
                $(this).attr("disabled", "disabled");
                $(this).val("Wait...");
                worker = new Worker("/Scripts/Processing.js");
                worker.addEventListener("message", ReceiveDataFromWorker, false);
                worker.addEventListener("error", HandleError, false);
                var settings = { "CustomerID": $("#customerID").val(),
                    "StartDate": $("#startDate").val(),
                    "EndDate": $("#endDate").val() };
                worker.postMessage(settings);
        });
        function ReceiveDataFromWorker(evt) {
            var data = evt.data;
            $("#orderTable").empty();
            $("#orderTable").append("<tr><th>Order ID</th><th>Customer ID</th><th>Order Date</th><th>Order Amount</th></tr>");
            for (var i = 0; i < data.length; i++) {
                $("#orderTable").append("<tr>" +
                "<td>" + data[i].OrderID + "</td>" +
                "<td>" + data[i].CustomerID + "</td>" +
                "<td>" + ToJSDate(data[i].OrderDate) + "</td>" +
                "<td>" + data[i].OrderAmount + "</td>" +
                "</tr>");
            }
            $("#getOrders").removeAttr("disabled");
            $("#getOrders").val("Get Orders");
        }
        function ToJSDate(value) {
            var pattern = /Date\(([^)]+)\)/;
            var results = pattern.exec(value);
            var dt = new Date(parseFloat(results[1]));
            return (dt.getMonth() + 1) + "/" + dt.getDate() + "/" + dt.getFullYear();
        }
        function HandleError(evt) {
            var msg = "There was an error in the worker thread!\r\n\r\n";
            msg += "Message : " + evt.message + "\r\n";
            msg += "Source : " + evt.filename + "\r\n";
            msg += "Line No. : " + evt.lineno;
            alert(msg);
        }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Order History</h3>
        <div>Customer ID :</div>
        <input id="customerID" type="text" />
        270
        <div>Start Date :</div>
        <input id="startDate" type="date" />
        <div>End Date :</div>
        <input id="endDate" type="date" />
        <br />
        <input id="getOrders" type="button" value="Get Orders" />
        <br />
        <table id="orderTable" border="1" cellpadding="3"></table>
    </form>
</body>
</html>
