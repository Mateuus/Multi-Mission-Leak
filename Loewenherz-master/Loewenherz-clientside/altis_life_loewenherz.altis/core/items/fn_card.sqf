#include <macro.h>
/*
    File: fn_card.sqf
    Author: Steve
    Description: 
	Win or lose, the system wins!
    Get some $$$.
*/
private["_winner"];
//Close inventory
closeDialog 0;

titleText["You scratch your card and...","PLAIN"];
sleep 3;
_winner = floor(random(20));
if(_winner < 18) exitWith {
	titleText["Win nothing :( May as well go again!","PLAIN"];	
};
if(_winner == 18) exitWith {
	titleText["You win 5k! Well done on breaking even! Try again!","PLAIN"];
	lhm_cash = lhm_cash + 5000;
};
if(_winner == 19) exitWith {
	titleText["You win 10k! Well done! Now buy two more tickets!","PLAIN"];
	lhm_cash = lhm_cash + 10000;
};


	


