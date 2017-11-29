function getHotMarker(valuelat, valuelng){
     $.ajax({
          url: "./Hotplace.sub",
          data: {lat: valuelat, lng: valuelng},
          type: "get",
          dataType: "json",
          success: function(data) {
              var iw_content = document.getElementById("wrapper1");
              var iw_content2 = document.getElementById("firstCard2");
              
              for(var i = 0; i < data.length; i++){
                 var marker = new google.maps.Marker({   
                  position: new google.maps.LatLng(data[i].xpoint, data[i].ypoint),
                  icon: data[i].category,
                  map: map,
                  clickable: true, draggable: false                 
                 });

                 google.maps.event.addListener(marker, "click", function(){
                    
                   //tab기능 실행
                     
                    infowindow = new google.maps.InfoWindow();
                     var tabs = new TabCard("firstTabs", "firstCard");

                    //★★★★★ 
                    var temp = this;
                    var lat  = this.position.lat();
                    var lng  = this.position.lng();

                    $.ajax({                          
                       url : "./Tabinfo.sub",
                       data : {lat : lat, lng : lng},
                       type : "post",
                       dataType : "json",
                       success : function(data){                          
                          //tab 펼침
                          infowindow.setContent(iw_content);
                       
                             iw_content.style.display = "block";
                             iw_content2.style.display="none";
                             
                             infowindow.open(map, temp); 
                             var hotinfo = data;
                             var sethotinfo = document.getElementById('firstCard1');
                             $(".hotinfoimage").remove();   
                             
                             if(hotinfo[0].imagepath==''){
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
                                          "</td>" +
                                        "</tr>" +
                                          "</div>"      
                                         ; 
                             }
                             else{
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
                                   "<img src='./images/hotplace/"+hotinfo[0].imagepath+"' style='width:150px;height:150px;'></td>" +
                                 "</tr>" +
                                   "</div>"      
                                  ;
                             }
                             
                             var hotinfoimage = document.getElementById('replyHotpl');
                             $(hotinfoimage).append(
                               "<div class='hotinfoimage'>" +
                                "<form method='POST' id='wfrm'>" +
                               "<input type='hidden' name='hotplacecode' id='hotplacecode' value='"+hotinfo[0].hotplacecode+"'>" +
                               "<input type='hidden' name='xpoint' id='xpoint' value='"+hotinfo[0].xpoint+"'>" +
                               "<input type='hidden' name='ypoint' id='ypoint' value='"+hotinfo[0].ypoint+"'>" +
                                   "<tr>" +
                                   "<td><textarea name='body' id='body' cols=40 rows=5 placeholder='Reply this HotPlace'></textarea></td>" +
                                   "</tr>" +
                                   "<td>" +
                                   "<td><input type='text' id='nick' name='nick' placeholder='Enter Nickname'></td>" +
                                   "<td><input type='password' id='pw' name='pw' placeholder='Enter Password'></td>" +
                                   "<td><input type=button id='sBtn' value='Reply' padding=2></td>" +
                                   "<td><input type=button id='cBtn' value='Cancel' padding=2></td>" +
                                    "</tr>" +  
                                    "</form>" +                                 
                                    "<hr>" +
                                    "</div>" 
                                )
                             
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