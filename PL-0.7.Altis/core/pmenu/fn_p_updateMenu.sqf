#include "..\..\script_macros.hpp"
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_inv","_lic","_licenses","_near","_mstatus","_shrt","_side","_type","_struct"];
disableSerialization;

if(FETCH_CONST(life_adminlevel) < 1) then {
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"}; case east:{"armer"};};

_inv = CONTROL(2001,2005);
_lic = CONTROL(2001,2014);
_near = CONTROL(2001,2022);
_near_i = CONTROL(2001,2023);
_mstatus = CONTROL(2001,2015);
_struct = "";
lbClear _inv;
lbClear _near;
lbClear _near_i;

_near lbAdd format["%1","Cible"];
_near lbSetData [(lbSize _near)-1,"targetgiveitemmoney"];
_near_i lbAdd format["%1","Cible"];
_near_i lbSetData [(lbSize _near)-1,"targetgiveitemmoney"];

_mstatus ctrlSetStructuredText parseText format["<img size='1.3' image='icons\bank.paa'/> <t size='0.8px'>%1€</t><br/><img size='1.2' image='icons\money.paa'/> <t size='0.8'>%2€</t>",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
ctrlSetText[2009,format["Poids en kilo: %1 / %2", life_carryWeight, life_maxWeight]];

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

{
	_displayName = getText(_x >> "displayName");

	if(LICENSE_VALUE(configName _x,_side)) then {
		_struct = _struct + format["%1<br/>",localize _displayName];
	};
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

if(EQUAL(_struct,"")) then {
	_struct = "No Licenses";
};

_lic ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];
