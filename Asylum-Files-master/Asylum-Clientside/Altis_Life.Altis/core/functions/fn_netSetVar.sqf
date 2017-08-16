/*
	File: fn_netSetVar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Set a variable on a client.
*/
disableSerialization;
private["_varName","_ns","_value"];
_varName = [_this,0,"",[""]] call BIS_fnc_param;
_value = _this select 1;
if(_varName == "life_honor") exitWith {
	if(!license_civ_bounty) exitWith {};
	life_honor = life_honor + _value;
	if(count life_honortalents == 0) exitWith {};
	_total = _value * 100;
	switch(true) do {
		case (10 in life_honortalents): {["atm","add",round (0.15 * _total)] call life_fnc_uC; systemChat format["You've received %1 honor and $%2 for an arrest made by your group member",_value,round (0.15 * _total)]};
		case (9 in life_honortalents): {["atm","add",round (0.1 * _total)] call life_fnc_uC; systemChat format["You've received %1 honor and $%2 for an arrest made by your group member",_value,round (0.1 * _total)]};
		case (8 in life_honortalents): {["atm","add",round (0.05 * _total)] call life_fnc_uC; systemChat format["You've received %1 honor and $%2 for an arrest made by your group member",_value,round (0.05 * _total)]};
	};
};
_ns = [_this,2,missionNamespace,[missionNamespace]] call BIS_fnc_param;
/*_mailbox = param [3,false,[false]];
if(_mailbox) exitWith {
	_item = param [4,false,[false]];
	if(_item) exitWith {
		_checkForExisting = false;
		{if((_value select 0) == (_x select 0)) exitWith {_checkForExisting = true; life_mailbox set[_forEachIndex,[_x select 0,((_x select 1) + (_value select 1))]]};} forEach life_mailbox;
		if(!_checkForExisting) then {
			life_mailbox pushBack _value;
		};
	};
	life_mailbox pushBack _value;
};*/
if(_varName == "") exitWith {}; //Error checking
switch (_varName) do
{
	case "life_money": { ["cash","set",_value] call life_fnc_uC; };
	case "life_atmmoney": { ["atm","set",_value] call life_fnc_uC; };
	default { _ns setVariable[_varName,_value]; };
};