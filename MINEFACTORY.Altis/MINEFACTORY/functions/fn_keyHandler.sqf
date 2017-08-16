#include "..\..\script_macros.hpp"
/*
*	File: fn_keyHandler.sqf
*	Author: Bryan "Tonic" Boardwine
*
*	Description:
*	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = SEL(_this,0);
_code = SEL(_this,1);
_shift = SEL(_this,2);
_ctrlKey = SEL(_this,3);
_alt = SEL(_this,4);
_speed = speed cursorObject;
_handled = false;
_speakKey = if((actionKeys "PushToTalk") isEqualTo []) then {58} else {(actionKeys "PushToTalk") select 0};

_interactionKey = if((EQUAL(count (actionKeys "User10"),0))) then {219} else {(actionKeys "User10") select 0};
_mapKey = SEL(actionKeys "ShowMap",0);
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player GVAR ["restrained",false]) || (player GVAR ["playerSurrender",false]) || life_isknocked || life_istazed)) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
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

if (life_container_active) then {
	switch (_code) do {
		//space key
		case 57: {
			[life_container_activeObj] spawn life_fnc_placedefinestorage;
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
			[player,false] remoteExec ["life_fnc_jumpFnc",RANY]; //Global execution
			_handled = true;
		};
	};

	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_civMarkers;}};
		};
	};

	//Holster / recall weapon. (Shift + H)
	case 35: {
		if(_shift && !_ctrlKey && !(EQUAL(currentWeapon player,""))) then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(EQUAL(life_curWep_h,""))}) then {
			if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey: {
		if(!life_action_inUse) then {
			[] spawn  {
				private "_handle";
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	//Restraining (Shift + R)
	case 19: {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject GVAR "Escorting")} && {!(cursorObject GVAR "restrained")} && {speed cursorObject < 1}) then {
			[] call life_fnc_restrainAction;
		};
	};

	//Knock out, this is experimental and yeah... (Shift + G)
	case 34: {
		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4 && speed cursorObject < 1) then {
			if((animationState cursorObject) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player GVAR ["restrained",false]) && !life_istazed && !life_isknocked) then {
				[cursorObject] spawn life_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20: {
		if(!_alt && !_ctrlKey && !dialog && {!life_action_inUse}) then {
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in life_vehicles) then {
					[vehicle player] spawn life_fnc_openInventory;
				};
			} else {
				private ["_list"];
				_list = [getPosATL player, ["Box_IND_Grenades_F","B_supplyCrate_F"], 2.5] call life_fnc_nearestObjects;
				if (count _list > 0) then {
					_list = _list select 0;
					[_list] spawn life_fnc_openInventory;
				} else {
					_list = ["landVehicle","Air","Ship"];
					if(KINDOF_ARRAY(cursorObject,_list) && {player distance cursorObject < 7} && {vehicle player == player} && {alive cursorObject} && {!life_action_inUse}) then {
						if(cursorObject in life_vehicles) then {
							[cursorObject] spawn life_fnc_openInventory;
						};
					};
				};
			};
		};
		
		if(_shift) then {
			if(player GVAR ["playerSurrender",false]) then {
				player SVAR ["playerSurrender",false,true];
			} else {
				[] spawn life_fnc_surrender;
			};
			_handled = true;
		};
	};
	
	case 200 : {
		if(vehicle player != player && (typeOf vehicle player) in ["B_Quadbike_01_F","C_Offroad_01_F","B_G_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F"]) then {
			[vehicle player,"warning"] spawn life_fnc_blinkerManage;
			_handled = true;
		}; 
    };
    case 205 : {
		if(vehicle player != player && (typeOf vehicle player) in ["B_Quadbike_01_F","C_Offroad_01_F","B_G_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F"]) then {
		  [vehicle player,"right"] spawn life_fnc_blinkerManage;
		  _handled = true;
		}; 
    };
    case 203 : {
		if(vehicle player != player && (typeOf vehicle player) in ["B_Quadbike_01_F","C_Offroad_01_F","B_G_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F"]) then {
		  [vehicle player,"left"] spawn life_fnc_blinkerManage;
		  _handled = true;
		};
    };

	//L Key?
	case 38: {
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
				if(!isNil {vehicle player GVAR "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
		};

		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};

	//Y Player Menu
	case 21: {
		if(!_alt && !_ctrlKey && !dialog && !(player GVAR ["restrained",false]) && {!life_action_inUse}) then {
			if(!_shift) then {
				[] call life_fnc_p_openMenu;
			};
		};
		[player, uniform player] call life_fnc_equipGear;
	};

	//F Key
	case 33: {
		if(playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
			[] spawn {
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};

			_veh = vehicle player;
			if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
			if((_veh GVAR "siren")) then {
				titleText [ "Sirene AUS","PLAIN"];
				_veh SVAR ["siren",false,true];
			} else {
				titleText [ "Sirene AN","PLAIN"];
				_veh SVAR ["siren",true,true];
				if(playerSide == west) then {
					[_veh] remoteExec ["life_fnc_copSiren",RCLIENT];
				} else {
					[_veh] remoteExec ["life_fnc_medicSiren",RCLIENT];
				};
			};
		};
	};

	//O Key
	case 24: {
		if(_shift) then {
		
			[] call life_fnc_ohrstopsel;
			_handled = true;
		};
		if (!_shift && !_alt && !_ctrlKey && playerSide in [west,independent] && (vehicle player != player)) then {
		[] call life_fnc_copOpener;
		};
	};

	//U Key
	case 22: {
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorObject;
			} else {
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F" && {playerSide == civilian}) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(EQUAL(_door,0)) exitWith {hint  "Keine Tür in der Nähe!"};
					_locked = _veh GVAR [format["bis_disabled_Door_%1",_door],0];

					if(EQUAL(_locked,0)) then {
						_veh SVAR [format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat  "Du hast die Tür abgeschlossen.";
					} else {
						_veh SVAR [format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat  "Du hast die Tür aufgeschlossen.";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(EQUAL(_locked,2)) then {
						if(local _veh) then {
							_veh lock 0;

							// BI
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_L_source',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_rear_source',1];
							_veh animateDoor ['Door_1_source',1];
							_veh animateDoor ['Door_2_source',1];
							_veh animateDoor ['Door_3_source',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
							_veh animateDoor ['DoorL_Front_Open',1];
							_veh animateDoor ['DoorR_Front_Open',1];
							_veh animateDoor ['DoorL_Back_Open',1];
							_veh animateDoor ['DoorR_Back_Open ',1];
						} else {
							[_veh,0] remoteExecCall ["life_fnc_lockVehicle",_veh];

							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_L_source',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_rear_source',1];
							_veh animateDoor ['Door_1_source',1];
							_veh animateDoor ['Door_2_source',1];
							_veh animateDoor ['Door_3_source',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
							_veh animateDoor ['DoorL_Front_Open',1];
							_veh animateDoor ['DoorR_Front_Open',1];
							_veh animateDoor ['DoorL_Back_Open',1];
							_veh animateDoor ['DoorR_Back_Open ',1];
						};
						hint composeText [ image "MINEFACTORY\icons\unlock.paa", " Fahrzeug aufgeschlossen" ];
					} else {
						if(local _veh) then {
							_veh lock 2;

							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_L_source',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_rear_source',0];
							_veh animateDoor ['Door_1_source',0];
							_veh animateDoor ['Door_2_source',0];
							_veh animateDoor ['Door_3_source',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
							_veh animateDoor ['DoorL_Front_Open',0];
							_veh animateDoor ['DoorR_Front_Open',0];
							_veh animateDoor ['DoorL_Back_Open',0];
							_veh animateDoor ['DoorR_Back_Open ',0];
						} else {
							[_veh,2] remoteExecCall ["life_fnc_lockVehicle",_veh];

							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_L_source',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_rear_source',0];
							_veh animateDoor ['Door_1_source',0];
							_veh animateDoor ['Door_2_source',0];
							_veh animateDoor ['Door_3_source',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
							_veh animateDoor ['DoorL_Front_Open',0];
							_veh animateDoor ['DoorR_Front_Open',0];
							_veh animateDoor ['DoorL_Back_Open',0];
							_veh animateDoor ['DoorR_Back_Open ',0];
						};
						hint composeText [ image "MINEFACTORY\icons\lock.paa", " Fahrzeug abgeschlossen" ];
					};
				};
			};
		};
	};
	
	case 67:
	{
		[] spawn life_fnc_placeablesPlaceComplete;
	};
	
	case _speakKey:
	{
		if (getPlayerChannel player == 1) then {
			setCurrentChannel 5;
			hint "Bitte nicht im SideChat Reden!";
		};
		if (getPlayerChannel player == 5) then {
			setCurrentChannel 5;
			hint "Bitte nicht im SideChat Reden!";
		};
		/*if(getPlayerChannel player == 7) then {
			setCurrentChannel 5;
			hint "Bitte nicht im SideChat Reden!";
		};
		if(getPlayerChannel player == 9) then {
			setCurrentChannel 5;
			hint "Bitte nicht im SideChat Reden!";
		};
		if(getPlayerChannel player == 10) then {
			setCurrentChannel 5;
			hint "Bitte nicht im SideChat Reden!";
		};
		if(getPlayerChannel player == 11) then {
			setCurrentChannel 5;
			hint "Bitte nicht im SideChat Reden!";
		};*/
	};
	
	//nicken (Shift + Num 5)
	case 76:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				player playActionNow "gesturenod";
			};
	};

	
	//Takwondo(Traditional Martial arts in korea)(Shift + Num 1)
	case 79:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["Takwondo!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
			};
	};

	//Kneebend Slow(Shift + Num 2)
	case 80:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["KneeBend Slow baby~"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
			};
	};

	//Kneebend Fast(Shift + Num 3)
	case 81:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["KneeBend more Hard!!!Move!!Move!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
			};
	};

	//tabulator
    case 15 : {
        _restrained = player getVariable ["restrained", false];
        if(!_restrained) then {
            player playActionNow "gestureHi";
        };        
    };

	//Pushup(Shift + Num 4)
	case 75:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["Pushup!!!!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
			};
	};

	//4
	case 5:
	{
	[] spawn life_fnc_pickAxeUse;
	};

	//5 Nitro AMK
	case 6:
	{
	[] spawn life_fnc_activateNitro;
	};
	
		case 7:
	{
	if(playerSide in [west,independent] && vehicle player != player && ((driver vehicle player) == player)) then {
	
	[player,"Yelp"] call life_fnc_globalSound;
	
	} else {
	systemChat "Du bist kein cop oder in keinem Fahrzeug";
	};
	};
	
	case 8:
	{
	if(playerSide in [west,independent] && vehicle player != player && ((driver vehicle player) == player)) then {
	
	[player,"Fahren_sie_rechts_ran"] call life_fnc_globalSound;
	
	} else {
	systemChat "Du bist kein cop oder in keinem Fahrzeug";
	};
	};
	
	case 9:
	{
	if(playerSide in [west,independent] && vehicle player != player && ((driver vehicle player) == player)) then {
	
	[player,"Runter_auf_den_Boden"] call life_fnc_globalSound;
	
	} else {
	systemChat "Du bist kein cop oder in keinem Fahrzeug";
	};
	};
	
	case 10:
	{
	if(playerSide in [west,independent] && vehicle player != player && ((driver vehicle player) == player)) then {
	
	[player,"Speerzone"] call life_fnc_globalSound;
	
	} else {
	systemChat "Du bist kein cop oder in keinem Fahrzeug";
	};
	};
	
};

_handled;
