<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employeeform.aspx.cs" Inherits="employeeform" %>

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
            $.ajax({
                url: 'employeeform.aspx/GetTitles',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (results) {
                    for (var i = 0; i < results.d.length; i++) {
                        $("#lstTitles").append("<option label='" + results.d[i] +
                        "' value='" + results.d[i] + "'></option>");
                    }
                },
                error: function (err) { alert(err.status + " - " + err.statusText); }
            });
            $("input[name$='btnUpdate']").click(function (e) {
                var birthDate = ToDate($("input[name$='txtBirthDate']").val());
                birthDate.setFullYear(birthDate.getFullYear() + 18);
                var hireDate = ToDate($("input[name$='txtHireDate']").val());
                var txtBirthDate = $("input[name$='txtBirthDate']").get(0);
                if ((hireDate.getTime() - birthDate.getTime()) < 0) {
                    txtBirthDate.setCustomValidity("Invalid Birth Date or Hire Date!");
                }
                else {
                    txtBirthDate.setCustomValidity("");
                }
                var pattern = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
                var value = $("input[name$='txtPhone']").val();
                var txtPhone = $("input[name$='txtPhone']").get(0);
                if (!pattern.test(value)) {
                    txtPhone.setCustomValidity("Invalid Telephone Number!");
                }
                else {
                    txtPhone.setCustomValidity("");
                }
            });
            function ToDate(input) {
                var parts = input.match(/(\d+)/g);
                return new Date(parts[0], parts[1] - 1, parts[2]);
            }
        });
    </script>
</head>
<body>
   
</body>
</html>
