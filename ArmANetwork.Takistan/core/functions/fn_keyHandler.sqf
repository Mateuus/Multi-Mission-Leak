#include <macro.h>

/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = SEL(_this,0);
_code = SEL(_this,1);
_shift = SEL(_this,2);
_ctrlKey = SEL(_this,3);
_alt = SEL(_this,4);
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if((EQUAL(count (actionKeys "User10"),0))) then {219} else {(actionKeys "User10") select 0};
_mapKey = SEL(actionKeys "ShowMap",0);
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player GVAR ["restrained",true])} && {(player GVAR ["tied",true])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

if (life_barrier_active) then {
	 switch (_code) do
	 {
			 case 57: //space key
			 {
					 [] spawn life_fnc_placeablesPlaceComplete;
			 };
	 };
	 true;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(!(EQUAL(count (actionKeys "User10"),0)) && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn {
			private "_handle";
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do {
	//Space key for Jumping
	case 57: {
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {!(EQUAL(animationState player,"AovrPercMrunSrasWrflDf"))} && {isTouchingGround player} && {EQUAL(stance player,"STAND")} && {speed player > 2} && {!life_is_arrested} && {SEL((velocity player),2) < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution
			_handled = true;
		};
	};

	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
		};
	};

	//Holster / recall weapon.
	case 35: {
		if(_shift && !_ctrlKey && !(EQUAL(currentWeapon player,""))) then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
			[] spawn life_fnc_AntiSpam2;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(EQUAL(life_curWep_h,""))}) then {
			if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
				player selectWeapon life_curWep_h;
				[] spawn life_fnc_AntiSpam2;
			};
		};
	};

	case 4:
	{
		player playActionNow "gestureHi";
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey: {
		if(!life_action_inUse) then {
			[] spawn  {
				private "_handle";
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
				[] spawn life_fnc_AntiSpam2;
			};
		};
	};

	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
			//[player,"handcuff",5] call life_fnc_globalSound;
		};
	};
	// Shift + G Robbing
	case 34:
	{
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == RIFLE OR currentWeapon player == PISTOL) && currentWeapon player != "" && !life_knockout && !(player GVAR["restrained",false]) && !life_istazed && !(player GVAR["surrender",false])) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
				[] spawn life_fnc_AntiSpam2;
			};
			_handled = true;
		};
	};
	//Shift + Z Restrain Civilian (NEED ZIPTIE)
	case 44:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !(player getVariable["surrender",false]) && speed cursorTarget < 1) then
		{
			if([false,"ziptie",1] call life_fnc_handleInv) then
			{
				[] call life_fnc_ziptieAction;
				//[player,"ziptie",5] call life_fnc_globalSound;
			};
		};
	};

	//Shift + 1 (surrender)
	case 2:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player GVAR ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player GVAR ["surrender", false]) then
				{
					player SVAR ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
					[] spawn life_fnc_AntiSpam2;
				};
			};
		};
	};

		//CAPSLOCK CHECK
	case 58:
	{
		if((player getVariable ["tied", false])) then {
			_handled = true;
		};
		if (!alive player) then {
			_handled = true;
			player setVariable ["tf_unable_to_use_radio", true];
		};
		if((player getVariable ["restrained", false])) then {
			_handled = true;
		};
	};


	//T Key (Trunk)
	case 20: {
		if(!_alt && !_ctrlKey && !life_is_processing) then {
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in life_vehicles) then {
					[vehicle player] call life_fnc_openInventory;
					[] spawn life_fnc_AntiSpam2;
				};
			} else {
				private "_list";
				_list = ["landVehicle","Air","Ship","House_F"];
				if(KINDOF_ARRAY(cursorTarget,_list) && {player distance cursorTarget < 7} && {vehicle player == player} && {alive cursorTarget}) then {
					if(cursorTarget in life_vehicles OR {!(cursorTarget GVAR ["locked",true])}) then {
						[cursorTarget] call life_fnc_openInventory;
						[] spawn life_fnc_AntiSpam2;
					};
				};
			};
		};
	};
	//L Key?
	case 38: {
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then {
				if(!isNil {vehicle player GVAR "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};

		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};

	//Y Player Menu
	case 21: {
		if((animationState cursorTarget) != "Incapacitated" && !life_knockout && !(player GVAR["restrained",false]) && !(player GVAR["tied",false]) && !life_istazed && !(player GVAR["surrender",false])) then {
				[] call life_fnc_p_openMenu;
				[] spawn life_fnc_AntiSpam2;
			} else {
			hint "You can't use your tablet now!";
		};
	};

	//F Key
	case 33: {
		_list = ["landVehicle","Ship"];
		_veh = vehicle player;
			if(_ctrlKey && !_alt) then {
				//if(_ctrlKey) then {_handled = true;};
				if(_ctrlKey && KINDOF_ARRAY(_veh,_list) && playerSide in [west,independent] && {vehicle player != player} && {!life_horn} && {((driver vehicle player) == player)}) then {
				[] spawn {
					life_horn = true;
					if(playerSide == west) then {sleep 1.58;} else {sleep 1;};
					life_horn = false;
					};
				if(isNil {_veh GVAR "horn"}) then {_veh SVAR ["horn",false,true];};
				if((_veh GVAR "horn")) then {

					_veh SVAR ["horn",false,true];
				} else {
						_veh SVAR ["horn",true,true];
					if(playerSide == west) then {
						[[_veh],"life_fnc_copWoop",nil,true] call life_fnc_MP;
					} else {
						//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
						[[_veh],"life_fnc_medicHorn",nil,true] call life_fnc_MP;
						};
				};

			};
			_handled = true;
			};
			if(!_ctrlKey && _alt) then {
				if(KINDOF_ARRAY(_veh,_list) && playerSide in [west,independent] && {vehicle player != player} && {!life_phaser} && {((driver vehicle player) == player)}) then {
					[] spawn {
						life_phaser = true;
						sleep 2;
						life_phaser = false;
					};

					_veh = vehicle player;
					if(isNil {_veh GVAR "phaser"}) then {_veh SVAR ["phaser",false,true];};
					if((_veh GVAR "phaser")) then {

						_veh SVAR ["phaser",false,true];
					} else {

						_veh SVAR ["phaser",true,true];
						if(playerSide == west) then {
							[[_veh],"life_fnc_copPhaser",nil,true] call life_fnc_MP;
						} else {
							//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
							[[_veh],"life_fnc_medicPhaser",nil,true] call life_fnc_MP;
						};
					};
				};
			_handled = true;
			};
			if(!_ctrlKey && !_alt) then {
				if(KINDOF_ARRAY(_veh,_list) && playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
				[] spawn {
					life_siren_active = true;
					sleep 4.7;
					life_siren_active = false;
				};


				if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
				if((_veh GVAR "siren")) then {
					titleText [localize "STR_MISC_SirensOFF","PLAIN"];
					_veh SVAR ["siren",false,true];
				} else {
					titleText [localize "STR_MISC_SirensON","PLAIN"];
					_veh SVAR ["siren",true,true];
					if(playerSide == west) then {
						[[_veh],"life_fnc_copSiren",nil,true] call life_fnc_MP;
					} else {
						//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
						[[_veh],"life_fnc_medicSiren",nil,true] call life_fnc_MP;
					};
				};
				};
			};
			if(_ctrlKey && _alt) then {
				if(KINDOF_ARRAY(_veh,_list) && playerSide in [west,independent,civilian] && {vehicle player != player} && {!life_dixie} && {((driver vehicle player) == player)}) then {
					[] spawn {
						life_dixie = true;
						sleep 5;
						life_phaser = false;
					};

					_veh = vehicle player;
					if(isNil {_veh GVAR "dixie"}) then {_veh SVAR ["dixie",false,true];};
					if((_veh GVAR "dixie")) then {

						_veh SVAR ["dixie",false,true];
					} else {

						_veh SVAR ["dixie",true,true];
						[[_veh],"life_fnc_dixie",nil,true] call life_fnc_MP;
					};
				};
				_handled = true;
			};
	};
	
	// O, police gate opener
        case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
	};

	//Shift+P = Faded Sound
	case 25:
	{
		if(_shift) then
		{
			[] call life_fnc_fadeSound;
			_handled = true;
		};
	};

	//U Key
	case 22: {
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
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
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehUnlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehLock";
					};
				};
			};
		};
	};
};

_handled;
