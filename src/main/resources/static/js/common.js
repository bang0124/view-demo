/* tabMenu */
function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabContent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
   // evt.currentTarget.className += " active";
}


/* select */
$(function(){
	$('select').selectlist({
		zIndex: 100,
		width: '100%',
		height: 35
	});		
})

/*각각의 페이지 js 에 해당 함수 호출 하도록*/
//function doSelection(selected_val){
//}


/* toggle */
$(function() {
	$('#toggle').click(function() {
		$('.toggle').slideToggle('fast');
	    return false;
	});
	$('#toggle2').click(function() {
		$('.toggle2').slideToggle('fast');
		return false;
	});
	$('#toggle3').click(function() {
		$('.toggle3').slideToggle('fast');
		return false;
	});
});
