#include "..\..\macros.hpp"
/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various vehicle actions
*/
#include "..\..\macros.hpp"
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_Btn13","_Btn14","_Title"];
if(!dialog) then {
	createDialog "Interaction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;

_display = findDisplay 37400;
_Btn1 = _display displayCtrl IDC_interact_Btn1;
_Btn2 = _display displayCtrl IDC_interact_Btn2;
_Btn3 = _display displayCtrl IDC_interact_Btn3;
_Btn4 = _display displayCtrl IDC_interact_Btn4;
_Btn5 = _display displayCtrl IDC_interact_Btn5;
_Btn6 = _display displayCtrl IDC_interact_Btn6;
_Btn7 = _display displayCtrl IDC_interact_Btn7;
_Btn8 = _display displayCtrl IDC_interact_Btn8;
_Btn9 = _display displayCtrl IDC_interact_Btn9;
_Btn10 = _display displayCtrl IDC_interact_Btn10;
_Btn11 = _display displayCtrl IDC_interact_Btn11;
_Btn12 = _display displayCtrl IDC_interact_Btn12;
_Btn13 = _display displayCtrl IDC_interact_Btn13;
_Btn14 = _display displayCtrl IDC_interact_Btn14;
_Title = _display displayCtrl IDC_interact_Title;
_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;
_Btn11 ctrlShow false;
_Btn12 ctrlShow false;
_Btn13 ctrlShow false;
_Btn14 ctrlShow false;

_Title ctrlSetText "Fahrzeug Interaktions-Menü";

_BtnEnterVehicle = _Btn1; // Nur Temporäre Zuweisung


DWEV_vInact_curTarget = _curTarget;
_dist = 0;   // Initialisiere Positionsüberwachung

//Set Repair Action
_Btn1 ctrlSetText "Reparieren";
_Btn1 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_repairTruck; closeDialog 0;";

if("ToolKit" in (items player) && (damage _curTarget < 1)) then
{
	_Btn1 ctrlEnable true;
}
else
{
	_Btn1 ctrlEnable false;
};
_Btn1 ctrlShow true;

// Lifting
if (_curTarget in DWEV_vehicles) then
{
	if((typeOf (_curTarget) in ["I_MRAP_03_F","O_MRAP_02_F","B_MRAP_01_F","B_Boat_Armed_01_minigun_F","B_Lifeboat","B_SDV_01_F","C_Boat_Civil_01_police_F","B_G_Offroad_01_F","C_Boat_Civil_01_F","C_Rubberboat","B_Truck_01_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_02_fuel_F","C_Van_01_box_F","O_G_Van_01_fuel_F","C_Van_01_transport_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","B_Quadbike_01_F"])) then
	{

		if !(ropeAttachEnabled _curTarget) then
		{
			_Btn7 ctrlSetText "Lift Freigeben";
			_Btn7 buttonSetAction "DWEV_vInact_curTarget enableRopeAttach true; closeDialog 0; hint ""Das Fahrzeug kann nun mit einem Helikopter transportiert werden."";";
			_Btn7 ctrlShow true;
		}
		else
		{
			if ((_curTarget) getVariable["sperre",false] || (_curTarget) getVariable["protected",false]) then
			{
				_Btn7 ctrlSetText "Lift Blockieren";
				_Btn7 buttonSetAction "DWEV_vInact_curTarget enableRopeAttach false; closeDialog 0; hint ""Helikopter können das Fahrzeug nicht mehr transportieren."";";
				_Btn1 ctrlShow true;
			};
		};
	};

	if ((typeOf _curTarget) in DWEV_fuelTrucks) then
	{
			_Btn6 ctrlSetText "Fahrzeug betanken";
			_Btn6 buttonSetAction "closeDialog 0; [[""Car"", ""Air"", ""Ship""], DWEV_vInact_curTarget] spawn DWEV_fnc_gasCargoVehicleSelection;";
			_Btn6 ctrlShow true;

			if !((_curTarget getVariable ["fuelCargo",0]) > 0) then
			{
				_Btn6 ctrlEnable false;
			};
	};
};

if((side player) == west) then
{
	_Btn2 ctrlSetText "Fahrzeugschein";
	_Btn2 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_searchVehAction; closeDialog 0;";
	_Btn2 ctrlShow true;

	_Btn3 ctrlSetText "Durchsuchen";
	_Btn3 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_vehInvSearch; closeDialog 0;";
	_Btn3 ctrlShow true;

	_Btn4 ctrlSetText "Rausziehen";
	_Btn4 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_pulloutAction; closeDialog 0;";
	_Btn4 ctrlShow true;
	if(count crew _curTarget == 0) then
	{
		_Btn4 ctrlEnable false;
	};

	_Btn5 ctrlSetText "Beschlagnahmen";
	_Btn5 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_impoundAction; closeDialog 0;";
	_Btn5 ctrlShow true;

	_BtnEnterVehicle = _Btn6;
};

if((side player) == civilian) then
{
	_Btn2 ctrlSetText "Rausziehen";
	_Btn2 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_pulloutAction; closeDialog 0;";
	_Btn2 ctrlShow true;

	if(count crew _curTarget == 0) then {_Btn2 ctrlEnable false;};
	if(!lc_rebel) then {_Btn2 ctrlEnable false;};
	if(currentWeapon player == "" || currentWeapon player == "Binocular" || currentWeapon player == "Rangefinder") then {_Btn2 ctrlEnable false;};

	_BtnEnterVehicle = _Btn3;

	if(typeOf _curTarget == "O_Truck_03_device_F") then
	{
		_Btn3 ctrlSetText "Mit Fahrzeug sammeln";
		_Btn3 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_deviceMine; closeDialog 0;";
		_Btn3 ctrlShow true;
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in DWEV_vehicles}) then
		{
			_Btn3 ctrlEnable false;
		}
		else
		{
			_Btn3 ctrlEnable true;
		};
	};
};

