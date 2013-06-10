<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

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
            $("#GridView1 th").parent().addClass("HeaderRow");
            $("#GridView1 tr:not(.HeaderRow):odd").addClass("Row");
            $("#GridView1 tr:not(.HeaderRow):even").addClass("AlternateRow");
            $("#GridView1 tr:not(.HeaderRow)").hover(function () {
                $(this).addClass('HoverRow');
            }, function () {
                $(this).removeClass('HoverRow');
            }).click(function () {
                if ($(this).hasClass("HeaderRow")) {
                    alert("This is header row. Can't get EmployeeID!");
                }
                else {
                    alert("You selected Employee ID :" + $("td:first", this).text());
                }
            });
        });
        </script>
</head>
<body>
    <form id="form1" runat="server">

         <div>
    
             <asp:GridView ID="GridView1" runat="server">
             </asp:GridView>
    
    </div>
    </form>
</body>
</html>
