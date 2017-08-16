#include <macro.h>

private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = SEL(_this,0);
_code = SEL(_this,1);
_shift = SEL(_this,2);
_ctrlKey = SEL(_this,3);
_alt = SEL(_this,4);
_speed = speed cursorObject;
_handled = false;
_interactionKey = if(count (actionKeys "User10") isEqualTo 0) then {219} else {(actionKeys "User10") select 0};
_getOverKey = if(count (actionKeys "GetOver") isEqualTo 0) then {4} else {(actionKeys "GetOver") select 0};
_sprintKey = if(count (actionKeys "Turbo") isEqualTo 0) then {42} else {(actionKeys "Turbo") select 0};
_crouchKey = if(count (actionKeys "Crouch") isEqualTo 0) then {45} else {(actionKeys "Crouch") select 0};
_inventoryKey = if(count (actionKeys "Gear") isEqualTo 0) then {23} else {(actionKeys "Gear") select 0};
_proneKey = if(count (actionKeys "Prone") isEqualTo 0) then {44} else {(actionKeys "Prone") select 0};
_mapKey = SEL(actionKeys "ShowMap",0);
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

if((_code in (actionKeys "Gear")) && {(!(isNull (findDisplay 602)))} && {(isPlayer cursorObject OR vehicle cursorObject != cursorObject OR alive cursorObject)}) then
{
	closeDialog 0;
	closeDialog 0;
	_handled = true;
};

//Vault handling...

if((_code in (actionKeys "ShowMap") || _code in (actionKeys "GetOver") || {_code in (actionKeys "salute")} || {_code in (actionKeys "Gear")} || {_code in (actionKeys "SitDown")} || {_code in (actionKeys "Throw")} || {_code in (actionKeys "GetIn")} || {_code in (actionKeys "GetOut")} || {_code in (actionKeys "Fire")} || {_code in (actionKeys "ReloadMagazine")}) && {(player getvariable ["restrained",false])}) exitWith {
	systemChat "Action not allowed while restrained.";
	true;
};

