/*


	Author: Don Richter
	Description: Parking-Ticket 

*/




if(life_parken) exitWith {hint "Du hast bereits ein Parkticket gekauft..."};

life_parken = true;
_tor = _this select 3;


switch (_tor) do {

	case "kavala1":{
	
		if(life_cash < 300 && playerside == civilian) exitWith {hint "Ein Parkticket kostet 300€, bitte hab das Geld in Bar dabei."}; 
		if(playerside == civilian) then {life_cash= life_cash - 300;};
		hint "Das Parkticket wird gedruckt..."; 
		einfahrt_automat say3d "ticketdruck";
		[true,"parkticket",1] call life_fnc_handleinv;
		WaitUntil{sleep 0.1; life_inv_parkticket >= 1};
		sleep 4;
		einfahrt_1 animate ["Door_1_rot",1];
		einfahrt_1 animate ["Door_2_rot",1];
		waitUntil {sleep 0.1; vehicle player distance einfahrt_1 > 10};
		einfahrt_1 animate ["Door_1_rot",0];
		einfahrt_1 animate ["Door_2_rot",0];

	};
		
	case "kavala2":{
	
		hint "Das Parkticket wird entwertet."; 
		if!([false,"parkticket",1] call life_fnc_handleinv) exitWith {hint "Du besitzt Parkticket, besorg die lieber eins, ansonsten kommst du nicht vom Parkplatz!"}; 
		ausfahrt_automat say3d "ticketentwerten";
		sleep 2; 
		ausfahrt_1 animate ["Door_1_rot",1]; 
		ausfahrt_1 animate ["Door_2_rot",1]; 
		waitUntil {sleep 0.1; vehicle player distance ausfahrt_1 > 10}; 
		ausfahrt_1 animate ["Door_1_rot",0];
		ausfahrt_1 animate ["Door_2_rot",0];		
	};
	

};
life_parken = false;
