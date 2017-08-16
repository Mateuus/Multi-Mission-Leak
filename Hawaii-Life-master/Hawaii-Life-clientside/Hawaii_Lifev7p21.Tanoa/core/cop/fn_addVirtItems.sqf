/*
	File: fn_addVirtItems.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
if(playerSide isEqualTo civilian) exitWith {hint "Du du bist kein Beamter!"};

if(playerSide isEqualTo west) then {
	if(life_cash < 20000) then {
		_action = [format ["Du hast nicht genug Cash, willst du dir die Items ueber das Konto kaufen?"],"Items kaufen","Ja","Nein"] call BIS_fnc_guiMessage;
		if(_action) then {
			life_atmbank = life_atmbank - 20000;
			[1] call SOCK_fnc_updatePartial;
			[true,"lockpick",3] call life_fnc_handleInv;
			[true,"spikeStrip",1] call life_fnc_handleInv;
			[true,"coffee",2] call life_fnc_handleInv;
			[true,"donuts",2] call life_fnc_handleInv;
			[true,"redgull",2] call life_fnc_handleInv;
			[true,"painkillers",5] call life_fnc_handleInv;
			[true,"fuelFull",1] call life_fnc_handleInv;
			[true,"wheel",6] call life_fnc_handleInv;
			[true,"engine",1] call life_fnc_handleInv;
			[true,"fueltank",1] call life_fnc_handleInv;
			[true,"hull",1] call life_fnc_handleInv;
		};
	} else {
		_action = [format ["Willst du dir fuer 20.000$ Items kaufen?"],"Items kaufen","Ja","Nein"] call BIS_fnc_guiMessage;
		if(_action) then {
			life_cash = life_cash - 20000;
			[0] call SOCK_fnc_updatePartial;
			[true,"lockpick",3] call life_fnc_handleInv;
			[true,"spikeStrip",1] call life_fnc_handleInv;
			[true,"coffee",2] call life_fnc_handleInv;
			[true,"donuts",2] call life_fnc_handleInv;
			[true,"redgull",2] call life_fnc_handleInv;
			[true,"painkillers",5] call life_fnc_handleInv;
			[true,"fuelFull",1] call life_fnc_handleInv;
			[true,"wheel",6] call life_fnc_handleInv;
			[true,"engine",1] call life_fnc_handleInv;
			[true,"fueltank",1] call life_fnc_handleInv;
			[true,"hull",1] call life_fnc_handleInv;
		};
	};
} else {
	if(life_cash < 10000) then {
		_action = [format ["Du hast nicht genug Cash, willst du dir die Items ueber das Konto kaufen?"],"Items kaufen","Ja","Nein"] call BIS_fnc_guiMessage;
		if(_action) then {
			life_atmbank = life_atmbank - 10000;
			[1] call SOCK_fnc_updatePartial;
			[0] call SOCK_fnc_updatePartial;
			[true,"lockpick",2] call life_fnc_handleInv;
			[true,"coffee",4] call life_fnc_handleInv;
			[true,"donuts",4] call life_fnc_handleInv;
			[true,"painkillers",2] call life_fnc_handleInv;
			[true,"fuelFull",1] call life_fnc_handleInv;
			[true,"wheel",40] call life_fnc_handleInv;
			[true,"engine",5] call life_fnc_handleInv;
			[true,"fueltank",5] call life_fnc_handleInv;
			[true,"hull",10] call life_fnc_handleInv;
			[true,"Avionics",2] call life_fnc_handleInv;
			[true,"HRotor",2] call life_fnc_handleInv;
			[true,"VRotor",2] call life_fnc_handleInv;
		};
	} else {
		_action = [format ["Willst du dir fuer 10.000$ Items kaufen?"],"Items kaufen","Ja","Nein"] call BIS_fnc_guiMessage;
		if(_action) then {
			life_cash = life_cash - 10000;
			[0] call SOCK_fnc_updatePartial;
			[true,"lockpick",2] call life_fnc_handleInv;
			[true,"coffee",4] call life_fnc_handleInv;
			[true,"donuts",4] call life_fnc_handleInv;
			[true,"painkillers",2] call life_fnc_handleInv;
			[true,"fuelFull",1] call life_fnc_handleInv;
			[true,"wheel",40] call life_fnc_handleInv;
			[true,"engine",5] call life_fnc_handleInv;
			[true,"fueltank",5] call life_fnc_handleInv;
			[true,"hull",10] call life_fnc_handleInv;
			[true,"Avionics",2] call life_fnc_handleInv;
			[true,"HRotor",2] call life_fnc_handleInv;
			[true,"VRotor",2] call life_fnc_handleInv;
		};
	};
};