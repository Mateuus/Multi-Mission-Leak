/*
File: bank teller payments
*/

if(has_job) exitwith { ["You already have a job! Press Shift + 4 to quit!", false] spawn domsg;};

if(side player != civilian) exitwith { ["Civilians Only!", false] spawn domsg;  };
if(life_NewsJobs) exitWith {
["You are already signed up as a Bank Worker.", false] spawn domsg; 
};
if(vest player find "V_Press_F" isEqualTo -1) exitwith {
	["You need a Press Vest to work here!", false] spawn domsg; 
};
newsspot = getpos player;

has_job = true;
life_NewsJobs = true;


["You get paid extra for a video camera out with a press vest on..", false] spawn domsg; 
["Being inside a vehicle reduces your payment..", false] spawn domsg; 
["Staying in the same area reduces your payment..", false] spawn domsg; 
_fkit = 45;
player setVariable["ATM_MAN", true, true];
while{_fkit > 0 && life_NewsJobs } do {
	uiSleep 300;
	_curWep = currentWeapon player;
	if(isNull objectParent player) then {

		if(vest player == "v_press_f" && (getpos player) distance newsspot > 100) then
		{
			["bank","add", 1000] call life_fnc_handleCash;
			["You just got paid an extra $1000", false] spawn domsg; 
			NewsSpot = getpos player;
			["Add",10] call fnc_karma;
		};

		if(vest player == "v_press_f" && _curWep == "Tv_Camera" && (getpos player) distance newsspot > 100) then
		{
			["bank","add", 1000] call life_fnc_handleCash;
			["You just got paid an extra $1000", false] spawn domsg; 
			NewsSpot = getpos player;
			["Add",15] call fnc_karma;
		};
		if(vest player == "v_press_f" && _curWep == "Tv_Camera" && (getpos player) distance newsspot < 100) then
		{
			["bank","add", 250] call life_fnc_handleCash;
			["You just got paid an extra $250", false] spawn domsg; 
			NewsSpot = getpos player;
			["Add",5] call fnc_karma;
		};
		if(vest player == "v_press_f" && (getpos player) distance newsspot < 100) then
		{
			["bank","add", 250] call life_fnc_handleCash;
			["You just got paid an extra $250", false] spawn domsg; 
			NewsSpot = getpos player;
			["Add",2] call fnc_karma;
		};					
	} else {
		if(vest player == "v_press_f" && (getpos player) distance newsspot > 100) then
		{
			["bank","add", 150] call life_fnc_handleCash;
			["You just got paid an extra $150", false] spawn domsg; 
			NewsSpot = getpos player;
			["Add",5] call fnc_karma;
		};	

	};
	_fkit = _fkit - 1;
	if(_fkit == 5) then {
		["Your News payments stop in 5 minutes..", false] spawn domsg; 
	};
};
life_NewsJobs = false;

["Your News payments have stopped", false] spawn domsg; 

has_job = false;