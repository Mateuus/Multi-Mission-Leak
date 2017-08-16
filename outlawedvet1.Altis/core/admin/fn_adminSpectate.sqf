#include "..\..\script_macros.hpp"
/*
    File: fn_adminSpectate.sqf
    Author: ColinM9991

    Description:
    Spectate the chosen player.
*/
if (FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0;};

private["_unit","_target","_from","_weaponstate","_displayName","_unitweapon","_unitammo","_unitmagazines","_message2","_message3"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (_unit == player) exitWith {hint localize "STR_ANOTF_Error";};
_target = _unit getVariable["realname",name _unit];
_from = profileName;

[_from,_target] call TON_fnc_cell_textspectate;

_unit switchCamera "EXTERNAL";
_weaponstate = weaponState _unit;
_unitweapon = _weaponstate select 0;
_unitmagazines = {_weaponstate select 3 == _x} count magazines _unit;
_unitammo = _weaponstate select 4;
						
_type = _unitweapon;
_cfg = _type call getCFG;
getCFG = {
		_cfg = '';
		if(isClass (configFile >> 'CfgWeapons' >> _this))then
		{
			_cfg = 'CfgWeapons';
		}
		else
		{
			if(isClass (configFile >> 'CfgMagazines' >> _this))then
			{
				_cfg = 'CfgMagazines';
			}
			else
			{
				if(isClass (configFile >> 'CfgVehicles' >> _this))then
				{
					_cfg = 'CfgVehicles';
				};
			};
		};
		_cfg
};
_displayName = getText (configFile >> _cfg >> _type >> 'displayName');		

			
_message1 = format[' %1 [%2] (%3/%4)',_displayName,_unitweapon,_unitammo,_unitmagazines];
['<t align=''left'' size=''0.6'' color=''#FF0000''>'+_message1+'</t>',safezoneX+0.18,safezoneY+0.475,9999,0,0,3035] spawn bis_fnc_dynamicText;
_message2 = format[' %1 (%2) GRIDREF:%3',name _unit,getPlayerUID _unit,mapGridPosition _unit];
['<t align=''left'' size=''0.6'' color=''#FF0000''>'+_message2+'</t>',safezoneX+0.18,safezoneY+0.405,9999,0,0,3033] spawn bis_fnc_dynamicText;			
_message3 = format[' Health: %1',(1-(damage _unit))*100];
['<t align=''left'' size=''0.6'' color=''#FF0000''>'+_message3+'</t>',safezoneX+0.18,safezoneY+0.440,9999,0,0,3034] spawn bis_fnc_dynamicText;

hint format[localize "STR_NOTF_nowSpectating",_unit getVariable ["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'You have stopped spectating';false;for '_i' from 3033 to 3035 do {['',0,0,1,0,0,_i] spawn bis_fnc_dynamicText;};life_action_spectate = false;};"];