<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js">
    </script>
    <script type="text/javascript">
        var files;
        $(document).ready(function () {
            $("#FileUpload1").change(OnChange);
            $("#FileUpload2").change(OnChange);
            $("#ImageButton1").click(function (evt) {
                $("#FileUpload2").click();
                evt.preventDefault();
            });
            var basket;
            basket = document.getElementById("divBasket");
            basket.addEventListener("dragenter", OnDragEnter, false);
            basket.addEventListener("dragover", OnDragOver, false);
            basket.addEventListener("drop", OnDrop, false);
        });
        function OnChange(evt) {
            files = evt.target.files;
            ShowFileDetails(files);
        }
        function OnDrop(evt) {
            evt.stopPropagation();
            evt.preventDefault();
            files = evt.dataTransfer.files;
            ShowFileDetails(files);
        }
        function ShowFileDetails(files) {
            $("#Table1").empty();
            $("#Table1").append("<tr><th>File Name</th><th>Size</th><th>MIME Type</th><th>Preview</th></ tr>");
            for (var i = 0; i < files.length; i++) {
                if (files[i].type == "image/jpeg" ||
                files[i].type == "image/png" ||
                files[i].type == "image/gif") {
                    $("#Table1").append("<tr><td>" + files.item(i).name +
                    "</td><td>" + files[i].size +
                    "</td><td>" + files[i].type +
                    "</td><td><a href='#'data-file-index='" +
                    i + "'>Show</a></td></tr>");
                }
                else {
                    alert("Only image files are allowed. Other files will be ignored!");
                }
            }
            UploadFiles();
            $("a").hover(ShowPreview, HidePreview);
        }
        function ShowPreview(evt) {
            var reader = new FileReader();
            $(reader).bind("load", function (e) {
                var imgSrc = e.target.result;
                $("#filePreview").attr('src', imgSrc);
            });
            var fileIndex = $(evt.target).attr('data-file-index');
            reader.readAsDataURL(files[fileIndex]);
        }
        function HidePreview(evt) {
            $("#imgPreview").attr('src', '');
        }
        function UploadFiles() {
            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            $.ajax({
                type: "POST",
                url: "UploadFiles.ashx",
                contentType: false,
                processData: false,
                data: data,
                success: function (result) {
                    alert(result);
                },
                error: function () {
                    alert("There was error uploading files!");
                }
            });
        }
    </script>
    <style>
        .hidden
        {
            display: none;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <th>
                        <asp:Label ID="Label1" runat="server" Text="1. File Field"
                            CssClass="message">
                        </asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="Label2" runat="server" Text="2. Custom Button"
                            CssClass="message">
                        </asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="Label3" runat="server" Text="3. Drag & Drop"
                            CssClass="message">
                        </asp:Label>
                    </th>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" />
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="true"
                            CssClass="hidden" />
                        <asp:ImageButton ID="ImageButton1" runat="server"
                            ImageUrl="~/Images/file.jpg" />
                    </td>
                    <td>
                        <div id="divBasket" class="dropDiv"></div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="divBlock">
            <table id="Table1" border="1" cellpadding="3"></table>
        </div>
        <div class="divBlock">
            <img id="filePreview" />
        </div>
    </form>
</body>
</html>
