<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="/Scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/modernizr-2.6.2.js"></script>
   
    <script type="text/javascript">
        $(document).ready(function () {
            if (!Modernizr.geolocation) {
                alert("This browser doesn't support the Geolocation API.");
                return;
            }
            $("#btnShowCurrent").click(function () {
                var options = {
                    enableHighAccuracy: false,
                    timeout: 5000,
                    maximumAge: 3000
                };
                window.navigator.geolocation.getCurrentPosition(OnSuccess, OnError, options);
            });
            function OnSuccess(position) {
                var html = "";
                html += "<tr><td>Latitude : </td>";
                html += "<td>" + position.coords.latitude + "</td></tr>";
                html += "<tr><td>Longitude : </td>";
                html += "<td>" + position.coords.longitude + "</td></tr>";
                html += "<tr><td>Accuracy : </td>";
                html += "<td>" + position.coords.accuracy + "</td></tr>";
                html += "<tr><td>Altitude : </td>";
                html += "<td>" + position.coords.altitude + "</td></tr>";
                html += "<tr><td>Altitude Accuracy : </td>";
                html += "<td>" + position.coords.altitudeAccuracy + "</td></tr>";
                html += "<tr><td>Heading : </td>";
                html += "<td>" + position.coords.heading + "</td></tr>";
                html += "<tr><td>Speed : </td>";
                html += "<td>" + position.coords.speed + "</td></tr>";
                html += "<tr><td>Timestamp : </td>";
                html += "<td>" + new Date(position.timestamp).toString() + "</td></tr>";
                $("#tblInfo").append(html);
            }
            function OnError(err) {
                alert(err.code + " : " + err.message);
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 <input id="btnShowCurrent" type="button" value="Show Current Location" />
    </div>
        <div>
               <table id="tblInfo" border="1" ></table>
        </div>
    </form>
</body>
</html>
