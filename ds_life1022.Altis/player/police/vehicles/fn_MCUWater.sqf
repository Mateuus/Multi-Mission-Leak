/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	For when police interact with the MCU
*/

private ["_function","_mcu","_sleep"];

_function = _this select 0;
_mcu = _this select 1;
_mcu setVariable ["stolen",false,true];
if(DS_doingStuff)exitwith{};
closeDialog 0;
switch(_function)do
	{
	case 0:
		{
		if(!(_mcu getVariable ["packed",false]))then
			{
			DS_doingStuff = true;
			disableSerialization;
			"progressBar" cutRsc ["DS_progress","PLAIN"];
			_ui = uiNamespace getVariable "DS_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
			_titleText ctrlSetText format["%2 (1%1)...","%","Packing MCU"];
			_progressBar progressSetPosition 0.01;
			_cP = 0.01;
			_cpRate = 0.01;
			if(DS_moral > 800)then{_sleep = 0.25}else{_sleep = 0.5};
			if((DS_infoArray select 21) > 16)then{_sleep = (_sleep/2);};
			if((player getVariable ["policeSquad",""]) == "Rapid Response")then
				{
				_sleep = (_sleep/2);
				};
			while {true} do
				{
				sleep _sleep;
				if(isNull _ui) then {
					"progressBar" cutRsc ["DS_progress","PLAIN"];
					_ui = uiNamespace getVariable "DS_progress";
					_progressBar = _ui displayCtrl 38201;
					_titleText = _ui displayCtrl 38202;
				};
				_cP = _cP + _cpRate;
				_progressBar progressSetPosition _cP;
				_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Packing MCU"];
				if(player distance _mcu > 10) exitwith {};
				if(!isNull objectParent player) exitwith {};
				if(_cP >= 1 OR !alive player) exitWith {};
				};
			"progressBar" cutText ["","PLAIN"];
			player playActionNow "stop";
			closeDialog 0;
			DS_doingStuff = false;
			if(player distance _mcu > 10) exitwith {hint "packing cancelled because you moved too far from the vehicle"};
			if(!isNull objectParent player) exitwith {};
			if(!alive player) exitWith {};
			hint "Command Unit De-activating";
			_mcu allowDamage true;
			_mcu setFuel 1;
			[[_mcu],{(_this select 0) setFuel 1;}] remoteExec ["BIS_fnc_spawn",0];
			{
			  deleteVehicle _x;
			} forEach attachedObjects _mcu;
			_gun = (nearestObjects [player, ["Land_BagFence_Long_F"],  50]);
			{
				deleteVehicle _x;
			} forEach _gun;
			_mcu setVariable ["packed",true,true];
			}
			else
			{
			DS_doingStuff = true;
			disableSerialization;
			"progressBar" cutRsc ["DS_progress","PLAIN"];
			_ui = uiNamespace getVariable "DS_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
			_titleText ctrlSetText format["%2 (1%1)...","%","Setting up MCU"];
			_progressBar progressSetPosition 0.01;
			_cP = 0.01;
			_cpRate = 0.01;
			if(DS_moral > 800)then{_sleep = 0.25}else{_sleep = 0.5};
			if((DS_infoArray select 21) > 16)then{_sleep = (_sleep/2);};
			while {true} do
				{
				sleep _sleep;
				if(isNull _ui) then {
					"progressBar" cutRsc ["DS_progress","PLAIN"];
					_ui = uiNamespace getVariable "DS_progress";
					_progressBar = _ui displayCtrl 38201;
					_titleText = _ui displayCtrl 38202;
				};
				_cP = _cP + _cpRate;
				_progressBar progressSetPosition _cP;
				_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Setting up MCU"];
				if(player distance _mcu > 10) exitwith {};
				if(!isNull objectParent player) exitwith {};
				if(_cP >= 1 OR !alive player) exitWith {};
				};
			"progressBar" cutText ["","PLAIN"];
			player playActionNow "stop";
			closeDialog 0;
			DS_doingStuff = false;
			if(player distance _mcu > 10) exitwith {hint "Setting up cancelled because you moved too far from the vehicle"};
			if(!isNull objectParent player) exitwith {};
			if(!alive player) exitWith {};
			hint "Command Unit Activating";
			_mcu allowDamage false;
			_mcu setFuel 0;
			[[_mcu],{(_this select 0) setFuel 0;}] remoteExec ["BIS_fnc_spawn",0];
			_mcu setVariable ["packed",false,true];
			_wall1 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall1 attachTo[_mcu,[3,-3.6,0]];
			_wall2 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall2 attachTo[_mcu,[-3,-3.6,0]];
			_wall3 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall3 attachTo[_mcu,[-3,2.5,0]];
			_wall4 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall4 attachTo[_mcu,[3,2.5,0]];
			_wall5 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall5 attachTo[_mcu,[5,0.5,0]];
			_wall5 setDir 90;
			_wall6 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall6 attachTo[_mcu,[-5,0.5,0]];
			_wall6 setDir 90;
			_wall7 = "Land_Cargo_Patrol_V3_F" createVehicle [0,0,0];
			_wall7 attachTo[_mcu,[2,1,1.5]];
			_wall7 setDir 90;
			_wall1 allowDamage false;
			_wall2 allowDamage false;
			_wall3 allowDamage false;
			_wall4 allowDamage false;
			_wall5 allowDamage false;
			_wall6 allowDamage false;
			_wall7 allowDamage false;
			hint "MCU Activated";
			};
		};
	case 1:
		{
		[nil,nil,nil,[nil,[666,14,21,22,23,37,24,92,69,132]]] spawn DS_fnc_menuShop;
		};
	case 2:
		{
		/*
		_mcu lock 0;
		_gun = (nearestObjects [player, ["B_HMG_01_high_F"],  10] select 0);
		//if(count crew _gun > 0)exitwith{hint "Somebody is already using this weapon"};
		player moveInGunner _gun;
		DS_inGunner = true;
		DS_action_gunExit = player addAction["Exit Gun",DS_cop_exitGun,"",0,false,false,"",'DS_inGunner'];
		*/
		};
	case 3:
		{
		/*
		[] spawn DS_cop_sandBag;
		*/
		};
	case 4:
		{
		Hint "Repairing Nearby Vehicles . . . . . ";
		sleep 5;
		_nearVehicles = (nearestObjects [player, ["LandVehicle","Air","Ship"], 30]);
		{
			if(!local _x)then
				{
				[[_x],{(_this select 0) setDamage 0;}] remoteExec ["BIS_fnc_spawn",_x];
				[[_x],{(_this select 0) setVehicleAmmo 1;}] remoteExec ["BIS_fnc_spawn",_x];
				[[_x],{(_this select 0) setFuel 1;}] remoteExec ["BIS_fnc_spawn",_x];
				}
				else
				{
				_x setDamage 0;
				_x setVehicleAmmo 1;
				_x setFuel 1;
				};
		}forEach _nearVehicles;
		Hint "Vehicles repaired, rearmed and refuelled";
		};
	case 5:
		{
		hint "Storing the MCU";
		_mcuTruck = (nearestObjects [player, ["I_C_Boat_Transport_02_F"],  50] select 0);
		if(isNil "_mcuTruck")exitwith{hint "There is no MCU nearby"};
		sleep 2;
		{
			  deleteVehicle _x;
		} forEach attachedObjects _mcuTruck;
		deleteVehicle _mcuTruck;
		police_command_unitActive = false;
		publicVariable "police_command_unitActive";
		[50000,true] remoteExec ["HUNT_fnc_policeBank",2];
		};
	};
DS_doingStuff = false;