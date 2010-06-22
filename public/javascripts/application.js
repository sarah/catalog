// http://jqueryfordesigners.com/broken-repeating-animations/
$(function() {
  $("a.index").hover(function(){
			$(this).stop().fadeTo(700, .1);
    },function(){
			$(this).stop().fadeTo(1000, 1);
   });

	// logo fade effect
  $("a.logo").hover(function(){
			$(this).stop().animate({ color: "#918ea0" }, 2000);
    },function(){
			$(this).stop().animate({ color: "#ccc" }, 2000);
   });  
});

