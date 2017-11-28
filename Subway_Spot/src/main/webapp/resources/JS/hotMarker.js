function getHotMarker(valuelat, valuelng){
     $.ajax({
          url: "./Hotplace.sub",
          data: {lat: valuelat, lng: valuelng},
          type: "get",
          dataType: "json",
          success: function(data) {
              var iw_content = document.getElementById("wrapper1");
              for(var i = 0; i < data.length; i++){
                 var marker = new google.maps.Marker({   
                  position: new google.maps.LatLng(data[i].xpoint, data[i].ypoint),
                  icon: data[i].category,
                  map: map,
                  clickable: true, draggable: false                 
                 });

                 google.maps.event.addListener(marker, "click", function(){

                    //★★★★★ 
                    var temp = this;
                    var lat  = this.position.lat();
                    var lng  = this.position.lng();

                    $.ajax({                          
                       url : "./Tabinfo.sub",
                       data : {lat : lat, lng : lng},
                       type : "get",
                       dataType : "json",
                       success : function(data){                          
                          //tab 펼침
                          infowindow.setContent(iw_content);
                             iw_content.style.display = "block";
                             infowindow.open(map, temp); 
                             var hotinfo = data;
                             var sethotinfo = document.getElementById('firstCard1');
                             sethotinfo.innerHTML =
                              "<div id = 'sethotinfo', class='sethotinfo'>" +
                                 "<tr>" +
                                 "<td height=180 width=300><b>"+hotinfo[0].station+"<br></b>" +
                                 "<p>"+hotinfo[0].name+"<br></p>" +
                                 "<p>"+hotinfo[0].ename+"<br></p>" +
                                 "<p>"+hotinfo[0].address+"<br></p>" +
                                 "<p>"+hotinfo[0].info+"</p>" +
                                 "</td>" +
                                 "<td height=150 width=300>" +
                                   "<img src="+hotinfo[0].imagepath+" style=width:150px;height:150px;></td>" +
                                 "</tr>" +
                                   "</div>"      
                                  ;
                             var hotinfoimage = document.getElementById('firstCard2');
                             hotinfoimage.innerHTML =
                                "<div id = 'replyHotpl', class='replyHotpl'>" +
                                   "<td>" +
                                   "<tr><textarea name=review form=inform cols=40 rows=5 placeholder='Reply this HotPlace'></textarea></tr>" +
                                   "</td>" +
                                   "<td>" +
                                   "<tr><input type=text id=nickname name=nickname placeholder='Enter Nickname'></tr>" +
                                   "<tr><input type=password id=password name=password placeholder='Enter Password'></tr>" +
                                   "<tr><input type=button id=Reply value=Reply padding=2></tr>" +
                                   "<tr><input type=button id=Cancel value=Cancel padding=2></tr>" +
                                    "</td>" +
                                "</div>"
                                ; 
                       },
                       error : function(xhr, statusText, err){
                          console.log(statusText);
                          alert("FAIL!!");
                       }                           
                    });
                });                
             }
          },
          error: function(xhr, statusText, err) {
             console.log(statusText);
             alert("FAIL!!");
          }
       });
} 