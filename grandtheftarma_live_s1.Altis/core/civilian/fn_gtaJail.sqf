/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call GTA_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_gta_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call GTA_fnc_param;
[player, player, false] spawn GTA_fnc_restrain;
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
//hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//--- Distance check (escape)
if ( player distance ( getMarkerPos "jail_marker" ) > 40 ) then {

	player setPos ( getMarkerPos "jail_marker" );

};

//--- Remove (select) licenses
//[ 1 ] call life_fnc_removeLicenses;

//-- Remove illegal items
{

	private [ "_handle", "_count" ];
	_handle = [ _x select 0, 0 ] call life_fnc_varHandle;
	_count = missionNamespace getVariable _handle;

	if ( _count > 0 ) then {

		[ false, _x select 0, _count ] call life_fnc_handleInv;

	};

} foreach life_illegal_items;

//--- Mark as arrested
life_is_gta_arrested = true;

//--- Food / water
[ true, "kfc_pepsi", 1 ] call life_fnc_handleInv;
[ true, "kfc_wings", 1 ] call life_fnc_handleInv;

//--- Remove equipment
removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;

//--- Prison overalls
player forceAddUniform "U_C_Scientist";
[ [ player, uniform player, uniformContainer player ], "GTA_fnc_setUnitTextures" ] call GTA_fnc_remoteExec;

//---
[ [ player, _bad ], "life_fnc_gtaJailSys", false ] call GTA_fnc_remoteExec;

//--- Updated player
[] call GTA_fnc_updatePlayer;
