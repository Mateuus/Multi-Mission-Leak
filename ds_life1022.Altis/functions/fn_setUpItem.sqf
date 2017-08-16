/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Function for setting up packable game items
*/

private ["_info","_className","_itemString","_side","_vehicle","_itemWeight","_longName"];

_className = _this select 0; //Class name of object to pack
_itemString = _this select 1; //String name to display of object being packed
_shortName = _this select 2; //Short variable name of object

if((_className == "C_Kart_01_Blu_F")&&((DS_infoArray select 1) < 600)&&(player distance (getMarkerPos "civ_spawn_1") < 5000))exitWith{["goKart",true,1] call DS_fnc_handleInventory;hint "You can not set up a Go Kart in this area with less than 10 hours play time on the server"};

systemChat format ["Setting up your %1, please wait...",_itemString];
hint format ["Setting up your %1, please wait...",_itemString];
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;

_vehicle = _className createVehicle (getPos player);

if((typeOf _vehicle == "C_Kart_01_Blu_F")&&((player getVariable ["policeSquad",""]) == "Sharp Shooter"))then {
	[_vehicle,1,["extras\textures\vehicles\black.paa"]] call DS_fnc_globalTexture;
};

_vehicle setVariable ["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
_vehicle lock 2;
DS_keyRing pushBack _vehicle;

_vehicle setVariable ["boot_open",true,true];

if(_className in ["I_UAV_01_F"])then {
	createVehicleCrew _vehicle;
	_vehicle disableTIEquipment true;
};

if(_className in ["B_UAV_01_F"])then {
	_vehicle setFuel 0.1;
	_vehicle disableTIEquipment true;
	createVehicleCrew _vehicle;
	hint "Drone setup without thermals because of it's location";
	if((_vehicle distance (getMarkerPos "illegalRelic1_2") < 1000)||(_vehicle distance (getMarkerPos "fed_reserve_1") < 1000)||(_vehicle distance (getMarkerPos "illegalRelic1_1") < 1000)||(_vehicle distance (getMarkerPos "jailInfo_2") < 1000)||(_vehicle distance (getMarkerPos "powerMarker") < 1000))then {
		_vehicle disableTIEquipment false;
		hint "Drone setup with thermals because of it's location";
	};
	if(miscInfoArray select 8)then {
		_vehicle disableTIEquipment false;
		hint "Drone setup with thermals because of region wide martial law";
	};
};