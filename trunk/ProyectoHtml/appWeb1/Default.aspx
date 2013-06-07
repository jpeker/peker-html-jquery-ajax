<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">
  
    <header>
        <h1>Play random Audio and Video files!</h1>
              <script type="text/javascript">
                  $(document).ready(function () {
                      if (!Modernizr.audio) {
                          alert('Your browser does not support the HTML5 audio tag.');
                          return false;
                      }
                      if (!Modernizr.video) {
                          alert('Your browser does not support the HTML5 video tag.');
                          return false;
                      }
                      $("#playmusic").click(function () {
                          $.ajax({
                              type: "POST",
                              url: 'default.aspx/GetAudio',
                              contentType: "application/json; charset=utf-8",
                              dataType: "json",
                              success: function (results) {
                                  $("#audios")[0].src = results.d;
                                  $("#audios")[0].play();
                            
                              },
                              error: function (err) {
                                  alert(err.status + " - " + err.statusText);
                              }
                          })
                      });
                      $("#playvideo").click(function () {
                          $.ajax({
                              type: "POST",
                              url: 'default.aspx/GetVideo',
                              contentType: "application/json; charset=utf-8",
                              dataType: "json",
                              success: function (results) {
                                  $("#videos")[0].src = results.d;
                                  $("#videos").trigger("play");
                              },
                              error: function (err) {
                                  alert(err.status + " - " + err.statusText);
                              }
                          })
                      });
                  });
    </script>
    </header>
    

    <div>
        <input type="button" id="playmusic" value="Play Random Audio File" />
        <br />
        <br />
        <audio id="audios" src="Medios/10. Dulce Amor (Solo Un Latido).mp3" controls="controls" ></audio>
        <br />
        <input type="button" id="playvideo" value="Play Random Video File" />
        <br />
        <br />
        <video id="videos" src="Medios/dibujo.mp4" controls=""></video>
    </div>
    
</asp:Content>
