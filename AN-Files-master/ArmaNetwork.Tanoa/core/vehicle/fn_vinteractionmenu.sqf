#include <macro.h>
/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
_display = findDisplay 37400;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
life_vInact_curTarget = _curTarget;
_locked = locked _curTarget;
//Set Repair Action
(_display displayCtrl 37450) ctrlSetText "Repair Vehicle";
buttonSetAction [37450,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_hustewruthet;"];

if(damage _curTarget >= 0) then {ctrlEnable [37450,true];} else {ctrlEnable [37450,false];};

switch (playerSide) do
{
	case west:
	{
		if(life_vInact_curTarget in life_vehicles && {isNull objectParent player} && {alive _curTarget}) then {
			{
				ctrlShow [_x,false];
			} forEach [37458,37459,37460,37461,37462,37463,37464,37465,37466];
			_weaponLocker = (life_vInact_curTarget getVariable ["WeaponLocker",[]]);
			if(_locked isEqualTo 2) then {
				(_display displayCtrl 37451) ctrlSetText "Unlock Vehicle";
				buttonSetAction [37451,"closeDialog 0;[0,life_vInact_curTarget] call life_fnc_trawu;"];
			} else {
				(_display displayCtrl 37451) ctrlSetText "Lock Vehicle";
				buttonSetAction [37451,"closeDialog 0;[2,life_vInact_curTarget] call life_fnc_trawu"];
			};
			(_display displayCtrl 37452) ctrlSetText "Vehicle Trunk";
			buttonSetAction [37452,"closeDialog 0;[life_vInact_curTarget] call life_fnc_koucluboeziuwoa;"];

			(_display displayCtrl 37453) ctrlSetText "Pull from Vehicle";
			buttonSetAction [37453,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_vugaqazanus;"];
			if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37453,false];};
			(_display displayCtrl 37454) ctrlSetText "Impound Vehicle";
			buttonSetAction [37454,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_gavanacevacr;"];
			if(_curTarget isKindOf "Ship") then {
				(_display displayCtrl 37455) ctrlSetText "Push Boat";
				buttonSetAction [37455,"closeDialog 0; [] spawn life_fnc_wacrefewuju;"];
				if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37455,true];} else {ctrlEnable [37455,false];};
			} else {
				(_display displayCtrl 37455) ctrlSetText "Unflip Vehicle";
				buttonSetAction [37455,"closeDialog 0; [] spawn life_fnc_badrucraseb;"];
				if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37455,true];} else {ctrlEnable [37455,false];};
			};
			if((call life_swatlevel) > 0 && {count _weaponLocker > 0}) then {
				(_display displayCtrl 37456) ctrlSetText "Weapon Locker";
				buttonSetAction [37456,"closeDialog 0; [life_vInact_curTarget] call life_fnc_drudr"];
			} else {ctrlEnable [37456,false];};
			/*
			if("jaws" in AN_Inventory) then {
				(_display displayCtrl 37457) ctrlSetText "Jaws of Life";
				buttonSetAction [37457,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_qaketugagup;"];
			} else {ctrlShow [37457,false];};
			*/
		} else {
			{
				ctrlShow [_x,false];
			} forEach [37459,37460,37461,37462,37463,37464,37465,37466];
			(_display displayCtrl 37451) ctrlSetText "Registration";
			buttonSetAction [37451,"closeDialog 0; [life_vInact_curTarget] call life_fnc_pusumubacecr;"];

			(_display displayCtrl 37452) ctrlSetText "Search Vehicle";
			buttonSetAction [37452,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_drunarakuswa;"];

			(_display displayCtrl 37453) ctrlSetText "Vehicle Cargo";
			buttonSetAction [37453,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_wathafrudure;"];

			(_display displayCtrl 37454) ctrlSetText "Pull Out Individuals";
			buttonSetAction [37454,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_vugaqazanus;"];
			if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37454,false];};

			(_display displayCtrl 37455) ctrlSetText "Impound";
			buttonSetAction [37455,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_gavanacevacr;"];

			(_display displayCtrl 37456) ctrlSetText "Seize Vehicle";
			if(call life_coplevel > 6) then {
				buttonSetAction [37456,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_seiveh;"];
			} else {
				ctrlEnable [37456,false];
			};
			if(_curTarget isKindOf "Ship") then {
				(_display displayCtrl 37457) ctrlSetText "Push Boat";
				buttonSetAction [37457,"closeDialog 0; [] spawn life_fnc_wacrefewuju; closeDialog 0;"];
				if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37457,true];} else {ctrlEnable [37457,false];};
			} else {
				(_display displayCtrl 37457) ctrlSetText "Unflip Vehicle";
				buttonSetAction [37457,"[] spawn life_fnc_badrucraseb; closeDialog 0;"];
				if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37457,true];} else {ctrlEnable [37457,false];};
			};
			_valItem = [AN_Inventory,"jaws",0] call life_fnc_arrayGetValue;
			if(_valItem >= 1) then {
				(_display displayCtrl 37458) ctrlSetText "Jaws of Life";
				buttonSetAction [37458,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_qaketugagup;"];
			} else {ctrlShow [37458,false];};
		};
	};

	case civilian:
	{
		if(_curTarget in life_vehicles && {isNull objectParent player} && {alive _curTarget}) then {
			{
				ctrlShow [_x,false];
			} forEach [37456,37457,37458,37459,37460,37461,37462,37463,37464,37465,37466];
			if(_locked isEqualTo 2) then {
				(_display displayCtrl 37451) ctrlSetText "Unlock Vehicle";
				buttonSetAction [37451,"closeDialog 0;[0,life_vInact_curTarget] call life_fnc_trawu;"];
			} else {
				(_display displayCtrl 37451) ctrlSetText "Lock Vehicle";
				buttonSetAction [37451,"closeDialog 0;[2,life_vInact_curTarget] call life_fnc_trawu"];
			};
			(_display displayCtrl 37452) ctrlSetText "Vehicle Trunk";
			buttonSetAction [37452,"closeDialog 0;[life_vInact_curTarget] call life_fnc_koucluboeziuwoa;"];
			if(_curTarget isKindOf "Ship") then {
				(_display displayCtrl 37453) ctrlSetText "Push Boat";
				buttonSetAction [37453,"[] spawn life_fnc_wacrefewuju; closeDialog 0;"];
				if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37453,true];} else {ctrlEnable [37453,false];};
			} else {
				if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
					(_display displayCtrl 37453) ctrlSetText "Get in Kart";
					buttonSetAction [37453,"player moveInDriver life_vInact_curTarget; closeDialog 0;"];
					if(count crew _curTarget isEqualTo 0 && {canMove _curTarget} && {locked _curTarget isEqualTo 0}) then {ctrlEnable [37453,true];} else {ctrlEnable [37453,false];};
				} else {
					(_display displayCtrl 37453) ctrlSetText "Unflip Vehicle";
					buttonSetAction [37453,"[] spawn life_fnc_badrucraseb; closeDialog 0;"];
					if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37453,true];} else {ctrlEnable [37453,true];};
				};
			};
			(_display displayCtrl 37454) ctrlSetText localize "STR_vInAct_DeviceMine";
			switch(true) do {
				case (typeOf _curTarget in ["O_Truck_02_fuel_F","O_Truck_03_fuel_F","B_Truck_01_fuel_F"]): {
					buttonSetAction [37454,"[life_vInact_curTarget] spawn life_fnc_deviceOil"];
					if(!isNil {(_curTarget getVariable "mining")}) then {
						ctrlEnable [37454,false];
					} else {
						ctrlEnable [37454,true];
					};
				};
				default {ctrlEnable [37454,false];};
			};
			(_display displayCtrl 37455) ctrlSetText "Pull Individuals Out";
			buttonSetAction [37455,"[life_vInact_curTarget] spawn life_fnc_vugaqazanus;"];
			if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37455,false];};
		} else {
			{
				ctrlShow [_x,false];
			} forEach [37454,37455,37456,37457,37458,37459,37460,37461,37462,37463,37464,37465,37466];
			if(_curTarget isKindOf "Ship") then {
				(_display displayCtrl 37451) ctrlSetText localize "STR_vInAct_PushBoat";
				buttonSetAction [37451,"[] spawn life_fnc_wacrefewuju; closeDialog 0;"];
				if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37451,true];} else {ctrlEnable [37451,false];};
			} else {
				if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
					(_display displayCtrl 37451) ctrlSetText localize "STR_vInAct_GetInKart";
					buttonSetAction [37451,"player moveInDriver life_vInact_curTarget; closeDialog 0;"];
					if(count crew _curTarget isEqualTo 0 && {canMove _curTarget} && {locked _curTarget isEqualTo 0}) then {ctrlEnable [37451,true];} else {ctrlEnable [37451,false];};
				} else {
					(_display displayCtrl 37451) ctrlSetText localize "STR_vInAct_Unflip";
					buttonSetAction [37451,"[] spawn life_fnc_badrucraseb; closeDialog 0;"];
					if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37451,true];} else {ctrlEnable [37451,false];};
				};
			};
			switch(true) do {
				case (typeOf _curTarget in ["O_Truck_02_fuel_F","O_Truck_03_fuel_F","B_Truck_01_fuel_F"]): {
					(_display displayCtrl 37452) ctrlSetText localize "STR_vInAct_DeviceMine";
					buttonSetAction [37452,"[life_vInact_curTarget] spawn life_fnc_deviceOil"];
					if(!isNil {(_curTarget getVariable "mining")}) then {
						ctrlEnable [37452,false];
					} else {
						ctrlEnable [37452,true];
					};
				};
				default {ctrlEnable [37452,false];};
			};
			(_display displayCtrl 37453) ctrlSetText localize "STR_vInAct_PullOut";
			buttonSetAction [37453,"[life_vInact_curTarget] spawn life_fnc_vugaqazanus;"];
			if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37453,false];};
		};
	};
	case independent:
	{
		_weaponLocker = (life_vInact_curTarget getVariable ["WeaponLocker",[]]);
		if(life_vInact_curTarget in life_vehicles && {isNull objectParent player} && {alive _curTarget}) then {
			{
				ctrlShow [_x,false];
			} forEach [37457,37458,37459,37460,37461,37462,37463,37464,37465,37466];
			if(_locked isEqualTo 2) then {
				(_display displayCtrl 37451) ctrlSetText "Unlock Vehicle";
				buttonSetAction [37451,"closeDialog 0;[0,life_vInact_curTarget] call life_fnc_trawu;"];
			} else {
				(_display displayCtrl 37451) ctrlSetText "Lock Vehicle";
				buttonSetAction [37451,"closeDialog 0;[2,life_vInact_curTarget] call life_fnc_trawu"];
			};
			(_display displayCtrl 37452) ctrlSetText "Vehicle Trunk";
			buttonSetAction [37452,"closeDialog 0;[life_vInact_curTarget] call life_fnc_koucluboeziuwoa;"];
			if((call life_mediclevel) > 2 && {count _weaponLocker > 0}) then {
				(_display displayCtrl 37456) ctrlSetText "Quick Loadouts";
				buttonSetAction [37456,"closeDialog 0; [life_vInact_curTarget] call life_fnc_drudr"];
			} else {ctrlShow [37456,false];};
			if(_curTarget isKindOf "Ship") then
			{
				(_display displayCtrl 37453) ctrlSetText localize "STR_vInAct_PushBoat";
				buttonSetAction [37453,"[] spawn life_fnc_wacrefewuju; closeDialog 0;"];
				if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37453,true];} else {ctrlEnable [37453,false];};
			} else {
				(_display displayCtrl 37453) ctrlSetText localize "STR_vInAct_Unflip";
				buttonSetAction [37453,"[] spawn life_fnc_badrucraseb;closeDialog 0;"];
				if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37453,true];} else {ctrlEnable [37453,false];};
			};
			(_display displayCtrl 37454) ctrlSetText localize "STR_vInAct_Impound";
			buttonSetAction [37454,"[life_vInact_curTarget] spawn life_fnc_gavanacevacr; closeDialog 0;"];
			_valItem = [AN_Inventory,"jaws",0] call life_fnc_arrayGetValue;
			if(_valItem >= 1) then {
				(_display displayCtrl 37455) ctrlSetText localize "STR_vInAct_LifeJaws";
				buttonSetAction [37455,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_qaketugagup;"];
			} else {ctrlShow [37455,false];};
		} else {
			{
				ctrlShow [_x,false];
			} forEach [37454,37455,37456,37457,37458,37459,37460,37461,37462,37463,37464,37465,37466];
			if(_curTarget isKindOf "Ship") then
			{
				(_display displayCtrl 37451) ctrlSetText localize "STR_vInAct_PushBoat";
				buttonSetAction [37451,"[] spawn life_fnc_wacrefewuju; closeDialog 0;"];
				if(count crew _curTarget isEqualTo 0) then {ctrlEnable [37451,true];} else {ctrlEnable [37451,false];};
			} else {
				(_display displayCtrl 37451) ctrlSetText localize "STR_vInAct_Unflip";
				buttonSetAction [37451,"[] spawn life_fnc_badrucraseb; closeDialog 0;"];
				if(count crew _curTarget isEqualTo 0 && {canMove _curTarget}) then {ctrlEnable [37451,true];} else {ctrlEnable [37451,false];};
			};
			(_display displayCtrl 37452) ctrlSetText localize "STR_vInAct_Impound";
			buttonSetAction [37452,"[life_vInact_curTarget] spawn life_fnc_gavanacevacr; closeDialog 0;"];
			_valItem = [AN_Inventory,"jaws",0] call life_fnc_arrayGetValue;
			if(_valItem >= 1) then {
				(_display displayCtrl 37453) ctrlSetText localize "STR_vInAct_LifeJaws";
				buttonSetAction [37453,"closeDialog 0; [life_vInact_curTarget] spawn life_fnc_qaketugagup;"];
			} else {ctrlShow [37453,false];};

		};
	};
};
