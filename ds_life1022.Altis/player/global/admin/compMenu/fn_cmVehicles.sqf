/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Opens the vehicle compensation menu
*/

private ["_delay","_dialog","_combo1","_combo2","_btnCompensate"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminlist1)))exitWith{hint "You aren't allowed to use this menu";};

if(!DS_cmVehiclesFncsLoaded)then {[] spawn DS_fnc_cmVehiclesFunctions;waitUntil {DS_cmVehiclesFncsLoaded};};

closeDialog 0;
createDialog "compMenuVehicles";

disableSerialization;

_dialog = findDisplay 666644;
if(isNull _dialog)exitWith{};

_combo1 = _dialog displayCtrl 2101;
_combo2 = _dialog displayCtrl 2102;
_btnCompensate = _dialog displayCtrl 2400;

_btnCompensate buttonSetAction "[] spawn DS_fnc_cmVehiclesCompPlayer;";

{
    _combo1 lbAdd (_x select 0);
    _combo1 lbSetData [(lbSize _combo1)-1,str (_forEachIndex)];
}foreach DS_cmVehicleCategories;

_combo1 lbSetCurSel 0;

_combo2 lbAdd "Cop";
_combo2 lbAdd "Civilian";
_combo2 lbAdd "WL Civilian";
_combo2 lbSetCurSel 1;

[] call DS_fnc_cmUpdateVehicleList;