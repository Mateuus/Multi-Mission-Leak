#include <macro.h>
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_struct"];
disableSerialization;
/*
if(FETCH_CONST(life_adminlevel) < 1) then {
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

_inv = CONTROL(2001,2005);
_lic = CONTROL(2001,2014);
_near = CONTROL(2001,2022);
_near_i = CONTROL(2001,2023);
_mstatus = CONTROL(2001,2015);

_mstatus ctrlSetStructuredText parseText format["<img size='1.3' image='\eg_sndimg\icons\bank.paa'/> <t size='0.8px'>$%1</t><br/><img size='1.2' image='\eg_sndimg\icons\money.paa'/> <t size='0.8'>$%2</t>",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
ctrlSetText[2009,format["Weight: %1 / %2", life_carryWeight, life_maxWeight]];
*/
