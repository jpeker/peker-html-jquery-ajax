<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js">
    </script>
    <script type="text/javascript" >


        $(document).ready(function () {
            $("#FileUpload12").change(function (evt) {
                alert(evt.target.files.length + " file(s) were selected!");
            });
            $("#ImageButton1").click(function (evt) {
                $("#FileUpload12").click();
                evt.preventDefault();
            });
        });

    </script>
    <style>
        .hidden {
display:none;
}
        </style>
</head>
<body>

  
        <!--input id="File1" type="file" />
<input id="File2" type="file" multiple="multiple" /-->
 
        <form id="form2" runat="server">
            <asp:FileUpload ID="FileUpload12" runat="server" AllowMultiple="true"
                CssClass="hidden" />
            <asp:Label ID="Label1" runat="server" CssClass="message"
                Text="Click on the image below to select files">
            </asp:Label>
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server"
                ImageUrl="~/Images/file.jpg" />
        </form>
   

</body>
</html>
