
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
	  console.log("this.cardid : " + this.cardid);
	  console.log(this);
	  this.newcard = this.cardid + num;  
	  if (!this.card) this.card = this.newcard;
	  // Switch cards
	  console.log("this.cardid : " + this.cardid + ", newcardid : " + this.newcard + ", newcardid : " + this.newcardid);
	  document.getElementById(this.card).style.display = "none";
	  document.getElementById(this.newcard).style.display = "block";

	  // Store active card
//	  this.card = this.newcard;

	  // Handle tab events
	  for (var i = 0, tab; tab = tabsdiv.getElementsByTagName("span")[i]; i++) {

	    // Make clicked tab active and
	    // unregister event listener for active tab
		  console.log("1111 = " + tab.getAttribute("data-name"));
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
	     }

	     tab.onmouseout = function() {
	      this.className = "passiveTab";
	     }

	     tab.onclick = function() {
	      // 'this' refers to the tab here
	      var tabnum = this.getAttribute("data-name");
	      var label = this.firstChild.nodeValue;
	      me.handleTabs(tabnum);
	      // Displays street view in tab #2 
	      if (tabnum == 2) {
	    	  //viewStreet(me.card, me.point);
	      // Display either mini map or video in tab #3
	      }
	      else if (label == "Mini Map"){
	         //seeMiniMap(me.card, me.point);
	      }
	      else if (label == "Video"){ 
	        // showVideo(me.card);
	      }

	      // Stop possibly running video
	      if (tabnum != 3) {
	        //if (msie) removeVideo();
	        //else if (player) player.pauseVideo();
	      }
	      return false;
	     }
	    }
	  }
}


function viewStreet(div, point) {

  /*var g = google.maps;
  var pano = new g.StreetViewPanorama(document.getElementById(div), {
    position: point });
//  map.setStreetView(pano);
 pano.setVisible(true);*/
}


function seeMiniMap(div, point) {

/*  var g = google.maps;
  var mini = new g.Map(document.getElementById(div), {
    center: point,
    zoom: 18,
    streetViewControl: false,
    mapTypeId: "hybrid",
    mapTypeControlOptions: {
     style: g.MapTypeControlStyle.DROPDOWN_MENU
    }
  });*/
}

function getTabId(){
	   var iw_content = document.getElementById("wrapper1");
	   return iw_content;
	}

window.onload = getTabId();
