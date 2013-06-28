<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="/Scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/modernizr-2.6.2.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=<%= ConfigurationManager.AppSettings["GoogleMapsAPIKey"] %>&sensor=false">
</script>
    <script type="text/javascript">
        $(document).ready(function () {
            if (!Modernizr.geolocation) {
                alert("This browser doesn't support the Geolocation API.");
                return;
            }
            defaultPos = new google.maps.LatLng(18.916667, 72.9);
            var mapOptions = {
                center: defaultPos,
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map($("#divMap").get(0), mapOptions);
            $("#btnShowCurrent").click(function () {
          
                window.navigator.geolocation.getCurrentPosition(OnSuccess, OnError);
            });
            function OnSuccess(position) {
                var curPos = new google.maps.LatLng(position.coords.latitude,
  position.coords.longitude);
                map.setCenter(curPos);
                var callout = new google.maps.InfoWindow();
                callout.setContent("Peker vive aqui");
                callout.setPosition(curPos);
                callout.open(map);
            }
            function OnError(err) {
                alert(err.message);
                map.setCenter(defaultPos);
                var callout = new google.maps.InfoWindow();
                callout.setContent("This is the default location.");
                callout.setPosition(defaultPos);
                callout.open(map);
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 <input id="btnShowCurrent" type="button" value="Show Current Location" />
    </div>
        
               <div id="divMap" style="width:500px;height:380px;"></div>
       
    </form>
</body>
</html>

