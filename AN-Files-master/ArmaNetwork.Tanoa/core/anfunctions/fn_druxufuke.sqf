#include <macro.h>
/*
	File: fn_druxufuke.sqf
	Author: [GSN] Paronity

	Description:
	Selects a random freight yard legal/illegal delivery mission.
*/
private["_yard","_target","_type","_spawn","_sp","_newTruck","_civCar","_points","_giveGarage"];
_target = param [0,ObjNull];
_type =  _this select 3 select 0;
_spawn = _this select 3 select 1;
_count = 0;
_sp = getMarkerPos _spawn;
_nearTrucks = nearestObjects [_sp, ["Car","Air"], 30];
if(_count > 3) then {_target setVariable ["inUse",false,true];};
if((_target getVariable ["inUse",false])) exitWith {hintSilent "A Truck is already being loaded for delivery. Try again shortly.";_count = _count + 1};
if(count _nearTrucks > 0) exitWith {hint "There is a delivery truck already on the spawn point";};
if((diag_tickTime - TruckStartTime) < 10*60) exitWith {hint "I do not have any jobs for you right now, Check back after 10 minutes from your last job"};
if(_type == "illegal" && ((west countSide playableUnits) < 4)) exitWith {hintSilent "There needs to be at least 4 Officers on!"};

if(str(_target) in LIFE_SETTINGS(getArray,"truck_missions")) then {
	private "_point";
	_points = LIFE_SETTINGS(getArray,"truck_missions");
	_points deleteAt (_points find (str(_target)));
	_yard = _points call BIS_fnc_selectRandom;
} else {
	_yard = LIFE_SETTINGS(getArray,"truck_missions") call BIS_fnc_selectRandom;
};

life_truck_in_progress = true;
_target setVariable ["inUse",true,true];
life_truck_point = call compile format["%1",_yard];

if(vehicle player != player) then
{
	_civCar = vehicle player;
} else {
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			private["_vehData","_vehOwner"];
			if(!isNil "_civCar") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_civCar = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(!isNil "_civCar") then
{
	[_civCar,false,(_this select 1)] remoteExecCall ["TON_fnc_vehicleStore",2];
    _giveGarage = "1";
} else {
    _giveGarage = "0";
};

sleep 3;
TruckStartTime = diag_tickTime;
_truckList  = ["Mrshounka_Vandura_civ_noir","Mrshounka_Vandura_civ_jaune","Mrshounka_Vandura_civ_orange","Jonzie_Tanker_Truck","Jonzie_Log_Truck","Jonzie_Flat_bed"];
_TruckPick = selectRandom _truckList;
_newTruck = _TruckPick createVehicle _sp;
_newTruck setVectorUp (surfaceNormal (getMarkerPos _spawn));
_newTruck setPos (getMarkerPos _spawn);
_newTruck setDir (markerDir _spawn);
[_newTruck] call life_fnc_studewejexe;

_newTruck setVariable["purpose","truck_mission",true];
_newTruck setVariable["driver",name player,true];
_newTruck setVariable["startYard",_target,true];
_newTruck setVariable["goodsRemoved","0",true];
_newTruck setVariable["giveGarage",_giveGarage,true];
_newTruck setVariable["vehicle_info_owners","truck_mission",true];
_gasMeme = random(1);
if(_gasMeme < 0.1) then {_gasMeme = 0.1;};
_newTruck setFuel _gasMeme;

if(_type == "legal") then
{
	_newTruck setVariable["type","legal",true];
} else {
	_newTruck setVariable["type","illegal",true];
	hint "You have chosen an illegal mission. This means the cops have been alerted to your activites. Completing the mission will immediately clear it from your record. RUN!!";
	[format["A person named %1 has accepted an illegal truck mission. They are leaving to go to the %2 freight yard now. Catch them!",name player,_yard],"John Doe",1] remoteExecCall ["life_fnc_nuphecast",west];
};

life_cur_task = player createSimpleTask [format["Truck_%1",life_truck_point]];
life_cur_task setSimpleTaskDescription [format["You are to deliver this truck to the %1 freight yard. You have 30 minutes",toUpper _yard],"Truck Job",""];
["DeliveryAssigned",[format["Deliver this truck to the %1 freight yard.",toUpper _yard]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;
_target setVariable ["inUse",false,true];

[_newTruck] spawn
{
	_maxTime = 30*60;
	_TruckStart = diag_tickTime;
	_truckToWatch = _this select 0;
	waitUntil {!life_truck_in_progress OR !alive player OR !alive _truckToWatch OR ((diag_tickTime - _TruckStart) > _maxTime)};
	if(life_truck_in_progress) then
	{
		if((diag_tickTime - _TruckStart) > _maxTime) then
		{
			life_cur_task setTaskState "Failed";
			player removeSimpleTask life_cur_task;
			["DeliveryFailed",["You failed to deliver the truck, What are you doing?. (Deleting vehicle)"]] call BIS_fnc_showNotification;
			life_truck_in_progress = false;
			life_truck_point = nil;
			_truckToWatch setFuel 0;
			sleep 15;
			deleteVehicle _truckToWatch;
		};

		if(!alive player) then
		{
			life_cur_task setTaskState "Failed";
			player removeSimpleTask life_cur_task;
			["DeliveryFailed",["You failed to deliver the truck because you died."]] call BIS_fnc_showNotification;
			life_truck_in_progress = false;
			life_truck_point = nil;
			_truckToWatch setFuel 0;
			sleep 60;
			deleteVehicle _truckToWatch;
		};
		if(!alive _truckToWatch) then
		{
			life_cur_task setTaskState "Failed";
			player removeSimpleTask life_cur_task;
			["DeliveryFailed",["Truck exploded or was impounded. Mission failed."]] call BIS_fnc_showNotification;
			life_truck_in_progress = false;
			life_truck_point = nil;
			_truckToWatch setFuel 0;
			sleep 15;
			deleteVehicle _truckToWatch;
		};
	};
};
