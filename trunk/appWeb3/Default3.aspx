<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js">
    </script>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#Button1").click(function () {
                 url = "Service.svc/Convert";
                 data = '{"Value":"' + $("#Text1").val() + '","Unit":"' + $("#Dll").val() + '"}';
                 $.ajax({
                     type: "POST",
                     url: url,
                     data: data,
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: OnSuccess,
                     error: OnError
                 })
             });
         });

         function OnSuccess(results) {
             alert("Converted Temperature : " + results.Value + " " + results.Unit);
         }
         function OnError(err) {
             alert(err.status + " - " + err.statusText);
         }
             </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <span>Enter Temperature :</span>
         <br />
        <input id="Text1" type="text" /><asp:DropDownList ID="Dll" runat="server"></asp:DropDownList>
       <br />
          <input id="Button1" type="button" value="Convert" /></div>
    </form>
</body>
</html>
