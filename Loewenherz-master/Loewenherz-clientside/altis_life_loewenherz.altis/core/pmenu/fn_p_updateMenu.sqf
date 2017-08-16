#include <macro.h>
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the player menu (Virtual Interaction Menu)
*/

private ["__GETC__","_lvl","_side","_dialog","_inv","_lic","_near","_near_i","_mstatus","_struct","_near_units","_namep","_str","_shrt","_val"];
disableSerialization;

if(__GETC__(lhm_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};
_lvl = player getvariable["LHM_Donatorlevel",0];
if(_lvl < 1 || playerside != civilian) then {
	ctrlShow[5574,false];
	ctrlShow[5777,false];
};

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"}; case east:{"sec"};};

_dialog = findDisplay 2001;
_inv = _dialog displayCtrl 2005;
_lic = _dialog displayCtrl 2014;
_near = _dialog displayCtrl 2022;
_near_i = _dialog displayCtrl 2023;
_mstatus = _dialog displayCtrl 2015;
_struct = "";
lbClear _inv;
lbClear _near;
lbClear _near_i;

//Near players
_near_units = [];
{ if(player distance _x < 6) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then{

		if ((headgear _x) in lhm_masks) then {
			_namep = "maskierte Person";
		}else{
			_namep = _x getVariable["realname",name _x];
		};

		_near lbAdd format["%1 - %2",_namep, side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
		_near_i lbAdd format["%1 - %2",_namep, side _x];
		_near_i lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;

_mstatus ctrlSetStructuredText parseText format["<img size='1.3' image='core\textures\icons\misc\bank.paa'/> <t size='0.8px'>$%1</t><br/><img size='1.2' image='core\textures\icons\misc\money.paa'/> <t size='0.8'>$%2</t>",[lhm_atmcash] call lhm_fnc_numberText,[lhm_cash] call lhm_fnc_numberText];
ctrlSetText[2009,format["%1/%2", lhm_carryWeight, lhm_maxWeight]];
ctrlSetText[8888,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];


{
	_str = [_x] call lhm_fnc_varToStr;
	_shrt = [_x,1] call lhm_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
	};
} foreach lhm_inv_items;


_lic ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];