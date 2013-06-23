<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js">
    </script>
      <script type="text/javascript" src="/Scripts/modernizr-2.6.2.js"></script>
    <script type="text/javascript">
       /* var storage = window.localStorage;
        $(document).ready(function () {
            if (!Modernizr.localstorage) {
                alert("This browser doesn't support HTML5 Local Storage!");
            }
            $("#store").click(OnStoreClick);
            $("#clear").click(OnClearClick);
         
        });
        function OnStoreClick(event) {
            var key = $("#keyName").val();
            var value = $("#keyValue").val();
            storage.setItem(key, value);
            $("#tblItems").empty();
            for (var i = 0; i < storage.length; i++) {
                $("#tblItems").append("<tr><td>" + storage.key(i) + " = " +
                storage.getItem(storage.key(i)) + "</td></tr>");
            }
        }
        function OnClearClick(event) {
            storage.clear();
            $("#tblItems").empty();
        }*/
        // conversion de fecha
        $(document).ready(function () {
            var storage = window.localStorage;
            storage["date"] = new Date(2012,5,15);
            var date1 = storage["date"];
            try{
                alert("Without conversion Year = " + date1.getFullYear());
            }
            catch(e){
                alert("Data is not of date type!");
            }
            var date2 = new Date(storage["date"]);
            try {
                alert("With conversion Year = " + date2.getFullYear());
            }
            catch (e) {alert("Data is not of date type!");
            }
        });
        
        </script>
</head>
<body>
    
    <div>
    web storage demo
    </div>
        <div>
        <table border="1">

<tr>
<td>key name</td>
<td>
    <input id="keyName" type="text" /></td>
</tr>
<tr>
<td>value</td>
<td>
    <input id="keyValue" type="text" /></td>
</tr>

</table>
            </div>
        <div>
            <input id="store" type="button" value="store data" /><input id="clear" type="button" value="clear data" />
        </div>
        <br />
        <div>

            <table id="tblItems" style="width: 100%;">
                <tr>
                    <td>&nbsp;</td>
                 
                </tr>
                <tr>
                    <td>&nbsp;</td>
                   
                </tr>
                <tr>
                    <td>&nbsp;</td>
                 
                </tr>
            </table>
        </div>
    
</body>
</html>
