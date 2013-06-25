<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   
    <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js">
    </script>
    <script type="text/javascript" >

        $("div").each(function () {
            this.addEventListener('dragstart', OnDragStart, false);
            this.addEventListener('drop', OnDrop, false);
        });

    </script>
</head>
<body>
<div class="myclass" draggable="true">Some content</div>
</body>
</html>
