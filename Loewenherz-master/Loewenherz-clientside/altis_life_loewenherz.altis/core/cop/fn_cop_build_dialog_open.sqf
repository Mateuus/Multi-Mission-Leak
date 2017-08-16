/*
Filename: fn_cop_build_dialog_config.sqf

Author: Barney

Description: No Description for u!

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de

*/

private ["_display","_LB_Objects","_Combo_sides","_foreachindex","_config"];
if(!(playerside in [west,east])) exitWith {hint "Du bist kein Cop oder Sec!";};
disableSerialization;
if(dialog) then {closeDialog 0;};
createDialog "cop_build_dialog";



_display 	 = findDisplay 2222;
//Listboxes
_LB_Objects 	 = _display displayCtrl 2302;
_Combo_sides 	 = _display displayCtrl 2304;

lbClear _LB_Objects;
lbClear _Combo_sides;



{
	_Combo_sides lbadd _x;
	_Combo_sides lbSetData[_foreachindex,_x];

} foreach ["Verteidigung","Gebaeude","Mauern","Lampen"];


_config = ["Verteidigung"] call lhm_fnc_cop_build_dialog_config;


{
	_LB_Objects lbadd (getText(configFile >> "CfgVehicles" >> _x >> "displayName"));
	_LB_Objects lbSetData[_foreachindex,_x];
} foreach _config;


LHM_VehShop_Showcase = true;

[] spawn lhm_fnc_circleVehicleShow;

waituntil {isnull (findDisplay 2222);};

LHM_VehShop_Showcase = false;
LHM_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy LHM_shop_cam;

deleteVehicle LHM_shop_show_vehicle;
deleteVehicle LHM_shop_light;