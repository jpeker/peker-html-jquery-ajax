<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js">
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var eventData = {
                MaxLength: 20,
                Type: 'Remaining',
                AllowOverflow: true,
                CounterId: 'counter',
                NormalCss: 'NormalCounter',
                WarningCss: 'WarningCounter'
            };
            $("#textarea").keyup(eventData, OnKeyUp);
            $("#textarea").blur(eventData, OnBlur);
            $("#textarea").keyup();
            $("#submit").click(function (event) {
                if (!confirm("Do you wish to submit the form?")) {
                    event.preventDefault();
                }
            });
            function OnKeyUp(event) {
                var id = "#" + event.target.id;
                var counterid = "#" + event.data.CounterId;
                var text = $(id).val();
                if (text.length > event.data.MaxLength) {
                    if (!event.data.AllowOverflow) {
                        $(id).text(text.substring(0, event.data.MaxLength));
                    }
                }
                var diff = 0;
                if (event.data.Type == 'Remaining') {
                    diff = event.data.MaxLength - $(id).val().length;
                    if (diff < 0) {
                        $(counterid).removeClass(event.data.NormalCss);// falta la hoja de estilo
                        $(counterid).addClass(event.data.WarningCss);
                    }
                    else {
                        $(counterid).removeClass(event.data.WarningCss);
                        $(counterid).addClass(event.data.NormalCss);
                    }
                }
                else {

                   
                     }
                $(counterid).text(diff);
            }
            function OnBlur(event) {
                var id = "#" + event.target.id;
                $(id).keyup();
            }
        })

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <span>Enter some text :</span>
        <br />
        <textarea id="textarea" rows="3" cols="50" class="TextArea"></textarea>
        <br />
        <span class="NormalCounter">Character counter : </span>
        <span id="counter" class="NormalCounter"></span>
        <br />
        <br />
        <asp:Button ID="submit" runat="server" Text="Submit"  />
        <br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
