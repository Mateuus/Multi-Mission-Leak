/*
	File: fn_eatDrink.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_drink","_val","_sum"];
_drink = [_this,0,"",[""]] call BIS_fnc_param;
if(_drink == "") exitWith {};

if([false,_drink,1] call EMonkeys_fnc_handleInv) then {
	switch (_drink) do
	{
		case "water": {_val = 55};
		case "redgull": {_val = 2;
		[] spawn
			{
			player setFatigue 0;
			uisleep 2;
				eM_redgull_effect = time;
				titleText["Ich fühle mich energiegeladen.","PLAIN"];
				player enableFatigue false;
				waitUntil {((!alive player) || (player getVariable["onkill",FALSE])) OR ((time - eM_redgull_effect) > (3 * 60))};
				player enableFatigue true;
		};
		};
		case "coffee": {_val = 35};
		case "bottledshine": {_val = 20;
		
			if(isNil "EMonkeys_dr164") then {EMonkeys_dr164 = 0;};
			EMonkeys_dr164 = EMonkeys_dr164 + 0.08;
			if (EMonkeys_dr164 < 0.09) exitWith {};
			[] spawn EMonkeys_fnc_drinkmoonshine;

		
		};
		case "bottledbeer": {_val = 20;
			
			if(isNil "EMonkeys_dr164") then {EMonkeys_dr164 = 0;};
			EMonkeys_dr164 = EMonkeys_dr164 + 0.02;
			if (EMonkeys_dr164 < 0.06) exitWith {};
			[] spawn EMonkeys_fnc_drinkbeer;
		};
		case "bottledwhiskey":{ _val = 20;
		
			if(isNil "EMonkeys_dr164") then {EMonkeys_dr164 = 0;};
			EMonkeys_dr164 = EMonkeys_dr164 + 0.06;
			if (EMonkeys_dr164 < 0.07) exitWith {};
			[] spawn EMonkeys_fnc_drinkwhiskey;
		

		};

	};

	_sum = EMonkeys_thi164 + _val;
	if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "Du hast zuviel getrunken";};
	EMonkeys_thi164 = _sum;
};