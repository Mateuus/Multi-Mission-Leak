/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
Admin_Search = nil;
if(isNil "Admin_Search") then {Admin_Search = [];};
disableSerialization;
_display = findDisplay 2900;
_list = _display displayCtrl 1500;
_vehicles = _display displayCtrl 1501;
_justPlayers = allPlayers - entities "HeadlessClient_F";

_vehicleClasses = [
	"B_QuadBike_01_F",
	"C_Hatchback_01_F",
	"C_Offroad_01_F",
	"B_G_Offroad_01_F",
	"C_SUV_01_F",
	"C_Hatchback_01_sport_F",
	"I_Heli_Transport_02_F",
	"O_MRAP_02_F",
	"B_Heli_Light_01_F",
	"C_Rubberboat",
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_police_F",
	"B_MRAP_01_F"
];

lbClear _list;
lbClear _vehicles;

{
	if(alive _x) then {
		_side = switch(side _x) do {case west: {"TSO"}; case civilian : {"Civ"}; case independent : {"EMS"}; default {"Unknown"};};
		_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
		_list lbSetData [(lbSize _list)-1,str(_x)];
		Admin_Search pushBack [_x getVariable["realname",name _x],_side,str(_x)];
	};
} forEach _justPlayers;

{
  _vehicleName = [_x] call life_fnc_stecranuyer;
  _vehicles lbAdd format ["%1",_vehicleName select 2];
  _vehicles lbSetData [(lbSize _vehicles)-1,_x];
} forEach _vehicleClasses;
