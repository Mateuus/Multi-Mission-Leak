/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_params","_requirement"];
_params = (_this select 3);
_shop = _params param [0,"",[""]];
_sideCheck = _params param [1,sideUnknown,[civilian]];
_spawnPoints = _params param [2,"",["",[]]];

disableSerialization;

if(dialog) exitWith {};
if(_shop isEqualTo "") exitWith {};
if(_sideCheck != sideUnknown && {playerSide != _sideCheck}) exitWith {hintSilent localize "STR_Shop_Veh_NotAllowed"};
if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};
if(!isNil "life_demoVehicle") then {
	deleteVehicle life_demoVehicle;
};
life_veh_shop = [_shop,_spawnpoints];
_pos = [1000,1000,10000];
life_vehicleLogic = "Logic" createVehicleLocal _pos;
life_vehicleLogic setPosATL _pos;

life_vehicleLight = "#lightpoint" createVehicleLocal _pos;
life_vehicleLight setLightBrightness 1;
life_vehicleLight setLightAmbient [1.0, 1.0, 1.0];
life_vehicleLight lightAttachObject [life_vehicleLogic, [0,0,0]];

//initialize camera view
life_veh_cam = "CAMERA" camCreate getPos life_vehicleLogic;
showCinemaBorder false;
life_veh_cam cameraEffect ["Internal", "Back"];
life_veh_cam camSetTarget (life_vehicleLogic modelToWorld [0,0,1]);
life_veh_cam camSetPos (life_vehicleLogic modelToWorld [1,4,2]);
life_veh_cam camSetFOV .33;
life_veh_cam camSetFocus [50, 0];
life_veh_cam camCommit 0;

_vehicleList = ((findDisplay 2300) displayCtrl 1500);

life_shops_camDegree = 0;
/*
life_shops_camY = 13;
life_shops_camX = 4;
life_shops_camZ = 1.5;
*/
(findDisplay 2300) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1) then {call life_fnc_tleproaviuqiup;}"];

(findDisplay 2300) displayAddEventHandler ["MouseButtonDown",
	{
		if(_this select 1 isEqualTo 0) then {life_mouseHolding = true;};
	}
];
(findDisplay 2300) displayAddEventHandler ["MouseButtonUp",
	{
		if(_this select 1 isEqualTo 0) then {life_mouseHolding = false;};
	}
];

(findDisplay 2300) displayAddEventHandler["MouseMoving",
	{
		if(life_mouseHolding) then {
			_x = _this select 1;
			_y = _this select 2;
			_x = (_x * 8);
			_dir = getDir life_demoVehicle;
			life_demoVehicle setDir (_dir + _x);
			life_shops_camDegree = life_shops_camDegree + _y;
		};
	}
];

lbClear _vehicleList;
ctrlEnable [2400,false];
ctrlEnable [2401,false];
ctrlEnable [2402,false];

if(!isClass (missionConfigFile >> "CfgShops" >> "vehicles" >> _shop)) then {
	diag_log format ["Shop %1 has no config entry!",_shop];
};

{
	_className = configName (_x);
	if(isClass (configFile >> "CfgVehicles" >> _className)) then {
		_requirement = getText(_x >> "requirement");
		if(_requirement isEqualTo "") then {
			_requirement = compile "true";
		} else {
			_requirement = compile _requirement;
		};
		if(call _requirement) then
		{
			_basePrice = getNumber(_x >> "price");
			if(_basePrice isEqualTo 0) exitWith {};
			_vehicleInfo = [_className] call life_fnc_dreputrasta;
			_vehicleList lbAdd (_vehicleInfo select 3);
			_vehicleList lbSetPicture [(lbSize _vehicleList)-1,(_vehicleInfo select 2)];
			_vehicleList lbSetData [(lbSize _vehicleList)-1,_className];
			_vehicleList lbSetValue [(lbSize _vehicleList)-1,_ForEachIndex];
			_vehicleList lbSetCurSel 0;
		};
	} else {
		diag_log format ["%1",_className];
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgShops" >> "vehicles" >> _shop));
