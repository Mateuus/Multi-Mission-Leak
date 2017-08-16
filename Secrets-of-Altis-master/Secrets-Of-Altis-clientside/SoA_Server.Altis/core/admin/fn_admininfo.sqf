/*
	File: fn_admininfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Output information received to admin menu.
*/
private["_display","_ret","_text","_unit","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];
_ret = _this;
disableSerialization;
_display = findDisplay 2900;
_text = _display displayCtrl 2903;
_unit = _ret select 3;
if(_unit == player) exitWith {_text ctrlSetStructuredText parseText "Deine eigenen Daten? Dein Ernst?"};
_prim = if(primaryWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "DisplayName")} else {"Nichts"};
_sec = if(handgunWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (handgunWeapon _unit) >> "DisplayName")} else {"Nichts"};
_vest = if(vest _unit != "") then { getText(configFile >> "CfgWeapons" >> (vest _unit) >> "DisplayName")} else {"Nichts"};
_uni = if(uniform _unit != "") then { getText(configFile >> "CfgWeapons" >> (uniform _unit) >> "DisplayName")} else {"Nichts"};
_bp = if(backpack _unit != "") then { getText(configFile >> "CfgWeapons" >> (backpack _unit) >> "DisplayName")} else {"Nichts"};

_attach = [];
if(primaryWeapon _unit != "") then
{
	{
		if(_x != "") then
		{
			_tmp = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_attach pushBack _tmp;
		};
	} foreach (primaryWeaponItems _unit);
};

if(count _attach == 0) then {_attach = "Nichts"};
_text ctrlSetStructuredText parseText format[
"Name: %1<br/>
Adminlevel: %14<br/>
EP: %12 (Level: %13)<br/>
Bank: %2<br/>
Geld: %3<br/>
Guthaben: %4<br/>
Telefon: %5<br/>
Kleidung: %6<br/>
Weste: %7<br/>
Rucksack: %8<br/>
Primärwaffe: %9<br/>
Pistole: %10<br/>
Waffenzubehör: %11",
_unit getVariable["realname",name _unit],[_ret select 0] call life_fnc_numberText,[_ret select 1] call life_fnc_numberText,"n.V.",(_unit getVariable "phone"),_uni,_vest,_bp,_prim,_sec,_attach,[_ret select 4] call life_fnc_numberText,_ret select 5,_ret select 6];