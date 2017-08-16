/*
	File: fn_money.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	View and trade money dialog
*/
private["_display","_near"];

disableSerialization;
waitUntil {!isNull findDisplay 2001};

[] call life_fnc_p_updateMenu;

_display = findDisplay 2001;
_near = _display displayCtrl 2022;
_mstatus = _display displayCtrl 2015;

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units set [count _near_units,_x];};} foreach allPlayers;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		_near lbAdd format["%1 - %2",name _x, side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach (if(isNull objectParent player) then {_near_units} else {crew vehicle player});

_mstatus ctrlSetStructuredText parseText format["<t align='center'><img size='2' image='icons\bank.paa'/><br/><t size='1.75'>$%1</t><br/><img size='2' image='icons\money.paa'/><br/><t size='1.75'>$%2</t><br/><br/><t size='1'>%3 Prestige</t>",[life_atmmoney] call life_fnc_numberText,[life_money] call life_fnc_numberText,[life_wealthPrestige] call life_fnc_numberText];