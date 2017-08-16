#include "..\..\script_macros.hpp"
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_inv","_lic","_licenses","_near","_near_units","_shrt","_side","_struct"];
disableSerialization;

if(FETCH_CONST(life_adminlevel) < 1) then {
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

_inv = CONTROL(2001,2005);
_lic = CONTROL(2001,2014);
_near = CONTROL(2001,2022);
_near_i = CONTROL(2001,2023);
_struct = "";
lbClear _inv;
lbClear _near;
lbClear _near_i;

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then {
		_near lbAdd format["%1 - %2",_x GVAR ["realname",name _x], side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
		_near_i lbAdd format["%1 - %2",_x GVAR ["realname",name _x], side _x];
		_near_i lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;

_atm = [CASH] call life_fnc_numberText;
_bar = [BANK] call life_fnc_numberText;
ctrlSetText[1009,Format["$%1",_atm]];
ctrlSetText[1008,Format["$%1",_bar]];

ctrlSetText[1005,Format["Z-Inventar",life_serverTime]];

ctrlSetText[2009,format["Weight: %1 / %2", life_carryWeight, life_maxWeight]];

{
	if(ITEM_VALUE(configName _x) > 0) then {
		_inv lbAdd format["%2 [x%1]",ITEM_VALUE(configName _x), (getText(_x >> "displayName"))];
		_inv lbSetData [(lbSize _inv)-1,configName _x];
		_icon = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
		if(!(EQUAL(_icon,""))) then {
			_inv lbSetPicture [(lbSize _inv)-1,_icon];
		};
	};
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

lbClear 2014;
{
	if(LICENSE_VALUE(configName _x,_side)) then {
		_displayName = getText(_x >> "displayName");
		_lic lbAdd _displayName;
	};
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

if((lbSize _lic) == 0) then {
	_lic lbAdd "Keine Lizenzen vorhanden";
};