if((side player) == independent) then
{
		_Btn2 ctrlSetText "Fahrzeugschein";
		_Btn2 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_searchVehAction; closeDialog 0;";
		_Btn2 ctrlShow true;

		_Btn3 ctrlSetText "Fahrzeug drehen";
		_Btn3 buttonSetAction "DWEV_vInact_curTarget setPos [getPos DWEV_vInact_curTarget select 0, getPos DWEV_vInact_curTarget select 1, (getPos DWEV_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		_Btn3 ctrlShow true;

		if(count crew _curTarget != 0 && {canMove _curTarget}) then
		{
			_Btn3 ctrlEnable false;
		}
		else
		{
			_Btn3 ctrlEnable true;
		};

		_Btn4 ctrlSetText "In Garage";
		_Btn4 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_impoundAction; closeDialog 0;";
		_Btn4 ctrlShow true;

		_BtnEnterVehicle = _Btn5;
};

if((side player) == east) then
{

		_Btn2 ctrlSetText "Rausziehen";
		_Btn2 buttonSetAction "[DWEV_vInact_curTarget] spawn DWEV_fnc_pulloutAction; closeDialog 0;";
		_Btn2 ctrlShow true;
		if(count crew _curTarget == 0) then
		{
			_Btn2 ctrlEnable false;
		};

		_BtnEnterVehicle = _Btn3;
};

if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","C_Kart_01_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F", "C_Offroad_02_unarmed_F", "B_T_LSV_01_unarmed_F", "O_T_LSV_02_unarmed_F", "C_Plane_Civil_01_F", "B_T_VTOL_01_infantry_F", "O_T_VTOL_02_infantry_F", "C_Boat_Transport_02_F", "C_Scooter_Transport_01_F"]) then
{
	_BtnEnterVehicle ctrlEnable false;
	_BtnEnterVehicle ctrlSetText "Einsteigen";
	_BtnEnterVehicle buttonSetAction "player moveInDriver DWEV_vInact_curTarget; closeDialog 0;";
	_BtnEnterVehicle ctrlShow true;

	if((locked _curTarget) == 0) then
	{
		if (canMove _curTarget) then
		{
			if (count crew _curTarget == 0) then
			{
				_BtnEnterVehicle ctrlEnable true;
			}
			else
			{
				_vehicleInfo = [(typeOf _curTarget)] call DWEV_fnc_fetchVehInfo;
				_places = (_vehicleInfo select 10);
				if (count crew _curTarget < _places) then
				{
					_BtnEnterVehicle buttonSetAction "player moveInCargo DWEV_vInact_curTarget; closeDialog 0;";
					_BtnEnterVehicle ctrlEnable true;
				};
			};
		};
	};
};

while {_dist <= 11} do
	{
		_pos1 = getPos player;
		_pos2 = getPos _curTarget;
		_dist = _pos1 distance _pos2;
		//hint format["Aktuelle Entfernung: %1m",_dist]; // Anzeige nur zum Testen
		if(!dialog) exitWith {};
		sleep 1;
	};

closeDialog 0; // Fenster schließen wenn Spieler zu weit weg ist
