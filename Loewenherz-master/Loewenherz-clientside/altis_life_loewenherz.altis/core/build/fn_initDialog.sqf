/*
	File: fn_initDialog.sqf
	Author: Mario2002

	Description:
	init the builder menu
*/

private ["_dialog", "_lb", "_objects", "_name", "_index", "_lbFilter", "_cfg","_GangBase","_nearGangBases"];
waitUntil {!(isNull (findDisplay 8800))};
disableSerialization;

_nearGangBases = (nearestobjects [player, ["FlagCarrier"], LHM_VAR_GANGBASERANGE]);
if(!(count _nearGangBases > 0)) exitWith{
    cutText ["Du bist nicht in der naehe einer Basis!", "PLAIN DOWN"];
    closeDialog 0;
};
_GangBase = _nearGangBases select 0;

_dialog = findDisplay 8800;
_lb = _dialog displayCtrl 8802;
_lbFilter = _dialog displayCtrl 8803;
_buybutton = _dialog displayCtrl 8810;
_buybutton ctrlEnable false;

if (!(isNull lhm_placeable_object)) exitWith {
    closeDialog 0;
    hint "Plaziere zuerst das andere Objekt!";
};

lbClear _lb;
_cfg = [] call build_fnc_config;
waitUntil {sleep 0.1;!isNil "_cfg"};
{
    _index = _lbFilter lbAdd format ["%1", _x];
    _lbFilter lbSetData [_index, _x];
} forEach _cfg;

_lbFilter lbSetCurSel 0;




LHM_VehShop_Showcase = true;

[] spawn lhm_fnc_circleVehicleShow;

waituntil {isnull (findDisplay 8800);};

LHM_VehShop_Showcase = false;
LHM_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy LHM_shop_cam;

deleteVehicle LHM_shop_show_vehicle;
deleteVehicle LHM_shop_light;
