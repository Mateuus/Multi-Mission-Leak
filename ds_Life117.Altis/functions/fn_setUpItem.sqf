/*
	File: fn_setUpItem.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Function for setting up packable game items
*/

private ["_info","_className","_itemString","_side","_vehicle","_itemWeight","_longName"];

_className = _this select 0; //Class name of object to pack
_itemString = _this select 1; //String name to display of object being packed
_shortName = _this select 2;//Short variable name of object

systemchat format ["Setting up your %1, please wait.....",_itemString];
hint format ["Setting up your %1, please wait.....",_itemString];
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;

_sp = [(getpos player select 0) + 0, (getpos player select 1) + 0, getpos player select 2];

_veh = _className;

_vehicle = _veh createVehicle _sp;

if((typeOf _vehicle == "C_Kart_01_Blu_F")&&((player getVariable ["policeSquad",""]) == "Sharp Shooter"))then
	{
	[[_vehicle,false,["extras\textures\vehicles\black.paa"]],"DS_fnc_globalTexture",true,false] spawn BIS_fnc_MP;
	};

_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
_vehicle lock 2;
DS_keyRing set[count DS_keyRing,_vehicle];

_vehicle setVariable ["boot_open",true,true];

if(_className in ["I_UAV_01_F"])then
	{
	createVehicleCrew _vehicle;
	_vehicle disableTIEquipment true;
	};
	
if(_className in ["B_UAV_01_F"])then
	{
	createVehicleCrew _vehicle;
	};