if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || {_code in (actionKeys "Gear")} || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player getvariable ["restrained",false]) || (player getvariable ["playerSurrender",false]) || life_isknocked || life_istazed)) exitWith {
	_handled = true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

if((_code in [_getOverKey,_sprintKey,_proneKey]) && {!(isNil "life_is_arrested")}) exitWith {true;};

if (_code in (actionKeys "TacticalView")) then
{
	hintSilent "Command mode not allowed";
	_handled = true;
};

if (life_BrokenLeg && (_code in (actionKeys "MoveUp") || _code in (actionKeys "MoveDown") || _code in (actionKeys "Stand") || _code in (actionKeys "Crouch"))) then
{
	_handled = true;
};

switch (_code) do {
	case 2: {
		if(_shift) then {_handled = true;};
		if (_shift) then {
			if (isNull objectParent player && {!(player getVariable ["restrained", false])} && {(animationState player) != "Incapacitated"} && {!life_istazed}) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else {
					[] spawn life_fnc_steswethup;
				};
			};
		};
	};



	case _interactionKey: {
		if(!life_action_inUse && {!dialog} && {!(player getVariable["surrender",false])}) then
		{
			if(_ctrlKey) then {
				if(playerSide isEqualTo civilian && {isNull objectParent player} && {!(player getVariable ["restrained",false])}) then
				{
					[] spawn life_fnc_wacrastukumu;
					life_action_inUse = false;
				};
				if(playerSide isEqualTo west && {isNull objectParent player} && (cursorTarget getVariable "restrained") && {!(player getVariable ["restrained",false])}) then
				{
					[cursorTarget] call life_fnc_generalInteractionMenu;
					life_action_inUse = false;
				} else {
					if(playerSide isEqualTo west && {isNull objectParent player} && {!(cursorTarget getVariable "restrained")} && {!(player getVariable ["restrained",false])}) then
					{
						[cursorTarget] call life_fnc_copInteractionMenu;
						life_action_inUse = false;
					};
				};
			} else {
				[] spawn {
					call life_fnc_cekaxephefr;
					life_action_inUse = false;
				};
			};
		};
		_handled = true;
	};

	//Space key for Jumping
	case 57: {
		if(_shift) then
		{
			if(isNil "jumpActionTime") then {jumpActionTime = 0;};
			if(animationState player != "AovrPercMrunSrasWrflDf" && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2.5} && {isNil "life_is_arrested"} && {((velocity player) select 2 < 2.5)} && {(time - jumpActionTime > 1.5)}) then
			{
				//if !(isNil "life_is_arrested") exitWith {_handled = false;};
				jumpActionTime = time; //Update the time.
				[player,true] spawn life_fnc_gedudrexa;
				[player,false] remoteExecCall ["life_fnc_gedudrexa",-2];
				_handled = true;
			};
		};
	};

	case 32: {
		if (alcohol_level > 0 && {(vehicle player) != player} && {(driver (vehicle player)) isEqualTo player}) then
		{
			_chance = ((1 - alcohol_level) * 100) * 0.5;
			if (floor (random _chance) isEqualTo 0) then { _handled = true; };
		};
	};
	//Map Key
	case _mapKey: {
		if(!(player getVariable ["restrained",false])) then {
			switch (playerSide) do {
				case west: {if(!visibleMap) then {[] spawn life_fnc_jephastubr;}};
				case independent: {if(!visibleMap) then {[] spawn life_fnc_chutetrasa;}};
				default {};
			};
		};
	};

	//Holster / recall weapon. (Shift + H)
	case 35: {
		if(_shift && {!_ctrlKey} && {!(EQUAL(currentWeapon player,""))}) then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};

		if(!_shift && _ctrlKey && {!isNil "life_curWep_h"} && {!(EQUAL(life_curWep_h,""))}) then {
			if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};

	case 211: {
		if(!life_knockout && (count(nearestObjects [player,["weaponholder"],3])>0) && !(player getVariable["restrained",false]) && !life_istazed && !(player getVariable["surrender",false])) then
			{
						_handled = true;
						[] spawn life_fnc_seize;
			};
	 };

	//Restraining (Shift + R)
	case 19: {
		if(_shift) then {_handled = true;};
		if(_shift && {playerSide isEqualTo west} && {!(cursorObject getVariable "Escorting")} && {!(cursorObject getVariable "restrained")} && {_speed < 1}) then
		{
			call life_fnc_qunarechegak;
			//[player,"handcuff",5] call life_fnc_globalSound;
		} else {if(_ctrlKey) then {_handled = true;};if(_ctrlKey && {playerSide isEqualTo west} && {isNull life_objectPlacing}) then {
		 if(["spikeStrip",1] call life_fnc_virtualItemRemove) then {
		 [] call life_fnc_drubrafrep;
		 closeDialog 0;
			 };
		 };
	 };
	};
	// Shift + G Robbing
	case 34: {
		if(_shift && {playerSide isEqualTo civilian} && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject distance player < 4} && {speed cursorObject < 1}) then
		{
			if((animationState cursorObject) != "Incapacitated" && {(currentWeapon player isEqualTo RIFLE OR currentWeapon player isEqualTo PISTOL)} && {currentWeapon player != ""} && {!life_knockout} && {!(player getVariable ["restrained",false])} && {!(cursorObject GVAR["restrained",false])} && {!life_istazed} && {!(player GVAR["surrender",false])}) then
			{
				[cursorObject] spawn life_fnc_bawrabekurut;
			};
			_handled = true;
		};
	};
	//Shift + Z Restrain Civilian (NEED ZIPTIE)
	case 44:
	{
		if(_shift) then {_handled = true;};
		if(_shift && {playerSide isEqualTo civilian} && {cursorObject getVariable ["out",false]} && {!(cursorObject getVariable "Escorting")} && {_speed < 1}) then
		{
			if (["ziptie",1] call life_fnc_virtualItemRemove) then
			{
				if!(cursorObject getVariable "Restrained") then
				{
					call life_fnc_bewracheweph;
				}
				else
				{
					hint "This person is already restrained";
				};
			}
			else
			{
				hintSilent "You need Zipties!";
			};
		};
	};
	//T Key (Trunk)
	case 20: {
		if(!_alt && {!_ctrlKey} && {!dialog} && {!life_is_processing}) then {
			if(cursorObject isKindOf "Land_Suitcase_F") then {
				[cursorObject] call life_fnc_koucluboeziuwoa;
			};
		};
	};

	//L Key?
	case 38: {
		//If cop run checks for turning lights on.
		if(_shift && {playerSide in [west,independent]}) then {
			if(vehicle player != player && {(typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]}) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide isEqualTo west) then {
						[vehicle player] call life_fnc_thuyequpruye;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
		if(!_alt && !_ctrlKey) then {[] call life_fnc_radar;};
	};

	//Y Player Menu
	case 21: {
		if(!life_knockout && {isNil "life_is_arrested"} && !(player getVariable["restrained",false]) && !life_istazed && !(player getVariable["surrender",false]) OR (call life_adminlevel > 0)) then {
				call life_fnc_p_openMenu;
			} else {
				hintSilent "You can't use your tablet now!";
		};
	};

	case 58: {
		if(player getVariable ["restrained",false]) then {
			_handled = true;
		};
		if (!alive player) then {
			_handled = true;
			player setVariable ["tf_unable_to_use_radio", true];
		};
	};
	// O, police gate opener
  case 24: {
		if (!_shift && !_alt && !_ctrlKey && (playerSide isEqualTo west) && (vehicle player != player)) then {
			call life_fnc_wecraraswuwa;
		};
	};

	//Shift+P = Faded Sound
	case 25: {
		if(_shift) then
		{
			call life_fnc_xecutrexes;
			_handled = true;
		};
	};

	//U Key
	case 22: {
		if(!_alt && !_ctrlKey) then {
			if(isNull objectParent player) then {
				_veh = cursorObject;
			} else {
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F" && {playerSide == civilian}) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(EQUAL(_door,0)) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh GVAR [format["bis_disabled_Door_%1",_door],0];

					if(EQUAL(_locked,0)) then {
						_veh SVAR [format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh SVAR [format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(EQUAL(_locked,2)) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[_veh,0] remoteExecCall ["life_fnc_lockVehicle",_veh];
						};
						systemChat localize "STR_MISC_VehUnlock";
					  [player,"unlock",15] remoteExecCall ["life_fnc_quvucamaph",-2];
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[_veh,2] remoteExecCall ["life_fnc_lockVehicle",_veh];
						};
						systemChat localize "STR_MISC_VehLock";
					  [player,"lock",15] remoteExecCall ["life_fnc_quvucamaph",-2];
					};
				};
			};
		};
	};
};

_handled;
