/*
Search Words: 
RechargeStand
Recharge Stand
*/
_myposy = getPos player;

["Charging Phone...", false] spawn domsg;

if(life_charging == 1) exitwith { 
["Already Charging...", false] spawn domsg;
};
life_charging = 1;
while {life_charging == 1} do {
	uiSleep 0.2;
	if(life_battery > 99) exitwith { 
	life_charging = 2;
	["You cant charge higher here...", false] spawn domsg;
	};
	if( player distance _myposy > 1 ) exitwith { 
			["You moved to far away from charging zone", false] spawn domsg;
			life_charging = 2;
	};
	["Add",2] call fnc_battery;
};
