/*구글 지도의 길찾기 버튼*/

/**
 * 길찾기 버튼 
 */
 function CenterControl(controlDiv, map) {

	   // Set CSS for the control border.
	   var controlUI = document.createElement('div');
	   controlUI.style.backgroundColor = '#fff';
	   controlUI.style.border = '2px solid #fff';
	   controlUI.style.borderRadius = '3px';
	   controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
	   controlUI.style.cursor = 'pointer';
	   controlUI.style.marginTop = '10px';
	   controlUI.style.marginLeft = '8px';
	   controlUI.style.marginBottom = '20px';
	   controlUI.style.textAlign = 'center';
	   controlUI.title = 'Find';
	   controlDiv.appendChild(controlUI);
	   
	   
	   // Set CSS for the control interior.
	   var controlText = document.createElement('div');
	   controlText.style.color = 'rgb(25,25,25)';
	   controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
	   controlText.style.fontSize = '16px';
	   controlText.style.lineHeight = '30px';
	   controlText.style.paddingLeft = '5px';
	   controlText.style.paddingRight = '5px';
	   controlText.innerHTML =  "<img src='resources/icons/direction.png' onclick='openNav()'/>";
	   controlUI.appendChild(controlText);

	   // Setup the click event listeners: simply set the map to Chicago.
	   controlUI.addEventListener('click', function() {
		   
	 
	   });
	 }