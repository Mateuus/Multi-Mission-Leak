#include "..\..\macros.hpp"
/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance","_fail","_sleep"];
closeDialog 0;
_curTarget = cursorTarget;
DWEV_interrupted = false;
if(DWEV_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {};
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in DWEV_vehicles) exitWith {hint "Du hast bereits einen passenden Schlüssel."};
if(_curTarget getVariable["protected",false]) exitWith {hint "Dieses Fahrzeug ist Serverseitig geschützt und kann nicht aufgebrochen werden!"};

_distance = 10;

if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

if(call DWEV_fnc_isSafeZone) exitWith {hint "In einer absoluten Safezone können keine Dietriche verwendet werden!!!"};

_title = format["Breche %1 auf",if(!_isVehicle) then {"Handschellen"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
DWEV_action_inUse = true;

// Alaram Anlage
if (_isVehicle && (_curTarget getVariable["alarm",false]) && !(_curTarget getVariable["alarm_in_use",false])) then
{
	[_curTarget] spawn
	{
		_vehicle = _this select 0;
		_vehicle setVariable["alarm_in_use",true,true];
		[_vehicle] remoteExec ["DWEV_fnc_carAlarm",-2];
		sleep 120;
		_vehicle setVariable["alarm_in_use",false,true];
			
	};
};

switch (typeof _curTarget) do
	{
		case "B_Quadbike_01_F":{_fail = 15; _sleep = 0.30;}; // 30 sekunden
		case "C_Rubberboat":{_fail = 15; _sleep = 0.30;}; // 30 sekunden
		case "B_Lifeboat":{_fail = 15; _sleep = 0.30;}; // 30 sekunden
		
		case "C_Offroad_01_F":{_fail = 20; _sleep = 0.36;}; // 36 sekunden
		case "B_G_Offroad_01_F":{_fail = 20; _sleep = 0.36;}; // 36 sekunden
		case "C_Hatchback_01_F":{_fail = 20; _sleep = 0.36;}; // 36 sekunden
		case "C_SUV_01_F":{_fail = 20; _sleep = 0.36;}; // 36 sekunden
		case "C_Boat_Civil_01_F":{_fail = 20; _sleep = 0.36;}; // 36 sekunden
		case "C_Boat_Civil_01_police_F":{_fail = 20; _sleep = 0.36;}; // 36 sekunden	
		
		case "C_Van_01_transport_F":{_fail = 25; _sleep = 0.42;}; // 42 sekunden
		case "O_G_Van_01_fuel_F":{_fail = 25; _sleep = 0.42;};// 42 sekunden
		case "C_Van_01_box_F":{_fail = 25; _sleep = 0.42;};// 42 sekunden
		
		case "B_SDV_01_F":{_fail = 30; _sleep = 0.48;};
		case "C_Hatchback_01_sport_F":{_fail = 30; _sleep = 0.48;};
		case "O_Truck_02_fuel_F":{_fail = 30; _sleep = 0.48;}; //Zamak Fuel
				
		case "B_Heli_Light_01_F":{_fail = 35; _sleep = 0.54;}; //hummi
		case "C_Heli_Light_01_civil_F":{_fail = 35; _sleep = 0.54;}; //M900
		case "B_Boat_Armed_01_minigun_F":{_fail = 35; _sleep = 0.54;};
				
		case "I_Truck_02_transport_F":{_fail = 40; _sleep = 0.60;}; // Zamak Transport
		case "I_Truck_02_covered_F":{_fail = 40; _sleep = 0.60;}; // Zamak abgedeckt
		case "O_Truck_02_Ammo_F":{_fail = 40; _sleep = 0.60;}; // Zamak Ammo
		case "B_Truck_01_transport_F":{_fail = 40; _sleep = 0.60;}; // Hemmt Transport
				
		case "O_Heli_Light_02_unarmed_F":{_fail = 45; _sleep = 0.66;}; //Orca
		case "B_Truck_01_mover_F":{_fail = 45; _sleep = 0.66;}; // Hemmt Mover
		case "B_Truck_01_fuel_F":{_fail = 45; _sleep = 0.66;}; // Hemmt Fuel
				
		case "B_Truck_01_box_F":{_fail = 50; _sleep = 0.72;}; // Hemmt Box
		case "B_Truck_01_ammo_F":{_fail = 50; _sleep = 0.72;}; // Hemmt Ammo
				
		case "O_Truck_03_ammo_F":{_fail = 55; _sleep = 0.78;}; // Tempest Ammo
		case "B_Truck_01_covered_F":{_fail = 55; _sleep = 0.78;}; // Hemmt Abgedeckt
		case "O_Truck_03_transport_F":{_fail = 55; _sleep = 0.78;}; // Tempest Transport
		
		case "B_MRAP_01_F":{_fail = 60; _sleep = 0.84;}; // Hunter
		case "O_Truck_03_covered_F":{_fail = 60; _sleep = 0.84;}; // Temepst Abgedeckt
		case "O_Truck_03_fuel_F":{_fail = 60; _sleep = 0.84;}; // Temepst Fuel
		case "O_Truck_03_device_F":{_fail = 60; _sleep = 0.84;}; // Temepst gerät
		
		case "B_Heli_Transport_03_unarmed_F":{_fail = 65; _sleep = 0.90;};
		case "O_Heli_Transport_04_F":{_fail = 65; _sleep = 0.90;};
		case "O_Heli_Transport_04_medevac_F":{_fail = 65; _sleep = 0.90;};
		case "I_Heli_Transport_02_F":{_fail = 65; _sleep = 0.90;};
		case "O_MRAP_02_F":{_fail = 65; _sleep = 0.90;};
		case "B_Heli_Attack_01_F":{_fail = 65; _sleep = 0.90;};
		case "I_Heli_light_03_unarmed_F":{_fail = 65; _sleep = 0.90;};
		
		case "I_MRAP_03_F":{_fail = 70; _sleep = 0.96;};
		case "B_Heli_Transport_01_F":{_fail = 70; _sleep = 0.96;};
		case "O_Heli_Attack_02_F":{_fail = 70; _sleep = 0.96;};
		case "O_Heli_Attack_02_black_F":{_fail = 70; _sleep = 0.96;};
		
		case "I_Plane_Fighter_03_CAS_F":{_fail = 101; _sleep = 1.8;}; // unknackbar
		case "B_Plane_CAS_01_F":{_fail = 101; _sleep = 1.8;}; // unknackbar
		case "O_Plane_CAS_02_F":{_fail = 101; _sleep = 1.8;}; // unknackbar
		case "O_Truck_02_box_F":{_fail = 101; _sleep = 1.8;}; // unknackbar Farming Auto Admin für Event
		
		default {_fail = -1; _sleep = 0.30;};	
	};

disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep _sleep;
	
	if(isNull _ui) then {
			5 cutRsc ["DWEV_progress","PLAIN"];
			_ui = uiNamespace getVariable "DWEV_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DWEV_istazed) exitWith {};
	if(DWEV_isdowned) exitWith {};
	if(DWEV_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR DWEV_istazed OR DWEV_isdowned) exitWith {DWEV_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {DWEV_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText["Du hast dich zuweit entfernt.","PLAIN"]; DWEV_action_inUse = false;};
if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen.","PLAIN"]; DWEV_action_inUse = false;};
if(!([false,"lockpick",1] call DWEV_fnc_handlelnv)) exitWith {DWEV_action_inUse = false;};

DWEV_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} 
else 
{
	_dice = floor (random 100);
	if(_dice >= _fail) then 
	{
		titleText["Du hast nun einen Fahrzeugschlüssel.","PLAIN"];
		DWEV_robbed_vehicles pushBack _curTarget;
		_curTarget setVariable["robbed",true,true];
		[getPlayerUID player,getMyName,"487"] remoteExec ["DWEV_fnc_wantedAdd",2];
	} 
	else 
	{
		[getPlayerUID player,getMyName,"215"] remoteExec ["DWEV_fnc_wantedAdd",2];
		format["%1 wurde beim aufbrechen eines Autos gesehen.",getMyDName] remoteExec ["systemChat",west];
		titleText["Der Dietrich ist zerbrochen.","PLAIN"];
	};
};