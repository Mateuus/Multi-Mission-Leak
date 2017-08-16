#include "..\script_macros.hpp"
/*
	File: fn_admininfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Output information received to admin menu.
*/
private["_ret","_unit","_prim","_sec","_vest","_uni","_bp","_attach"];
_ret = _this;
disableSerialization;

_unit = SEL(_ret,3);
_prim = if(!(EQUAL(primaryWeapon _unit,""))) then { getText(configFile >> "CfgWeapons" >> primaryWeapon _unit >> "displayName")} else {"Nix"};
_sec = if(!(EQUAL(handgunWeapon _unit,""))) then { getText(configFile >> "CfgWeapons" >> handgunWeapon _unit >> "displayName")} else {"Nix"};
_vest = if(!(EQUAL(vest _unit,""))) then { getText(configFile >> "CfgWeapons" >> vest _unit >> "displayName")} else {"Nix"};
_uni = if(!(EQUAL(uniform _unit,""))) then { getText(configFile >> "CfgWeapons" >> uniform _unit >> "displayName")} else {"Nix"};
_bp = if(!(EQUAL(backpack _unit,""))) then { getText(configFile >> "CfgVehicles" >> backpack _unit >> "displayName")} else {"Nix"};



_attach = [];
if(!(EQUAL(primaryWeapon _unit,""))) then {
	{
		if(!(EQUAL(_x,""))) then {
			_attach pushBack (getText(configFile >> "CfgWeapons" >> _x >> "displayName"));

		};
	} foreach (primaryWeaponItems _unit);
};

if(EQUAL(count _attach,0)) then {_attach = "Nix"};
hintSilent parseText format["<t align='left' color='#ff8000'>Name:</t><br/>%1<br/><t align='left' color='#ff8000'>Bank:</t><br/>%2<br/><t align='left' color='#ff8000'>Geld:</t><br/>%3<br/><t align='left' color='#ff8000'>Uniform:</t><br/>%4<br/><t align='left' color='#ff8000'>Weste:</t><br/>%5<br/><t align='left' color='#ff8000'>Rucksack:</t><br/>%6<br/><t align='left' color='#ff8000'>Waffe:</t><br/>%7<br/><t align='left' color='#ff8000'>Pistole:</t><br/>%8<br/>",
_unit getVariable ["realname",name _unit],[SEL(_ret,0)] call ES_fnc_numberText,[SEL(_ret,1)] call ES_fnc_numberText, _uni,_vest,_bp,_prim,_sec];
sleep 15;
hintSilent "";