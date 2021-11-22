$(document).ready(function(){
//on click register,hide login and show registration
$("#signup").click(function(){
 $("#first").slideUp("slow", function(){
 	$("#second").slideDown("slow");
 });
});


//on click login,hide register and show login
$("#signin").click(function(){
 $("#second").slideUp("slow", function(){
 	$("#first").slideDown("slow");
});
});
});