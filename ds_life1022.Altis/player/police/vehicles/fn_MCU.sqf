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
			{
			  deleteVehicle _x;
			} forEach attachedObjects _mcu;
			_gun = (nearestObjects [player, ["Land_BagFence_Long_F"], 50]);
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
			_mcu setFuel 1;
			_mcu setVariable ["packed",false,true];
			if(miscInfoArray select 8)then {
				_DS_veh1 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh1 attachTo [_mcu,[3,3,-0.8]];
				_DS_veh2 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh2 attachTo [_mcu,[-3,3,-0.8]];
				_DS_veh3 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh3 attachTo [_mcu,[-3.4,3.3,-0.8]];
				_DS_veh4 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh4 attachTo [_mcu,[3.4,3.3,-0.8]];
				_DS_veh5 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh5 attachTo [_mcu,[3,-4,-0.8]];
				_DS_veh6 = createSimpleObject ["",[0,0,0]];_DS_veh6 attachTo [_mcu,[-3,-4,-0.8]];
				_DS_veh7 = createSimpleObject ["",[0,0,0]];_DS_veh7 attachTo [_mcu,[-3.4,-4.3,-0.8]];
				_DS_veh8 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh8 attachTo [_mcu,[3.4,-4.3,-0.8]];
				_DS_veh9 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh9 attachTo [_mcu,[5.5,-1.6,-0.8]];_DS_veh9 setDir 90;
				_DS_veh10 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh10 attachTo [_mcu,[5.9,-2,-0.8]];_DS_veh10 setDir 90;
				_DS_veh11 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh11 attachTo [_mcu,[-5.5,-1.6,-0.8]];_DS_veh11 setDir 90;
				_DS_veh12 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh12 attachTo [_mcu,[-5.9,-2,-0.8]];_DS_veh12 setDir 90;
				_DS_veh17 = createSimpleObject ["Land_FuelStation_Shed_F",[0,0,0]];_DS_veh17 attachTo [_mcu,[0,0,-2]];
				_DS_veh18 = createSimpleObject ["Land_fs_roof_F",[0,0,0]];_DS_veh18 attachTo [_mcu,[2,-1,-1.2]];
				_DS_veh19 = createSimpleObject ["Land_fs_roof_F",[0,0,0]];_DS_veh19 attachTo [_mcu,[-2,-1,-1.2]];
				_DS_veh20 = "Land_Airport_01_controlTower_F" createVehicle [0,0,0];_DS_veh20 attachTo [_mcu,[0,-5,0]];_DS_veh20 setDir 0;
				_DS_veh21 = "B_HMG_01_high_F" createVehicle [0,0,0];_DS_veh21 enableWeaponDisassembly false;_DS_veh21 attachTo [_mcu,[1.3,-5,7]];_DS_veh21 setDir 0;
				_DS_veh21 addWeapon "LMG_M200";_DS_veh21 addMagazineTurret ["2000Rnd_65x39_Belt",[-0]];
				_DS_veh22 = "B_HMG_01_high_F" createVehicle [0,0,0];_DS_veh22 enableWeaponDisassembly false;_DS_veh22 attachTo [_mcu,[-1.3,-5,7]];_DS_veh22 setDir 180;
				_DS_veh22 addWeapon "LMG_M200";_DS_veh22 addMagazineTurret ["2000Rnd_65x39_Belt",[-0]];
				_DS_veh23 = "B_HMG_01_high_F" createVehicle [0,0,0];_DS_veh23 enableWeaponDisassembly false;_DS_veh23 attachTo [_mcu,[0,-2,7]];_DS_veh23 setDir 270;
				_DS_veh23 addWeapon "LMG_M200";_DS_veh23 addMagazineTurret ["2000Rnd_65x39_Belt",[-0]];
				_DS_veh24 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh24 attachTo [_mcu,[-6,-7.5,-0.8]];_DS_veh24 setDir 90;
				_DS_veh25 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh25 attachTo [_mcu,[-6,-7,-0.8]];_DS_veh25 setDir 90;
				_DS_veh26 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh26 attachTo [_mcu,[-4,-10,-0.8]];
				_DS_veh27 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh27 attachTo [_mcu,[-3.7,-10,-0.8]];
				_DS_veh28 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh28 attachTo [_mcu,[-1.2,-8,-0.8]];_DS_veh28 setDir 270;
				_DS_veh29 = createSimpleObject ["Land_CncWall4_F",[0,0,0]];_DS_veh29 attachTo [_mcu,[1.6,-6.6,-0.8]];_DS_veh29 setDir 135;
				_DS_veh30 = createSimpleObject ["Land_CncShelter_F",[0,0,0]];_DS_veh30 attachTo [_mcu,[4.3,2,-0.8]];_DS_veh30 setDir 90;
				_DS_veh31 = createSimpleObject ["Land_CncShelter_F",[0,0,0]];_DS_veh31 attachTo [_mcu,[-4.9,2,-0.8]];_DS_veh31 setDir 90;
			} else {
				_gun = "B_HMG_01_high_F" createVehicle [0,0,0];
				_gun enableWeaponDisassembly false;
				_gun attachTo[_mcu,[0,-3.8,2.5]];
				_gun setDir 180;
				_gun2 = "B_HMG_01_high_F" createVehicle [0,0,0];
				_gun2 enableWeaponDisassembly false;
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
			};
			hint "MCU Activated";
			if((DS_infoArray select 21) == 12)then { [3] call DS_fnc_questCompleted };
			};
		};
	case 1:
		{
		[nil,nil,nil,[nil,[666,14,21,22,23,37,24,92,69,132]]] spawn DS_fnc_menuShop;
		};
	case 2:
		{
		_mcu lock 0;
		_gun = (nearestObjects [player, ["B_HMG_01_high_F"],  10] select 0);
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
		_mcuTruck = (nearestObjects [player, ["O_Truck_03_covered_F"],  50] select 0);
		_mcuBoat = (nearestObjects [player, ["I_C_Boat_Transport_02_F"],  50] select 0);
		if(!isNil "_mcuBoat")then{if(!(_mcuBoat getVariable ["isMCUWater",false]))then{_mcuBoat = nil;};};
		if((isNil "_mcuTruck")&&(isNil "_mcuBoat"))exitwith{hint "There is no MCU nearby"};
		sleep 2;
		_fail = false;
		if(!isNil "_mcuTruck")then
			{
				{
					  deleteVehicle _x;
				} forEach attachedObjects _mcuTruck;
				deleteVehicle _mcuTruck;
			};
		if(!isNil "_mcuBoat")then
			{
			if(!(_mucBoat getVariable ["isMCUWater",false]))exitwith{_fail = true;};
				{
					  deleteVehicle _x;
				} forEach attachedObjects _mcuBoat;
				deleteVehicle _mcuBoat;
			};
		if(_fail)exitwith{hint "This boat is not an mcu"};
		police_command_unitActive = false;
		publicVariable "police_command_unitActive";
		[50000,true] remoteExec ["HUNT_fnc_policeBank",2];
		};
	};
DS_doingStuff = false;