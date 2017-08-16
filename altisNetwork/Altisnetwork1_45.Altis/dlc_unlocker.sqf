/*-----------------------------------------------------------------
	Author: chasEE
	Version: 0.7
	Desc.: DLC Vehicle Unlocker I made for testing out jets, but modified
	to work all around.
	Notes: UAV's and turrents are not included (but MAY already work).
-----------------------------------------------------------------*/

DLC_Vehicles_Jets = [
"B_Plane_Fighter_01_F",
"B_Plane_Fighter_01_Stealth_F",
"O_Plane_Fighter_02_F",
"O_Plane_Fighter_02_Stealth_F",
"I_Plane_Fighter_04_F"
];
// Not the actual Jet's DLC ID but works anyway for now (will need to be updated)
DLC_ID_Jets = 249860;

DLC_Vehicle_List = [];

_ownedDLCs = getDLCs 1;

if !(DLC_ID_Karts in _ownedDLCs) then {
	{
		DLC_Vehicle_List pushBack _x;
	} forEach DLC_Vehicles_Karts;
};

if !(DLC_ID_Helicopters in _ownedDLCs) then {
	{
		DLC_Vehicle_List pushBack _x;
	} forEach DLC_Vehicles_Helicopters;
};

if !(DLC_ID_Apex in _ownedDLCs) then {
	{
		DLC_Vehicle_List pushBack _x;
	} forEach DLC_Vehicles_Apex;
};

if !(DLC_ID_Jets in _ownedDLCs) then {
	{
		DLC_Vehicle_List pushBack _x;
	} forEach DLC_Vehicles_Jets;
};

DLC_Functions_Loop = {
	while {true} do {
		{
			_vehicles = entities _x;
			{
				if ((isNil{_x getVariable "DLC_Var_Active"}) && (alive _x)) then {
					_x setVariable ["DLC_Var_Active",true];
					_x setVariable ["DLC_Var_AddAction_Active",false];
					[_x] spawn DLC_Functions_Handle;
				};
				if (((_x getVariable "DLC_Var_Active") isEqualTo true) && !(alive _x)) then {
					_x setVariable ["DLC_Var_Active",false];
					[_x] call DLC_Functions_RemoveAction;
				};
			} forEach _vehicles;
		} forEach DLC_Vehicle_List;
	sleep 0.1;
	};
};

DLC_Functions_Handle = {
	_vehicle = _this select 0;
	while {(((_vehicle getVariable "DLC_Var_Active") isEqualTo true) && (alive _vehicle))} do {
		_lockedState = locked _vehicle;
		if ((vehicle player != player) && (alive _vehicle)) then {
			[_vehicle] call DLC_Functions_RemoveAction;
		} else {
			if (!(isNull(driver _vehicle)) && ((_vehicle getVariable "DLC_Var_AddAction_Active") isEqualTo true) && ((_vehicle getVariable "DLC_Var_Active") isEqualTo true) && (alive _vehicle)) then {
				[_vehicle] call DLC_Functions_RemoveAction;
			} else {
				if ((vehicle player == player) && ((_vehicle getVariable "DLC_Var_Active") isEqualTo true) && ((_vehicle getVariable "DLC_Var_AddAction_Active") isEqualTo false) && (alive _vehicle) && (((_lockedState == 2) or (_lockedstate == 3)) isEqualTo false)) then {
				[_vehicle] call DLC_Functions_AddAction;
				} else {
					if ((vehicle player == player) && ((_vehicle getVariable "DLC_Var_Active") isEqualTo true) && ((_vehicle getVariable "DLC_Var_AddAction_Active") isEqualTo true) && (alive _vehicle) && (((_lockedState == 2) or (_lockedstate == 3)) isEqualTo true)) then {
					[_vehicle] call DLC_Functions_RemoveAction;
					};
				};
			};
		};
		sleep 0.1;
	};
};

DLC_Functions_AddAction = {
	_vehicle = _this select 0;
	_type = (typeOf (vehicle _vehicle));
	_config  = (configFile >>  "CfgVehicles" >>  _type);
	_displayVehicle = if (isText(_config >> "displayName")) then {getText(_config >> "displayName")};
	_displayVehicle = "<t color='#FFFF00'>" + _displayVehicle + "<t/>";
	DLC_AddAction_1 = _vehicle addAction ["<t color='#FF0000'>Get in<t/> " + _displayVehicle + " <t color='#FF0000'>without DLC</t>",{player moveInDriver (_this select 0)},[],1,false,true,"","_this distance _target < 8"];
	_vehicle setVariable ["DLC_Var_AddAction_Active",true];
	_vehicle setVariable ["DLC_Var_AddAction_Number",DLC_AddAction_1];
};

DLC_Functions_RemoveAction = {
	_vehicle = _this select 0;
	_action = _vehicle getVariable "DLC_Var_AddAction_Number";
	_vehicle removeAction _action;
	_vehicle setVariable ["DLC_Var_AddAction_Active",false];
};

[] spawn DLC_Functions_Loop;