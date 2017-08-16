/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up police transport options
*/

private ["_dialog","_list","_locations","_index"];

disableSerialization;

_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

if((player getVariable ["policeSquad",""]) != "Rapid Response")then {
	_locations = [["Kavala HQ","cop_spawn_1"],["Zaros HQ","cop_spawn_6"],["Athira HQ","cop_spawn_3"],["Pyrgos HQ","cop_spawn_2"],["Air HQ","cop_spawn_4"],["Paros HQ","cop_spawn_7"],["Sofia HQ","cop_spawn_5"],["Training Island Boat Shop","copBoatSpawn10"],["Pefkas Bay Boat Shop","copBoat72"],["Kavala Boat Shop","cop_air_2_1_1_1_1"],["MCU","45"]];
} else {
	_locations = [["Checkpoint 1","Police CP_1_1"],["Checkpoint 2","Police CP_1_1_1"],["Checkpoint 3","Police CP_1_1_1_1"],["Kavala HQ","cop_spawn_1"],["Zaros HQ","cop_spawn_6"],["Athira HQ","cop_spawn_3"],["Pyrgos HQ","cop_spawn_2"],["Air HQ","cop_spawn_4"],["Paros HQ","cop_spawn_7"],["Sofia HQ","cop_spawn_5"],["Training Island Boat Shop","copBoatSpawn10"],["Pefkas Bay Boat Shop","copBoat72"],["Kavala Boat Shop","cop_air_2_1_1_1_1"],["MCU","45"]];
};

lbClear _list;

{
	_index = _list lbAdd format ["%1",(_x select 0)];
	_list lbSetData [_index,(_x select 1)];
} forEach _locations;