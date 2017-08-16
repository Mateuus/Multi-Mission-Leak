/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
For when police interact with the MCU
*/
private ["_function","_mcu","_sleep"];

_function = _this select 0;
_mcu = _this select 1;

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
			5 cutRsc ["DS_progress","PLAIN"];
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
					5 cutRsc ["DS_progress","PLAIN"];
					_ui = uiNamespace getVariable "DS_progress";
					_progressBar = _ui displayCtrl 38201;
					_titleText = _ui displayCtrl 38202;
				};
				_cP = _cP + _cpRate;
				_progressBar progressSetPosition _cP;
				_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Packing MCU"];
				if(player distance _mcu > 10) exitwith {};
				if((vehicle player) != player) exitwith {};
				if(_cP >= 1 OR !alive player) exitWith {};
				};
			5 cutText ["","PLAIN"];
			player playActionNow "stop";
			closeDialog 0;
			DS_doingStuff = false;
			if(player distance _mcu > 10) exitwith {hint "packing cancelled because you moved too far from the vehicle"};
			if((vehicle player) != player) exitwith {};
			if(!alive player) exitWith {};
			hint "Command Unit De-activating";
			_mcu allowDamage true;
			_mcu setFuel 1;
			{
			  deleteVehicle _x;
			} forEach attachedObjects _mcu;
			_gun = (nearestobjects [getpos player, ["Land_BagFence_Long_F"],  50]);
			{
				deleteVehicle _x;
			} forEach _gun;
			_mcu setVariable ["packed",true,true];
			}
			else
			{
			DS_doingStuff = true;
			disableSerialization;
			5 cutRsc ["DS_progress","PLAIN"];
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
					5 cutRsc ["DS_progress","PLAIN"];
					_ui = uiNamespace getVariable "DS_progress";
					_progressBar = _ui displayCtrl 38201;
					_titleText = _ui displayCtrl 38202;
				};
				_cP = _cP + _cpRate;
				_progressBar progressSetPosition _cP;
				_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Setting up MCU"];
				if(player distance _mcu > 10) exitwith {};
				if((vehicle player) != player) exitwith {};
				if(_cP >= 1 OR !alive player) exitWith {};
				};
			5 cutText ["","PLAIN"];
			player playActionNow "stop";
			closeDialog 0;
			DS_doingStuff = false;
			if(player distance _mcu > 10) exitwith {hint "Setting up cancelled because you moved too far from the vehicle"};
			if((vehicle player) != player) exitwith {};
			if(!alive player) exitWith {};
			hint "Command Unit Activating";
			_mcu allowDamage false;
			_mcu setFuel 1;
			_mcu setVariable ["packed",false,true];
			_gun = "B_HMG_01_high_F" createVehicle [0,0,0];
			_gun attachTo[_mcu,[0,-3.8,2.5]];
			_gun setDir 180;
			_gun2 = "B_HMG_01_high_F" createVehicle [0,0,0];
			_gun2 attachTo[_mcu,[0,2,2]];
			_gun removeMagazinesTurret ["500Rnd_127x99_mag_Tracer_Red",[-0]];
			_gun2 removeMagazinesTurret ["500Rnd_127x99_mag_Tracer_Red",[-0]];
			_gun addMagazineTurret ["500Rnd_127x99_mag_Tracer_Yellow",[-0]];
			_gun2 addMagazineTurret ["500Rnd_127x99_mag_Tracer_Yellow",[-0]];
			_gun addWeapon "LMG_M200";
			_gun2 addWeapon "LMG_M200";
			_gun removeWeapon "HMG_01";
			_gun2 removeWeapon "HMG_01";
			_gun addMagazineTurret ["2000Rnd_65x39_Belt",[-0]];
			_gun2 addMagazineTurret ["2000Rnd_65x39_Belt",[-0]];
			_wall1 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall1 attachTo[_mcu,[3,-4.6,-1]];
			_wall2 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall2 attachTo[_mcu,[-3,-4.6,-1]];
			_wall3 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall3 attachTo[_mcu,[3,3.3,-1]];
			_wall3 setDir 180;
			_wall4 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall4 attachTo[_mcu,[-3,3.3,-1]];
			_wall4 setDir 180;
			_wall5 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall5 attachTo[_mcu,[0,3.3,-1]];
			_wall5 setDir 180;
			_wall6 = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
			_wall6 attachTo[_mcu,[0,-4.6,1]];
			_wall6 setDir 180;
			_wall1 allowDamage false;
			_wall2 allowDamage false;
			_wall3 allowDamage false;
			_wall4 allowDamage false;
			_wall5 allowDamage false;
			hint "MCU Activated";
			if((DS_infoArray select 21) == 12)then{[3] call DS_fnc_questCompleted};
			};
		};
	case 1:
		{
		[nil,nil,nil,[nil,[666,14,21,22,23,37,24,92,69,132]]] spawn DS_fnc_menuShop;
		};
	case 2:
		{
		_mcu lock 0;
		_gun = (nearestobjects [getpos player, ["B_HMG_01_high_F"],  10] select 0);
		//if(count crew _gun > 0)exitwith{hint "Somebody is already using this weapon"};
		player moveInGunner _gun;
		DS_inGunner = true;
		DS_action_gunExit = player addAction["Exit Gun",DS_cop_exitGun,"",0,false,false,"",'DS_inGunner'];
		};
	case 3:
		{
		[] spawn DS_cop_sandBag;
		};
	case 4:
		{
		Hint "Repairing Nearby Vehicles . . . . . ";
		sleep 5;
		_nearVehicles = (nearestObjects [getPos Player, ["LandVehicle","Air","Ship"], 30]);
		{
			if(!local _x)then
				{
				[[[_x],{(_this select 0) setDamage 0;}],"BIS_fnc_spawn",_x,false] spawn BIS_fnc_MP;
				[[[_x],{(_this select 0) setVehicleAmmo 1;}],"BIS_fnc_spawn",_x,false] spawn BIS_fnc_MP;
				[[[_x],{(_this select 0) setFuel 1;}],"BIS_fnc_spawn",_x,false] spawn BIS_fnc_MP;
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
		_mcuTruck = (nearestobjects [getpos player, ["O_Truck_03_covered_F"],  50] select 0);
		if(isNil "_mcuTruck")exitwith{hint "There is no MCU nearby"};
		sleep 2;
		{
			  deleteVehicle _x;
		} forEach attachedObjects _mcuTruck;
		deleteVehicle _mcuTruck;
		police_command_unitActive = false;
		publicVariable "police_command_unitActive";
		[[50000,true],"HUNT_fnc_policeBank",false,false] spawn DS_fnc_MP;
		};
	};
DS_doingStuff = false;