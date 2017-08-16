/*
	File: fn_openVVS.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the VVS menu and fills in the blanks.
*/
private["_sp"];
_sp = _this;
if(isnil "_sp") exitWith {};
if(typeName _sp == "STRING") then
{
	if(_sp == "") exitWith {closeDialog 0};
	VVS_SP = _sp;
}
	else
{
	if(typeName _sp == "ARRAY") then
	{
		if(count _sp == 0) exitWith {closeDialog 0;};
		VVS_SP = _sp select 0;
		VVS_Cfg = _sp select 1;
	};
};
disableSerialization;
if(!(createDialog "VVS_Menu")) exitWith {}; //Couldn't create the menu

[["admin",(format["%1 with UID %2 is using the Vehicle Spawner",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;VVS_Cfg