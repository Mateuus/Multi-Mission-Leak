/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Picks up money
*/
private "_value";
if((time - life_action_delay) < 1.5) exitWith {hintSilent localize "STR_NOTF_ActionDelay"; _this setVariable ["inUse",false,true];};
if(isNull _this OR {player distance _this > 3}) exitWith {_this setVariable ["inUse",false,true];};

_value = (_this getVariable "item") select 1;
if(!isNil "_value") exitWith {
	deleteVehicle _this;
	switch (true) do {
		case (_value > 20000000): {_value = 100000;};
		case (_value > 5000000): {_value = 250000;};
		default {};
	};
	player playMove "AinvPknlMstpSlayWrflDnon";
	titleText[format[localize "STR_NOTF_PickedMoney",[_value] call life_fnc_rupadudejat],"PLAIN"];
	[_value,0,0] call life_fnc_sewawruk;
	life_action_delay = time;
};
