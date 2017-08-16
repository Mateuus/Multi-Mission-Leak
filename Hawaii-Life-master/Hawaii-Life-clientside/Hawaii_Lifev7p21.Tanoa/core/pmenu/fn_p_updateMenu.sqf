#include "..\..\script_macros.hpp"
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_inv","_near","_near_units"];
disableSerialization;

if(FETCH_CONST(life_adminlevel) < 1) then {
	ctrlShow[2021,false];
};

_inv = CONTROL(2001,2005);
_near = CONTROL(2001,2022);
lbClear _inv;
lbClear _near;

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x) then {
		if(alive _x) then {
			if(player distance _x < 10) then {
				if(_x != player) then {
					_near lbAdd format["%1 - %2",_x GVAR ["realname",name _x], side _x];
					_near lbSetData [(lbSize _near)-1,str(_x)];
				};
			};
		};
	};
} foreach _near_units;

ctrlSetText[2009,format["Weight: %1 / %2", life_carryWeight, life_maxWeight]];

{
	if(ITEM_VALUE(configName _x) > 0) then {
		_inv lbAdd format["%2 [x%1]",ITEM_VALUE(configName _x),localize (getText(_x >> "displayName"))];
		_inv lbSetData [(lbSize _inv)-1,configName _x];
		_icon = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
		if(!(EQUAL(_icon,""))) then {
			_inv lbSetPicture [(lbSize _inv)-1,_icon];
		};
	};
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));