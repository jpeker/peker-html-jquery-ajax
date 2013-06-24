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
  <!--asp:FormView ID="FormView1" runat="server"
AllowPaging="True"
DefaultMode="Edit"
DataKeyNames="EmployeeID"
SelectMethod="GetEmployees"
InsertMethod="InsertEmployee"
UpdateMethod="UpdateEmployee"
DeleteMethod="DeleteEmployee"
ItemType="SampleAppWebForms.Model.Employee"
>
<EditItemTemplate>
<fieldset>
<legend>Basic Details</legend>
<label for="FullName">Full Name :</label>
<asp:DropDownList ... SelectedValue='<//%# BindItem.TitleOfCourtesy %>'>
...
</asp:DropDownList>
<asp:TextBox ... required="required" Text="<//%# BindItem.FirstName %>"
PlaceHolder="First Name" autofocus="autofocus">...
<asp:TextBox ... required="required" Text="<//%# BindItem.LastName %>"
PlaceHolder="Last Name">...
<label for="txtBirthDate">Birth Date :</label>
<asp:TextBox ... TextMode="Date" Text="<//%# BindItem.BirthDate %>"
required="required" PlaceHolder="Birth Date" >...
</fieldset>
<fieldset>
<legend>Employment Details</legend>
<label for="lblEmployeeID">Employee ID :</label>
<asp:Label ... Text="<//%# BindItem.EmployeeID %>">...
<label for="txtDesig">Current Designation :</label>
<asp:TextBox ... required="required" Text="<//%# BindItem.Title %>"
PlaceHolder="Designation" list="lstTitles">...
<datalist id="lstTitles"></datalist>
<label for="txtHireDate">Hire Date :</label>
<asp:TextBox ... TextMode="Date" Text='<//%# BindItem.HireDate %>'
required="required" PlaceHolder="Hire Date">...
</fieldset>
<fieldset>
<legend>Contact Details</legend>
<label for="address">Address :</label>
<asp:TextBox ... required="required" Text="<//%# BindItem.Address %>"
PlaceHolder="Street Address">...
<asp:TextBox ... required="required" Text='<//%# BindItem.City %>'
PlaceHolder="City" >...
<asp:TextBox ... required="required" Text='<//%# BindItem.Country %>'
PlaceHolder="Country" >...
<asp:TextBox ... pattern="\d{5}(-\d{4})?" Text='<//%# BindItem.PostalCode %>'
required="required" PlaceHolder="Postal Code" >...
<label for="txtPhone">Home Phone :</label><br />
<asp:TextBox ... TextMode="Phone" Text='</%# BindItem.HomePhone %>'
PlaceHolder="(123) 123-1234" >...
</fieldset>
<asp:Button ... Text="Save" CommandName="Update" />
<asp:Button ... ID="btnNew" Text="Add New"
CommandName="New" formnovalidate="formnovalidate" />
<asp:Button ... ID="btnDelete" Text="Delete"
CommandName="Delete" formnovalidate="formnovalidate" />
</!--EditItemTemplate>
</asp:FormView-->  
</body>
</html>
