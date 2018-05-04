function countDown() {
    var date_dest = new Date("2018/09/16 00:00:00");
	var date_current = new Date();

	var date_countdown = (date_dest.getTime() - date_current.getTime())

	
	date_countdown = date_countdown / 1000 ; 
	//console.log(date_countdown);
	//date_countdown = parseInt(date_countdown);
	//console.log(date_countdown);

	var p = document.getElementById("count_down");

	p.innerHTML = date_countdown;
  
    //console.log(p.innerHTML);
  
  
    
}


var begin = setInterval(countDown,1000);