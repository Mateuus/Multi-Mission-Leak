/*
	fn_carSalesman.sqf
*/

if(has_job) exitwith { ["You already have a job! Press Shift + 4 to quit!", false] spawn domsg;};
if(side player != civilian) exitwith {
	["Civilians Only!", false] spawn domsg;
};
if(life_carSalesman) exitWith {
	["You are already signed up as a car salesman.", false] spawn domsg; 
};
if(uniform player find "KAEL_SUITS" isEqualTo -1) exitwith {
	["You need a suit to be a car salesman.", false] spawn domsg; 
};

has_job = true;
life_carSalesman = true;
carSalesmanList pushBack player;
publicVariable "carSalesmanList";
player setVariable["Salesman", true, true];
["You get paid extra for staying around the dealership and a 10% commission for selling cars!", false] spawn domsg; 

_fkit = 45;
while{_fkit > 0 && life_carSalesman && !deadPlayer} do {
	uiSleep 60;

	if(player distance showRoom < 35 || (!isNull objectParent player && life_onTestDrive)) then {
		if(uniform player find "KAEL_SUITS" != -1) then {
			["bank","add", 120] call life_fnc_handleCash;
			["You just got paid an extra $120", false] spawn domsg; 
		};
	};
	if(player distance showRoom > 35 && !life_onTestDrive) exitwith {
		["You were too far from the dealership and have been fired.", false] spawn domsg;
	};
	_fkit = _fkit - 1;
	if(_fkit == 5) then {
		["Your car salesman payments stop in 5 minutes.", false] spawn domsg; 
	};
};

has_job = false;
life_carSalesman = false;
carSalesmanList deleteAt (carSalesmanList find player);
publicVariable "carSalesmanList";
player setVariable["Salesman", nil, true];
["Your car salesman payments have stopped.", false] spawn domsg; 
