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
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if((EQUAL(count (actionKeys "User10"),0))) then {219} else {(actionKeys "User10") select 0};
_mapKey = SEL(actionKeys "ShowMap",0);
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player GVAR ["restrained",false]) || (player GVAR ["playerSurrender",false]) || life_isknocked || life_istazed)) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted) then {
		if(_code in _interruptionKeys) then {
			life_interrupted = true;
		};
	};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(!(EQUAL(count (actionKeys "User10"),0))) then {
	if(inputAction "User10" > 0) exitWith {
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
		if(_shift) then {
			if(!(EQUAL(animationState player,"AovrPercMrunSrasWrflDf"))) then {
				if(isTouchingGround player) then {
					if(EQUAL(stance player,"STAND")) then {
						if(speed player > 2) then {
							if(!life_is_arrested) then {
								if(SEL((velocity player),2) < 2.5) then {
									if(time - jumpActionTime > 1.5) then {
										jumpActionTime = time; //Update the time.
										[player,true] spawn life_fnc_jumpFnc; //Local execution
										[player,false] remoteExec ["life_fnc_jumpFnc",1]; //Global execution
										_handled = true;
									};
								};
							};
						};
					};
				};
			};
		};
	};

	//Surrender (Shift + B)
	case 48: {
		if(_shift) then {
			if(player GVAR ["playerSurrender",false]) then {
				player SVAR ["playerSurrender",false,true];
			} else {
				[] spawn life_fnc_surrender;
			};
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
		if(_shift) then {
			if(!_ctrlKey) then {
				if(!(EQUAL(currentWeapon player,""))) then {
					life_curWep_h = currentWeapon player;
					player action ["SwitchWeapon", player, player, 100];
					player switchCamera cameraView;
				};
			};
		}
			else 
		{
			if(_ctrlKey) then {
				if(!isNil "life_curWep_h") then {
					if(!(EQUAL(life_curWep_h,""))) then {
						if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
							player selectWeapon life_curWep_h;
						};
					};
				};
			};
		};
	};
	
	//Q Key
	case 16:
	{	
		if(!life_action_pickaxeUse) then {
			if(!life_action_gather) then {
				if(!life_action_inUse) then {
					if(vehicle player isEqualTo player) then {
						if(life_inv_pickaxe > 0 ) then
						{
							[] spawn life_fnc_pickAxeUse;
						};
					};
				};
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
	
	//EMP Konsole - K
	case 37:
	{
		if (!_shift) then {
			if (!_alt) then {
				if (!_ctrlKey) then {
					if (playerSide isEqualTo west) then {
						if (vehicle player != player) then {
							if ((typeOf vehicle player) in ["B_Heli_Light_01_F"]) then {
								[] call life_fnc_openEmpMenu; [_this] call life_fnc_isEmpOperator;
							};
						};
					};
				};
			};
		};
	};

	//Restraining (Shift + R)
	case 19: {
		if(_shift) then {_handled = true;};
		if(_shift) then {
			if(playerSide isEqualTo west OR playerSide isEqualTo civilian) then {
				if(!isNull cursorTarget) then {
					if(cursorTarget isKindOf "Man") then {
						if(isPlayer cursorTarget) then {
							if(side cursorTarget in [west,civilian,independent]) then {
								if(alive cursorTarget) then {
									if(cursorTarget distance player < 3.5) then {
										if(!(cursorTarget GVAR "Escorting")) then {
											if(!(cursorTarget GVAR "restrained")) then {
												if(speed cursorTarget < 1) then {
													[] call life_fnc_restrainAction;
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
	

	//Hand Gesten 1-3
	case 5:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playActionNow "gestureHi";
			};
		};
	};
	case 6:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playActionNow "gestureHiC";
			};
		};
	};
	case 7:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playActionNow "gestureHiB";
			};
		};
	};
	case 8:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playActionNow "gesturenod";
			};
		};
	};
	
	case 9:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playAction "gestureGo";
			};
		};
	};
	
	case 10:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playAction "gesturePoint";
			};
		};
	};
	
	case 11:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playAction "gestureCeaseFire";
			};
		};
	};
	
	case 59:
	{
		if(life_inv_zyankalikapsel > 0) then {
			[] spawn {
				if(([false,"zyankalikapsel",1]call life_fnc_handleInv)) then {
					hint "Du Feigling!!";
					[0,format["%1 der Feigling wird nun elendlich an Zyankali verenden!",player GVAR["realname",name player]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
					sleep 3;
					player setdamage 1;
				};
			};
		} else {
			hint "Du hast keine Zyankalikapsel im Inventar!";
		};	
	};
	
	case 62:
	{
		if(_shift) then {
			if(vehicle player isEqualTo player) then {
				if(!life_action_inUse) then {
					[] call life_fnc_animationMenu;
				};
			};
		};
	};
	
	// O, gate opener
	case 24:
	{

		if(playerSide in [west,independent]) then {
			if(vehicle player != player) then {
				if((driver vehicle player) isEqualTo player) then {
					[] call life_fnc_Opener;
				};
			};
		};
	};

	//Knock out, this is experimental and yeah... (Shift + G)
	case 34: {
		if(_shift) then {_handled = true;};
		if(_shift) then {
			if(playerSide isEqualTo civilian) then {
				if(!isNull cursorTarget) then {
					if(cursorTarget isKindOf "Man") then {
						if(isPlayer cursorTarget) then {
							if(alive cursorTarget) then {
								if(cursorTarget distance player < 4) then {
									if(speed cursorTarget < 1) then {
										if((animationState cursorTarget) != "Incapacitated") then {
											if(currentWeapon player isEqualTo primaryWeapon player OR currentWeapon player isEqualTo handgunWeapon player) then {
												if(currentWeapon player != "") then {
													if(!life_knockout) then {
														if(!(player GVAR ["restrained",false])) then {
															if(!life_istazed) then {
																if(!life_isknocked) then {
																	[cursorTarget] spawn life_fnc_knockoutAction;
																};
															};
														};
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};

	//T Key (Trunk)
	case 20: {
		if(!_alt) then {
			if(!_ctrlKey) then {
				if(!dialog) then {
					if(!life_action_inUse) then {
						if(vehicle player != player && alive vehicle player) then {
							if((vehicle player) in life_vehicles) then {
								[vehicle player] call life_fnc_openInventory;
							};
						} else {
							private "_list";
							_containers = [getPosATL player, ["Box_IND_Grenades_F","B_supplyCrate_F"], 2.5] call life_fnc_nearestObjects;
							if (count _containers > 0) then {
								_container = _containers select 0;
								[_container] call life_fnc_openInventory;
							} else {
								_list = ["landVehicle","Air","Ship"];
								if(KINDOF_ARRAY(cursorTarget,_list)) then {
									if(player distance cursorTarget < 7) then {
										if(vehicle player isEqualTo player) then {
											if(alive cursorTarget) then {
												if(!life_action_inUse) then {
													if(cursorTarget in life_vehicles) then {
														[cursorTarget] call life_fnc_openInventory;
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
	
	//L Key?
	case 38: {
		//If cop run checks for turning lights on.
		if(_shift) then {
			if(playerSide in [west,independent]) then {
				if(vehicle player != player) then {
					if((typeOf vehicle player) in ["C_Offroad_01_repair_F","C_SUV_01_F","B_Truck_01_mover_F","B_MRAP_01_F","B_Heli_Light_01_F","O_Heli_Transport_04_F","I_Heli_Transport_02_F","B_Quadbike_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","O_MRAP_02_F","I_MRAP_03_F","B_MRAP_01_hmg_F","B_Heli_Light_01_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_bench_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","C_Offroad_02_unarmed_F","O_T_VTOL_02_vehicle_F"]) then {
						if(!isNil {vehicle player GVAR "lights"}) then {
							if(playerSide isEqualTo west) then {
								[vehicle player] call life_fnc_sirenLights;
							} else {
								[vehicle player] call life_fnc_medicSirenLights;
							};
							_handled = true;
						};
					};
				};
			};
		};

		if(!_alt) then {
			if(!_ctrlKey) then {
				[] call life_fnc_radar;
			};
		};
	};

	//Y Player Menu
	case 21: {
		if(!_alt) then {
			if(!_ctrlKey) then {
				if(!dialog) then {
					if(!(player GVAR ["restrained",false])) then {
						if(!life_action_inUse) then {
							[] call life_fnc_p_openMenu;
						};
					} else {
						if (life_is_arrested) then {
							if(!life_action_inUse) then {
								[] call life_fnc_p_openMenu;
							};
						};
					};
				};
			};
		};
	};

	//F Key
	case 33: {
		if (_shift) then
		{
			if(playerSide in [west,independent]) then {
				if(vehicle player != player) then {
					if(!life_siren_active) then {
						if((driver vehicle player) isEqualTo player) then {
							[] spawn {
								life_siren_active = true;
								sleep 1;
								life_siren_active = false;
							};

							_veh = vehicle player;
							if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
							if((_veh GVAR "siren")) then {
								titleText [localize "STR_MISC_SirensOFF","PLAIN"];
								_veh SVAR ["siren",false,true];
							} else {
								titleText [localize "STR_MISC_SirensON","PLAIN"];
								_veh SVAR ["siren",true,true];
								if(playerSide isEqualTo west) then {
									[_veh] remoteExec ["life_fnc_copSiren",RCLIENT];
								} else {
									[_veh] remoteExec ["life_fnc_medicSiren",RCLIENT];
								};
							};
						};
					};
				};
			};
		};
		if (_alt) then
		{
			if(playerSide isEqualTo west) then {
				if(vehicle player != player) then {
					if(!life_siren_active) then {
						if((driver vehicle player) isEqualTo player) then {
							[] spawn {
								life_siren_active = true;
								sleep 1;
								life_siren_active = false;
							};

							_veh = vehicle player;
							if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
							if((_veh GVAR "siren")) then {
								titleText [localize "STR_MISC_SirensOFF","PLAIN"];
								_veh SVAR ["siren",false,true];
							} else {
								titleText [localize "STR_MISC_SirensON","PLAIN"];
								_veh SVAR ["siren",true,true];
								[_veh] remoteExec ["life_fnc_copSiren2",RCLIENT];
							};
						};
					};
				};
			};
		};
		if (_ctrlKey) then
		{
			if(playerSide isEqualTo west) then {
				if(vehicle player != player) then {
					if(!life_siren_active) then {
						if((driver vehicle player) isEqualTo player) then {
							[] spawn {
								life_siren_active = true;
								sleep 1;
								life_siren_active = false;
							};

							_veh = vehicle player;
							if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
							if((_veh GVAR "siren")) then {
								titleText [localize "STR_MISC_SirensOFF","PLAIN"];
								_veh SVAR ["siren",false,true];
							} else {
								titleText [localize "STR_MISC_SirensON","PLAIN"];
								_veh SVAR ["siren",true,true];
								[_veh] remoteExec ["life_fnc_copSiren3",RCLIENT];
							};
						};
					};
				};
			};
		};
	};

	//^ Key
	case 41: {
			if (soundVolume != 1) then {
				1 fadeSound 1;
				systemChat localize "STR_MISC_soundnormal";
			} else {
				1 fadeSound 0.1;
				systemChat localize "STR_MISC_soundfade";
			};
	};

	//U Key
	case 22: {
		if(!_alt) then {
			if(!_ctrlKey) then {
				if(vehicle player isEqualTo player) then {
					_veh = cursorTarget;
				} else {
					_veh = vehicle player;
				};

				if(_veh isKindOf "House_F") then {
					if(playerSide isEqualTo civilian) then {
						if(_veh in life_vehicles) then {
							if(player distance _veh < 12) then {
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
						};
					};
				} else {
					_locked = locked _veh;
					if(_veh in life_vehicles) then {
						if (player distance _veh < 8) then {
							if(EQUAL(_locked,2)) then {
								if(local _veh) then {
									_veh lock 0;
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
									_veh animateDoor ['Door_1_source',1];
									_veh animateDoor ['Door_2_source',1];
									_veh animateDoor ['Door_3_source',1];
									_veh animateDoor ['Door_4_source',1];
									_veh animateDoor ['Door_5_source',1];
									_veh animateDoor ['Door_R_source',1];
									_veh animateDoor ['Door_L_source',1];
									_veh animateDoor ['door_L_pop',1];
									_veh animateDoor ['door_R_pop',1];
								} else {
									[_veh,0] remoteExecCall ["life_fnc_lockVehicle",_veh];
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
									_veh animateDoor ['Door_1_source',1];
									_veh animateDoor ['Door_2_source',1];
									_veh animateDoor ['Door_3_source',1];
									_veh animateDoor ['Door_4_source',1];
									_veh animateDoor ['Door_5_source',1];
									_veh animateDoor ['Door_R_source',1];
									_veh animateDoor ['Door_L_source',1];
									_veh animateDoor ['door_L_pop',1];
									_veh animateDoor ['door_R_pop',1];
								};
								hint composeText [image "icons\unlock.paa","  Fahrzeug aufgeschlossen"];
								playSound "unlockCarSound";
							} else {
								if(local _veh) then {
									_veh lock 2;
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
									_veh animateDoor ['Door_1_source',0];
									_veh animateDoor ['Door_2_source',0];
									_veh animateDoor ['Door_3_source',0];
									_veh animateDoor ['Door_4_source',0];
									_veh animateDoor ['Door_5_source',0];
									_veh animateDoor ['Door_R_source',0];
									_veh animateDoor ['Door_L_source',0];
									_veh animateDoor ['door_L_pop',0];
									_veh animateDoor ['door_R_pop',0];
								} else {
									[_veh,2] remoteExecCall ["life_fnc_lockVehicle",_veh];
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
									_veh animateDoor ['Door_1_source',0];
									_veh animateDoor ['Door_2_source',0];
									_veh animateDoor ['Door_3_source',0];
									_veh animateDoor ['Door_4_source',0];
									_veh animateDoor ['Door_5_source',0];
									_veh animateDoor ['Door_R_source',0];
									_veh animateDoor ['Door_L_source',0];
									_veh animateDoor ['door_L_pop',0];
									_veh animateDoor ['door_R_pop',0];
								};
								hint composeText [image "icons\lock.paa","  Fahrzeug abgeschlossen"];
								playSound "lockCarSound";
							};
						};
					};
				};
			};
		};
	};
};

_handled;