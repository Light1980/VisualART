function countDown() {
    var date_dest = new Date("2018/09/16 00:00:00");
	var date_current = new Date();

	var date_countdown = (date_dest.getTime() - date_current.getTime())

	
	date_countdown_day = parseInt(date_countdown / 1000 / 3600 / 24 ); 
	date_countdown_hours = parseInt((date_countdown - (date_countdown_day*24*3600*1000)) / 1000 / 3600)
    	date_countdown_minutes = parseInt((date_countdown - (date_countdown_day*24*3600*1000 + date_countdown_hours * 3600 * 1000))/ 1000/60)
    	date_couontdown_seconds = parseInt((date_countdown - (date_countdown_day*24*3600*1000 + date_countdown_hours * 3600 * 1000 + date_countdown_minutes*60*1000))/1000)
  
    	//console.log(date_countdown);
	//date_countdown = parseInt(date_countdown);
	//console.log(date_countdown);

	var p = document.getElementById("count_down");

	p.innerHTML = date_countdown_day + " Days " + date_countdown_hours + " Hours " + date_countdown_minutes + " Minutes " + date_couontdown_seconds + " Seconds";
  
    	//console.log(p.innerHTML);
  
  
    
}


var begin = setInterval(countDown,1000);
