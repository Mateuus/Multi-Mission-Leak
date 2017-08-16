/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_display","_list","_uid","_data","_amount"];
disableSerialization;
_display = findDisplay 50000;
if(lbCurSel 1500 isEqualTo -1) exitWith {hintSilent "You must select a target!";};
_data = lbData[1500,(lbCurSel 1500)];
_amount = ctrlText 1400;
if(!([_amount] call life_fnc_spunetuwada)) exitWith {call life_fnc_stoegiugoesoatr; hintSilent "Not a number!";};
_data = call compile format["%1",_data];
if(isNil "_data") exitWith {};
if(side _data isEqualTo independent) exitWith {call life_fnc_stoegiugoesoatr; hintSilent "Medics can not be targeted for a hit.";};
if(parseNumber(_amount) > 999999) exitWith {hintSilent "The fee cannot exceed $999,999!";};
if(parseNumber(_amount) < 200000) exitWith {hintSilent "The fee must be $200,000 or higher.";};
if(an_bank < parseNumber(_amount)) exitWith {hintSilent "You don't have enough money!";};
_group = group _data;
_groupName = switch(side _data)do{
	case civilian: {_group getVariable["gangName",""];};
	case west: {"TSO";};
	default {""};
};
[(getPlayerUID player),(getPlayerUID _data),_data getVariable["realname",name _data],_amount,_groupName] remoteExecCall ["life_fnc_hitmanHire",2];
call life_fnc_stoegiugoesoatr;
hintSilent "You've successfully listed a Hit";
[_amount,1,1] call life_fnc_sewawruk;
