#include <macro.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by PlayGermany

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_lightVeh","_sirenVeh"];
_ctrl = SEL(_this,0);
_code = SEL(_this,1);
_shift = SEL(_this,2);
_ctrlKey = SEL(_this,3);
_alt = SEL(_this,4);
_speed = speed cursorTarget;
_handled = false;
_greetingsKey = if(count (actionKeys "User1") == 0) then {157} else {(actionKeys "User9") select 0};

_interactionKey = if((EQUAL(count (actionKeys "User10"),0))) then {219} else {(actionKeys "User10") select 0};
_mapKey = SEL(actionKeys "ShowMap",0);
//hint str _code;
_interruptionKeys = [17,30,31,32]; //W,A,S,D

//Vault handling...
if((player GVAR ["restrained",false]) && {_code in ((actionKeys "GetOver") + (actionKeys "Turbo") + (actionKeys "Crouch") + (actionKeys "Prone") + (actionKeys "ReloadMagazine") + (actionKeys "Salute") + (actionKeys "SitDown") + (actionKeys "Throw"))}) exitWith {
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

//disabled ^
if((_code in (actionKeys "SelectAll") || _code in (actionKeys "ForceCommandingMode"))) then {_handled = true;};

//disabled TacView
if (_code in (actionKeys "TacticalView")) then {_handled = true;};

switch (_code) do {
	//Space key for Jumping
	// or cop / medic placeables
	case 57: {
		if (!_shift) then {
			if ((playerSide == west || playerSide == independent) && life_barrier_active) then {
				[] spawn PG_fnc_placeablesPlaceComplete;
				_handled = true;
			};
		}
		else
		{		
			if(isNil "jumpActionTime") then {jumpActionTime = 0;};
			if(_shift && {!(EQUAL(animationState player,"AovrPercMrunSrasWrflDf"))} && {isTouchingGround player} && {EQUAL(stance player,"STAND")} && {speed player > 2} && {!life_is_arrested} && {SEL((velocity player),2) < 2.5} && {time - jumpActionTime > 1.5}) then {
				jumpActionTime = time; //Update the time.
				[player,true] spawn life_fnc_jumpFnc; //Local execution
				[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution
				_handled = true;
			};
		};
	};

	//Map Key
	case _mapKey:
	{
		switch (playerSide) do {
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case civilian : {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case east: {if(!visibleMap) then {[] spawn life_fnc_asfMarkers;}};
		};
	};
	
	// Key: B
	// Barriers
	case 48: {
		if (_shift && (vehicle player == player)) then {
			[] spawn PG_fnc_placeablesMenu;
			_handled = true;
		};
	};

	//Holster / recall weapon.
	case 35: {

		if (vehicle player == player) then {

			if(_shift && !_ctrlKey && !(EQUAL(currentWeapon player,""))) then {
				life_curWep_h = currentWeapon player;
				life_holstered = true;
				player action ["SwitchWeapon", player, player, 100];
				player switchCamera cameraView;
			};

			if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(EQUAL(life_curWep_h,""))}) then {
				if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
					player selectWeapon life_curWep_h;
				};
				life_holstered = false;
			};
		} else {

			if(_shift && !_ctrlKey && currentWeapon player != "") then {
				life_holstered = true;
				hint "Du wirst deine Waffe holstern, sobald du das Fahrzeug verlässt.";
			};

			if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
				life_holstered = false;
				hint "Du wirst deine Waffe ziehen, sobald du das Fahrzeug verlässt.";
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
		if(_shift && (playerSide == civilian or playerSide == east) && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && cursorTarget distance player < 4 && speed cursorTarget < 1) then {
			if(!(animationState cursorTarget=="Incapacitated" or animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) exitWith {
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};

		if (!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then {

			//Cops -> All
			if(_shift) then {_handled = true;};
			if(_shift && playerSide == west && (side cursorTarget == civilian)) then
			{
				[] call life_fnc_restrainAction;
			};
			// Civs - > All except Medic
			if(_shift) then {_handled = true;};
			if(_shift && playerSide == civilian && !(side cursorTarget == independent) && (animationState cursorTarget=="Incapacitated" or animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon")) then
			{
				[] call life_fnc_restrainAction;
			};
			// ASF - > Civs
			if(_shift) then {_handled = true;};
			if(_shift && playerSide == east && (side cursorTarget == civilian) && (animationState cursorTarget=="Incapacitated" or animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon")) then
			{
				[] call life_fnc_restrainAction;
			};
		};
	};

	//Shift + Ö (surrender)
	case 39: {
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
				};
			};
		};
	};

	//T Key (Trunk)
	case 20: {
		if(!_alt && !_ctrlKey && !life_is_processing) then {
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in life_vehicles) then {
					[vehicle player] spawn life_fnc_openInventory;
				};
			} else {
				private "_list";
				_list = ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F","landVehicle","Air","Ship","House_F"] + PG_containers;
				if(KINDOF_ARRAY(cursorTarget,_list) && {player distance cursorTarget < 7} && {vehicle player == player} && {alive cursorTarget}) then {
					if(cursorTarget in life_vehicles OR {!(cursorTarget GVAR ["locked",true])}) then {
						[cursorTarget] spawn life_fnc_openInventory;
					};
				} else {
					if (player distance schiffsWrack < 30 && schiffsWrack getVariable ["opened",false]) then {
						[schiffsWrack] spawn life_fnc_openInventory;
					};
					if (player distance Craft < 5) then {
						[Craft] spawn life_fnc_openInventory;
					};
					if (player distance Craft_2 < 5) then {
						[Craft_2] spawn life_fnc_openInventory;
					};
				};
			};
		};
	};

	//L Key
	case 38: {
		_lightVeh =
		[
			"B_Quadbike_01_F",
			"C_Offroad_01_F",
			"C_SUV_01_F",
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"C_Van_01_box_F",
			"B_G_Offroad_01_F",
			"B_G_Offroad_01_repair_F",
			"B_MRAP_01_F",
			"B_MRAP_01_HMG_F",
			"I_MRAP_03_F",
			"I_MRAP_03_HMG_F",
			"B_Truck_01_transport_F",
			"I_Truck_02_box_F"
		];
		//Emergency lights
		if(_shift && !_alt && playerSide in [west,independent, east]) then {
			if(vehicle player != player && (typeOf vehicle player) in _lightVeh) then {
				if(!isNil {vehicle player GVAR "lights"}) then {
					if (vehicle player getVariable["lights",false]) then {
						vehicle player setVariable["lights",false,true];
					} else {
						vehicle player setVariable["lights",true,true];
						[[vehicle player, (vehicle player getVariable ["undercover", false]), playerSide],"PGSERV_fnc_initLights",false,false] spawn life_fnc_MP;
					};
					_handled = true;
				};
			};
		};
		//un/hide Lamp
		if(_alt && playerSide == west) then {
			_lamp = (vehicle player getVariable ["lamp",objNull]);
			if(!isNull _lamp) then {
				if(_lamp getVariable ["hidden",false]) then {
					[[_lamp, false], "PG_fnc_hideObject", true] spawn life_fnc_MP;
					_lamp setVariable ["hidden",false,true];
				} else {
					[[_lamp], "PG_fnc_hideObject", true] spawn life_fnc_MP;
					_lamp setVariable ["hidden",true,true];
					vehicle player setVariable ["lights",false,true];
				};
			};
		};
		//Speed radar
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};

	//Y Player Menu
	case 21: {
		if(!_alt && !_ctrlKey && !dialog && !life_is_processing) then {
			[] call life_fnc_p_openMenu;
		};
	};

	//F Key
	case 33:
    {
		_sirenVeh =
		[
			"B_Quadbike_01_F",
			"C_Offroad_01_F",
			"C_SUV_01_F",
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"C_Van_01_box_F",
			"B_G_Offroad_01_F",
			"B_G_Offroad_01_repair_F",
			"B_MRAP_01_F",
			"B_MRAP_01_HMG_F",
			"I_MRAP_03_F",
			"I_MRAP_03_HMG_F",
			"B_Heli_Light_01_F",
			"O_Heli_Light_02_unarmed_F",
			"I_Heli_light_03_unarmed_F",
			"B_Heli_Transport_01_F",
			"I_Heli_Transport_02_F",
			"B_Heli_Transport_03_unarmed_F",
			"O_Heli_Transport_04_F",
			"O_Heli_Transport_04_medevac_F",
			"B_Lifeboat",
			"C_Boat_Civil_01_police_F",
			"B_Boat_Armed_01_minigun_F",
			"B_SDV_01_F",
			"I_Truck_02_box_F"
		];

		if(playerSide in [west,independent] && ((driver vehicle player) == player) && (typeOf vehicle player) in _sirenVeh) then {
			_veh = vehicle player;
			if(_shift) then {
				[] spawn {
					life_siren_active = true;
					sleep 2;
					life_siren_active = false;
				};
				if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
				if((_veh getVariable "siren")) then {
					titleText [localize "STR_MISC_SirensOFF","PLAIN"];
					_veh setVariable["siren",false,true];
				} else {
					titleText [localize "STR_MISC_SirensON","PLAIN"];
					_veh setVariable["siren",true,true];
					if(playerSide == west) then {
						[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
					} else {
						[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
					};
				};
			} else {
				if (playerSide == west) then {
					[] spawn {
						life_siren2_active = true;
						sleep 1.2;
						life_siren2_active = false;
					};
					if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
					if((_veh getVariable "siren2")) then
					{
						titleText [localize "STR_MISC_Sirens2OFF","PLAIN"];
						_veh setVariable["siren2",false,true];
					} else {
						titleText [localize "STR_MISC_Sirens2ON","PLAIN"];
						_veh setVariable["siren2",true,true];
						if(playerSide == west) then {
							[[_veh],"life_fnc_copSiren2",nil,true] spawn life_fnc_MP;
						} else {
							[[_veh],"life_fnc_medicSiren2",nil,true] spawn life_fnc_MP;
						};
					};
				};
			};
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
				if(_veh in life_vehicles && player distance _veh < 8 && !(_veh in PG_containers)) then {
					if(EQUAL(_locked,2)) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};
						_veh animateDoor ["door_back_R",1];
						_veh animateDoor ["door_back_L",1];
						_veh animateDoor ['door_R',1];
						_veh animateDoor ['door_L',1];
						_veh animateDoor ['Door_rear',1];
						_veh animateDoor ['Door_LM',1];
						_veh animateDoor ['Door_RM',1];
						_veh animateDoor ['Door_LF',1];
						_veh animateDoor ['Door_RF',1];
						_veh animateDoor ['Door_LB',1];
						_veh animateDoor ['Door_RB',1];
						_veh animateDoor ['Door_R_source',1];
						_veh animateDoor ['Door_L_source',1];
						_veh animateDoor ['Door_1_source',1];
						_veh animateDoor ['Door_2_source',1];
						_veh animateDoor ['Door_3_source',1];
						hint composeText [ image "icons\unlock.paa", " Fahrzeug aufgeschlossen" ];
						player say3D "car_unlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};
						_veh animateDoor ["door_back_R",0];
						_veh animateDoor ["door_back_L",0];
						_veh animateDoor ['door_R',0];
						_veh animateDoor ['door_L',0];
						_veh animateDoor ['Door_rear',0];
						_veh animateDoor ['Door_LM',0];
						_veh animateDoor ['Door_RM',0];
						_veh animateDoor ['Door_LF',0];
						_veh animateDoor ['Door_RF',0];
						_veh animateDoor ['Door_LB',0];
						_veh animateDoor ['Door_RB',0];
						_veh animateDoor ['Door_R_source',0];
						_veh animateDoor ['Door_L_source',0];
						_veh animateDoor ['Door_1_source',0];
						_veh animateDoor ['Door_2_source',0];
						_veh animateDoor ['Door_3_source',0];
						hint composeText [ image "icons\lock.paa", " Fahrzeug abgeschlossen" ];
						player say3D "car_lock";
					};
				};
			};
		};
	};

	//Ü Key
	case 26: {
		//Shift: Spikestrip or show Licences
		if(_shift && !_alt && !_ctrlKey) then {
			if(playerSide == west && (vehicle player == player)) then {
				if(!isNull life_spikestrip) exitWith {hint "Du hast bereits ein Nagelband gelegt"};
					if(([false,"spikeStrip",1] call life_fnc_handleInv)) then {
						[] spawn life_fnc_spikeStrip;
					};
			} else {
				[] spawn PG_fnc_showLicenses;
			};
		};
		//Alt: "Fake" CIV ID for Kripo
		if (!_shift && _alt && !_ctrlKey) then {
			[true] spawn PG_fnc_showID;
		};
		//Nothing: ID
		if (!_shift && !_alt && !_ctrlKey) then {
			[] spawn PG_fnc_showID;
		};
	};

	//F1-F4 Key, Hilfe

	//F1
	case 59: {
		if(!_alt && !_ctrlKey) then {
		[] spawn life_fnc_infoTastenbelegung;
		};
		_handled = true;
	};
	//F2
	case 60: {
		if(!_alt && !_ctrlKey) then {
		[] spawn life_fnc_infoBerufeLegal;
		};
		_handled = true;
	};
	
	//F3
	case 61: {
		if(!_alt && !_ctrlKey) then {
		[] spawn life_fnc_infoBerufeIllegal;
		};
		_handled = true;
	};
	//F4
	case 62: {
		if(!_alt && !_ctrlKey) then {
		[] spawn life_fnc_infoBerufeTier3;
		};
		if(_alt) then {
                [] call SOCK_fnc_updateRequest;
				titleText["Alt + F4 wird dir da auch nicht helfen ;)","PLAIN"];
				diag_log format ["Server: %1 hat Alt+F4 gedrueckt !",_player getVariable["realname",name _player]];
        };
		_handled = true;
	};
	
	// O, police gate opener
    case 24: {
		if (!_shift && !_alt && !_ctrlKey && ((playerSide == west) || (playerSide == independent) || (playerSide == east)) && (vehicle player != player)) then {
			[] call life_fnc_gateOpener;
			_handled = true;
		};
	};

	// Shift + Ä, mobile banking
    case 40: {
		if (_shift && !_alt && !_ctrlKey && ((playerSide == west) || (playerSide == independent) || (playerSide == east))) then {
			[] spawn life_fnc_atmMenu;
			_handled = true;
		};
	};

	// K, EMP console - Shift + K, show help for cursortarget
    case 37: {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player) && (typeOf (vehicle player) in ["B_Heli_Transport_01_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F"])) then {
            [] call life_fnc_openEmpMenu;
			[_this] call life_fnc_isEmpOperator;
			_handled = true;
        };
		if (_shift && vehicle player == player && cursorTarget isKindOf "Man") then {
			[[],"life_fnc_infoTastenbelegung",cursorTarget,false] call life_fnc_MP;
			_handled = true;
			hint "Du hast deinem Gegenüber den Hilfezettel gezeigt.";
		};
    };

	//Q, Polizei Ansage
    case 16: {
		_soundVeh =
		[
			"B_Quadbike_01_F",
			"C_Offroad_01_F",
			"C_SUV_01_F",
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"C_Van_01_box_F",
			"B_G_Offroad_01_F",
			"B_G_Offroad_01_repair_F",
			"B_MRAP_01_F",
			"B_MRAP_01_HMG_F",
			"I_MRAP_03_F",
			"I_MRAP_03_HMG_F"
		];
        if ((_shift) && (!_alt) && (!_ctrlKey) && (playerSide == west) && (vehicle player != player) && (typeof (vehicle player) in _soundVeh)) then {
            [player,"hiersprichtdiepolizei"] call life_fnc_globalSound;
        };
    };
	
	//tabulator
    case _greetingsKey : {
        player playActionNow "gestureHi";
    };
	
	//(Shift + Num 1)
	//Takwondo
	case 79: {
		if(_shift) then {_handled = true;};
			if ((_shift) && {!life_knockout} && {!(player getVariable["restrained",false])} && {!life_istazed} && {vehicle player == player}) then {
				cutText [format["Takwondo!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};
	//(Shift + Num 2)
	//Kneebend Slow
	case 80: {
		if(_shift) then {_handled = true;};
			if ((_shift) && {!life_knockout} && {!(player getVariable["restrained",false])} && {!life_istazed} && {vehicle player == player}) then {
				cutText [format["KneeBend Slow baby~"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
			};
	};
	//(Shift + Num 3)
	//Kneebend Fast
	case 81: {
		if(_shift) then {_handled = true;};
			if ((_shift) && {!life_knockout} && {!(player getVariable["restrained",false])} && {!life_istazed} && {vehicle player == player}) then {
				cutText [format["KneeBend more Hard!!!Move!!Move!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
			};
	};
	//(Shift + Num 4)
	//Pushup
	case 75: {
		if(_shift) then {_handled = true;};
			if ((_shift) && {!life_knockout} && {!(player getVariable["restrained",false])} && {!life_istazed} && {vehicle player == player}) then {
				cutText [format["Pushup!!!!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
			};
	};
	//(Shift + Num 5)
	case 76: {
		if(_shift) then {_handled = true;};
			if ((_shift) && {!life_knockout} && {!(player getVariable["restrained",false])} && {!life_istazed} && {vehicle player == player}) then {
				cutText [format["Erstmal das Revier markieren"], "PLAIN DOWN"];
				player playMove "Acts_AidlPercMstpSlowWrflDnon_pissing";
			};
	};
};

_handled;