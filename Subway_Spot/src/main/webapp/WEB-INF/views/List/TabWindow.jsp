 <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.replycard {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 98%;
}
.nick {
    font-size: 16px;
}
.body {
    font-size: 14px;
}
.date {
    font-size: 11px;
    text-align : right;
}

</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   // 동적으로 생성되는 요소의 이벤트는 라이브 또는 딜리케이트 방식으로 설정해야 함
   $(document).on("click", "#sBtn", function(){
      //e.preventDefault();
      var params = $("#wfrm").serialize();
      console.log("params : " + params)
      $.ajax({
         url:"ReplyProc.sub",
         type: "post",
         data: params,
         success: function(result, statusText, xhr) {
            location.href = 'ReplyList.sub'
         },
         error: function(xhr, statusText, error) {
            console.log(statusText);
         }
      });   
   });
});
</script>
<body>
<!-- Tabs of first marker -->
   <div id="wrapper1" class="wrapper">
   <div id="firstTabs" class="tabs">   
      <span data-name="1">HotSpot Information</span>
      <span data-name="2">Reply</span>
   </div>
   <div id="firstCard1" class="cardContent">
      <div class="sethotinfo" id="sethotinfo"> 
       </div>
   </div>
   <div id="firstCard2" class="cardContent">
      <div class="replyHotpl" id="replyHotpl"> 
      </div>
      <div class="replycard" id="replycard" style= 'padding:2px 10px;'>
      </div>
   </div>
   </div>
   
</body>
</html>