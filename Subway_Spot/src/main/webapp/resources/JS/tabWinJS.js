
/**
 * TabWindow
 * @param tabid
 * @param cardid
 * @returns
 */
function TabCard(tabid, cardid){
	 this.tabid = tabid;
	 this.cardid = cardid;
	 this.handleTabs = handleTabs;
	 this.handleTabs(1);

}

function handleTabs(num){	
	var me = this;
	  var tabsdiv = document.getElementById(this.tabid);
	  this.newcard = this.cardid + num;
	  if (!this.card) this.card = this.newcard;
	  // Switch cards
	  document.getElementById(this.card).style.display = "none";
	  document.getElementById(this.newcard).style.display = "block";

	  // Store active card
	  this.card = this.newcard;

	  // Handle tab events
	  for (var i = 0, tab; tab = tabsdiv.getElementsByTagName("span")[i]; i++) {
		 
	    // Make clicked tab active and
	    // unregister event listener for active tab
		
	    if (tab.getAttribute("data-name")*1 == num) {
	     tab.className = "activeTab";
	     tab.onmouseover = null;
	     tab.onmouseout = null;
	     tab.onclick = null;
	    }
	    // Register mouse event listener for tabs
	    else {

	     // Reset tabs
	     tab.className = "passiveTab";

	     tab.onmouseover = function() {
	      this.className = "hoverTab";
	     };

	     tab.onmouseout = function() {
	      this.className = "passiveTab";
	     };

	     tab.onclick = function(value, index) {
	      // 'this' refers to the tab here
	      var tabnum = this.getAttribute("data-name")*1;
	      var label = this.firstChild.nodeValue;
	      me.handleTabs(tabnum);
	      
	      var code=hotplacecode;
	      // Displays street view in tab #2 
	      if (tabnum == 2) {
	    	  getReply();
	      }
	      else if (label == "Mini Map"){
	      }
	      else if (label == "Video"){ 
	      }

	      if (tabnum != 3) {

	      }
	      return false;
	     };
	    }
	  }
}

function getReply(){
	 $.ajax({
         url: "ReplyList.sub",
         data: {num : hotplacecode.value},
         type: "POST",
         dataType: "json",
         success: function(data) {
                $(".hotinfoimage").show();
                var replylist = data;
                var replycard = document.getElementById('replycard');
                $(replycard).empty();
                replylist.forEach(function(value, index){ 
                	
                    $(replycard).append(                               
                       "<div class='replycard'>" +
                       "<p class='nick'><b>&nbsp;&nbsp;"+value.nick+"</b></p>" +
                       "<p class='body'>&nbsp;&nbsp;&nbsp;"+value.body+"</p>" +
                       "<p class='date'><i><b>"+value.date+",</b> "+value.time+"&nbsp;&nbsp;&nbsp;&nbsp;</i></p>" +
                       "</div>" 
                    )   
                });
            },
         error(xhr, statusText, error){
            console.log(statusText);
         }
     });
}

function getTabId(){
	   var iw_content = document.getElementById("wrapper1");
	   return iw_content;
	}

window.onload = getTabId();
