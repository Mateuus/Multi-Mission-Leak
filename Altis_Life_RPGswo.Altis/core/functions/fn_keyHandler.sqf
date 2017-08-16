/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
#include "..\..\macros.hpp"

private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_CommandMode"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_CommandMode = actionKeys "tacticalView";

_interactionKey = if (count (actionKeys "User10") isEqualTo 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {true;};

if (_code in actionKeys "ReloadMagazine") then {hint ""; DWEV_weapon_malfunktion = false; DWEV_lastammo = 300;};

if (DWEV_SETTINGS(getNumber,"disableCommanderView") isEqualTo 1) then {if (_code in _CommandMode) then { hint "Commandersicht ist deaktiviert"; _handled = true; };};

if((_code in [1]) && DWEV_traingas_effect) exitWith // ESC Taste Blockieren wenn Tränengaseffect an ist
{ 
	true;
};
/*
if(!visibleMap) then 
{
	systemChat format ["Keyinfo: %1",_this];
};
*/
if(DWEV_action_inUse) exitWith {
	if(!DWEV_interrupted && _code in _interruptionKeys) then {DWEV_interrupted = true;};
	_handled;
};

if (isNil "DWEV_keyaction_time") then {DWEV_keyaction_time = diag_ticktime - 10;};
if (DWEV_keyaction_time > diag_ticktime - 0.5) exitWith {systemChat "Das Spamen von Funktionstasten ist nicht erlaubt!!";};


if ((player getVariable["DWEV_paintball_arena",false]) || (player getVariable["DWEV_paintball_dome",false])) exitWith 
{
	// Spieler ist in Paintball Modus
	_handled;
};



//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!(count (actionKeys "User10") isEqualTo 0) && {(inputAction "User10" > 0)}) exitWith {
	if((!DWEV_action_inUse) && (!DWEV_action_gathering)) then {
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn DWEV_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			DWEV_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	case 57: //Space
	{
		if (!_shift && DWEV_barrier_active) then
		{
			_check = nearestObjects[player,["LandVehicle","Air"],6];
			if(count _check > 0) then
			{
				hint "Du kannst den Gegenstand hier nicht aufstellen";
			}
			else
			{
				0 spawn DWEV_fnc_placeablesPlaceComplete;
			};
		};
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")} && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2} && {!DWEV_is_arrested} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 1.5}) then
		{
			if (DWEV_barrier_active) then {[true] call DWEV_fnc_placeableCancel;};
			jumpActionTime = time;
			[player,true] spawn DWEV_fnc_jumpFnc; //Local execution
			[player,false] remoteExec ["DWEV_fnc_jumpFnc",-2]; //Global execution 
			_handled = true;
		};
	};
	
	case _mapKey: //Map Key
	{
		switch ((side player)) do 
		{
			case west: {if(!visibleMap) then {[] spawn DWEV_fnc_copMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn DWEV_fnc_gangMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn DWEV_fnc_medicMarkers; [] spawn DWEV_fnc_medMarkers;}};
			case east: {if(!visibleMap) then {[] spawn DWEV_fnc_opforMarkers;}};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!DWEV_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn DWEV_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				DWEV_action_inUse = false;
			};
		};
	};
	
	case 35: // H
		{
		if (_shift && !_alt && !_ctrlKey) then {
			if ((time - DWEV_holster_time) > 4) then {
				DWEV_holster_time = time;
				[] spawn DWEV_fnc_holsterWeapon;
			};
		};
		};
		
		case 40: //Ä
		{
		if (!_shift && !_alt && !_ctrlKey) then {
		[player] call DWEV_fnc_doSitdown;
			};
		};

	case 19: // Shift + R
	{	
		
		if(_shift) then {_handled = true;};
		//Cops -> alle außer feuer
		if(_shift && (side player) == west && !(player getVariable "restrained") && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && !(animationState player == "Incapacitated") && (side cursorTarget in [civilian,east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call DWEV_fnc_restrainAction;
		};
		//sicher -> alle außer feuer
		if(_shift && (side player) == east && !(player getVariable "restrained") && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && !(animationState player == "Incapacitated") && (side cursorTarget in [civilian,east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call DWEV_fnc_restrainAction;
		};
		// Civs - > alle bisauf feuer
//		if(_shift) then {_handled = true;}; // muss glaub ich nich wieder vorkommen
		if(_shift && (side player) == civilian && lc_rebel && !(player getVariable "restrained") && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "Incapacitated" && (side cursorTarget in [civilian,east,west]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
		if([false,"handschellen",1] call DWEV_fnc_handlelnv) then
		{
			[getPlayerUID player,getMyname,"669"] remoteExec ["DWEV_fnc_wantedAdd",2];
			[] call DWEV_fnc_restrainAction;
		}
			else
		{
		hint "Du hast keine Handschellen dabei!";
			};
		};
	};
	
	case 34: //G
	{
		if(_shift) then {_handled = true;};
		if(_shift && (side player) == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1 && !(cursorTarget getVariable["noobschutz",false]) && !(side cursorTarget == independent)) then
		{
			if(call DWEV_fnc_isSafeZone) exitWith {hint "Niederschlagen ist in der absoluten Safezone verboten!!!"};
			if(cursorTarget getvariable ["DWEV_knockout_block",false]) exitWith {hint "Andere Spieler können nur alle 60 Sekunden niedergeschalgen werden!"};
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && currentWeapon player != "Binocular" && currentWeapon player != "Rangefinder" && !DWEV_knockout && !(player getVariable["restrained",false]) && !DWEV_istazed) then
			{
				[getPlayerUID player,getMyname,"668"] remoteExec ["DWEV_fnc_wantedAdd",2];
				[cursorTarget] spawn DWEV_fnc_knockoutAction;
				[player,"knockout"] call DWEV_fnc_globalSound;
			};
		};
	};

	case 20: //T
	{
		_allowedBoxes = ["Box_IND_Grenades_F","B_supplyCrate_F"];
		if(!_alt && !_ctrlKey) then
		{
//			if(vehicle player != player && alive vehicle player) then
//			{
//				if((vehicle player) in DWEV_vehicles || (vehicle player) in DWEV_robbed_vehicles) then
//				{
//					if((vehicle player getVariable ["trunk_in_use",false])) exitWith {hint "Der Kofferraum ist in gebrauch, er kann nur von einer Person zur gleichen Zeit genutzt werden."};
//					(vehicle player) setVariable["INV_OPENER",player,true];
//					[vehicle player] call DWEV_fnc_openInventory;
//				};
//			}
//				else
//			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship") && (player distance cursorTarget < 7) && (vehicle player == player) && (alive cursorTarget) && (((getposATL(player) select 2) - (getposATL(cursorTarget) select 2)) < 0.2 )) then
				{
					if(cursorTarget in DWEV_vehicles || cursorTarget in DWEV_robbed_vehicles || {!(cursorTarget getVariable ["locked",true])}) then
					{
						if ( (cursorTarget getVariable ["trunk_in_use",false]) && ((cursorTarget getVariable ["last_trunk_in_use_time",0]) != 0) && ((cursorTarget getVariable ["last_trunk_in_use_time",0]) <= (serverTime - (60 * 30)))) then // Trunk nach 30 Minuten wieder freigeben
						{
							cursorTarget setVariable["trunk_in_use",false,true];
							[cursorTarget,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2];
						};
												
						if((_vehicle getVariable ["trunk_in_use",false])) exitWith 
						{
							_unlockTime = ((_vehicle getVariable ["last_trunk_in_use_time",0]) - (serverTime - (30 * 60)));
							hint format ["Der Kofferraum ist in gebrauch, er kann nur von einer Person zur gleichen Zeit genutzt werden.\n\n Sollte dies eine Fehlannahme sein, kannst du deinen Kofferraum in %1 Minuten wieder öffnen",([_unlockTime] call DWEV_fnc_formatTime)];
						};
						
						
						[cursorTarget,"INV_OPENER",(getPlayerUID player),true] remoteExecCall ["DWF_fnc_setObjVar",2];
						[cursorTarget] spawn DWEV_fnc_openInventory;
						
					};
				}
				else
				{
					if((typeof (cursorTarget) IN _allowedBoxes) && (player distance cursorTarget < 7) && (vehicle player == player)) then
					{
							if((cursorTarget getVariable ["trunk_in_use",false])) exitWith {hint "Das Hausinventar ist in gebrauch, es kann nur von einer Person zur gleichen Zeit genutzt werden."};
							cursorTarget setVariable["INV_OPENER",(getPlayerUID player),true];
							[cursorTarget] spawn DWEV_fnc_openInventory;

					};
					
				};
			//};
		};
	};
	
	
	case 38: //L
	{
		//If cop run checks for turning lights on.
		if(_shift) then {
			if(vehicle player != player && (typeOf vehicle player) in ["B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_medevac_F","C_Offroad_01_F","C_SUV_01_F","B_MRAP_01_F","I_MRAP_03_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","B_Heli_Light_01_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","C_Van_01_box_F","B_G_Offroad_01_F","B_Heli_Transport_01_F","O_MRAP_02_F","I_Truck_02_covered_F","B_Truck_01_fuel_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
				if((side player) == west) then {
					[vehicle player] call DWEV_fnc_sirenLights;
					_handled = true;
					};
				if((side player) == independent) then {
					[vehicle player] call DWEV_fnc_sirenLights1;
					_handled = true;
					};
				};
			};
		};
		if (_shift && vehicle player == player) then {[vehicle player] call DWEV_fnc_useFlashlight;};
		if(!_alt && !_ctrlKey && (side player) == west) then { [] call DWEV_fnc_radar; };
	};
	
	case 41: //^
	{
		if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship") && (alive cursorTarget)) then
		{ [] call DWEV_fnc_magicfinger; };
	};
	
	case 21: //Z
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call DWEV_fnc_p_openMenu;
		};
	};
	
	
	case 33: //F
	{
		if((side player) in [west,independent] && vehicle player != player && (typeOf vehicle player) in ["B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_medevac_F","C_Offroad_01_F","C_SUV_01_F","B_MRAP_01_F","I_MRAP_03_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","B_Heli_Light_01_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","C_Van_01_box_F","B_G_Offroad_01_F","B_Lifeboat","C_Boat_Civil_01_police_F","B_SDV_01_F","B_Boat_Armed_01_minigun_F","B_Heli_Transport_01_F","O_MRAP_02_F","I_Truck_02_covered_F","B_Truck_01_fuel_F"] && !DWEV_siren_active && ((driver vehicle player) == player)) then
		{
			if(!_alt && !_ctrlKey && !_shift) then 
			{				
			[] spawn
			{
				DWEV_siren_active = true;
				sleep 5.8;
				DWEV_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Sirene aus","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Sirene an","PLAIN"];
				_veh setVariable["siren",true,true];
				if((side player) == west) then 
				{
					[_veh] remoteExec ["DWEV_fnc_copSiren",-2];
				} else 
				{
					[_veh] remoteExec ["DWEV_fnc_medicSiren",-2];
				};
			};
		};
	};
		if(((side player) == west) && vehicle player != player && !DWEV_siren_active1 && ((driver vehicle player) == player)) then
		{
		if (_alt) then
		{
			[] spawn
			{
				DWEV_siren_active1 = true;
				sleep 2;
				DWEV_siren_active1 = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren1"}) then {_veh setVariable["siren1",false,true];};
			if(!(_veh getVariable "siren1")) then
			{
				titleText ["Sirenenheulen","PLAIN"];
				_veh setVariable["siren1",true,true];
				if((side player) == west) then 
				{
					[_veh] remoteExec ["DWEV_fnc_copSiren1",-2];
				};
			};
		};
	};
	if(((side player) == west) && vehicle player != player && !DWEV_siren_active2 && ((driver vehicle player) == player)) then
		{
		if (_ctrlKey) then
		{
			[] spawn
			{
				DWEV_siren_active2 = true;
				sleep 6;
				DWEV_siren_active2 = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
			if(!(_veh getVariable "siren2")) then
			{
				titleText ["Warnung","PLAIN"];
				_veh setVariable["siren2",true,true];
				if((side player) == west) then 
				{
					[_veh] remoteExec ["DWEV_fnc_copSiren2",-2];
				};
			};
		};
	};
};
	
	case 22: //U
	{
		if(!_alt && !_ctrlKey && !DWEV_usekey) then 
		{
				[] spawn
				{
				DWEV_usekey = true;
	            sleep 1.0;
	            DWEV_usekey = false;
				};
			if(vehicle player == player) then 
			{
				_veh = cursorTarget;
			} 
			else 
			{
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && (side player) == civilian) then 
			{
				if(_veh in DWEV_vehicles && player distance _veh < 8) then 
				{
					_door = [_veh] call DWEV_fnc_nearestDoor;
					if(_door == 0) exitWith {hint "Du bist nicht in der nähe einer Tür!"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then 
					{
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat "Du hast die Tür abgeschlossen.";
					} 
					else 
					{
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat "Du hast die Tür aufgeschlossen.";
					};
				};
			}
			else 
			{
				_locked = locked _veh;
				if((_veh in DWEV_vehicles || _veh in DWEV_robbed_vehicles) && player distance _veh <= 12) then 
				{
					if(_locked == 2 && !(_veh getVariable ["savelock",false])) then
					{
						if(local _veh) then 
						{
							_veh lock 0;
						} else 
						{
							[_veh,0] remoteExec ["DWEV_fnc_lockVehicle",_veh];
						};
						systemChat "Du hast dein Fahrzeug aufgeschlossen.";
						[_veh,"LockSound"] call DWEV_fnc_globalSound;
					} 
					else 
					{
						if(local _veh) then 
						{
							_veh lock 2;
						} else 
						{
							[_veh,2] remoteExec ["DWEV_fnc_lockVehicle",_veh];
						};	
						systemChat "Du hast dein Fahrzeug abgeschlossen.";
						[_veh,"LockSound"] call DWEV_fnc_globalSound;
					};
				}
				else
				{
					if(!(_veh in DWEV_vehicles) && (player distance _veh < 8) && (__GETC__(DWEV_mediclevel) >= 3) && ((side player) == independent)) then
					{
						if(_locked == 2) then 
						{
							if(local _veh) then 
							{
								_veh lock 0;
							} 
							else 
							{
								[_veh,0] remoteExec ["DWEV_fnc_lockVehicle",_veh];
							};
							systemChat "Du hast dieses Fahrzeug mit deinem Universalschlüssel geöffnet, Denke bitte daran es wieder zu verschließen!";
							[_veh,"LockSound"] call DWEV_fnc_globalSound;
						} 
						else 
						{
							if(local _veh) then 
							{
								_veh lock 2;
							}
							else 
							{
								[_veh,2] remoteExec ["DWEV_fnc_lockVehicle",_veh];
							};	
							systemChat "Du hast das Fahrzeug abgeschlossen.";
							[_veh,"LockSound"] call DWEV_fnc_globalSound;
						};

					};
				
				};
			};
		};
	};
	
	case 47: //V
	{
		if((side player) != west && (player getVariable "restrained") OR (player getVariable "transporting")) then {_handled = true;};
	};

	case 39:  // Ö
	{
		if ((isNull(findDisplay 20000)) && (playerSide in ([west,independent,east])) && alive player) then
		{
		0 spawn DWEV_fnc_placeablesMenu;
		_handled = true;
		};
		_handled = true;
	};

	case 211: //ENTF-Taste
	{
		if ((playerSide in [west,independent,east]) && ((typeOf cursorTarget) in DWEV_definePlaceables)) then
		{
		deleteVehicle cursorTarget;
		hintSilent "Die Absperrung wurde entfernt";
		};
	};
	
	case 48: // Shift + B
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !DWEV_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn DWEV_fnc_surrender;
				};
			};
		};
	};
	
    case 24: // O
	{
		if (!_shift && !_alt && !_ctrlKey && (vehicle player != player) && (((side player) == west) || ((side player) == independent) || ((side player) == east) || (__GETC__(DWEV_adminlevel) >= 4))) then  //Ab H
		{
			[] call DWEV_fnc_copOpener;
		};
	};
	
	/*case 2: //1
	{
		if((side player) == west) then
		{
			[] call DWEV_fnc_p_openMenu;
			[] call DWEV_fnc_wantedMenu;
		};
	};*/

	case 25: //P 
	{
		if(_shift) then
		{
			[] call DWEV_fnc_fadeSound;
			_handled = true;
		};
	};
	
	///////////////////////////////////////
	
	case 197: 
	{
		["play"] spawn CLAY_fnc_controls;
	};

	case 205:
	{
		["next", 1] spawn CLAY_fnc_controls;
	};

	case 203:
	{
		["pre"] spawn CLAY_fnc_controls;
	};

	case 200:
	{
		["volUp"] spawn CLAY_fnc_settings;
	};

	case 208:
	{
		["volDown"] spawn CLAY_fnc_settings;
	};
	
	
	/////////////////////////////////////
	
	
	
	case 79://Takwondo(Traditional Martial arts in korea)(Shift + Num 1)
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player) && {!DWEV_is_arrested} && !(player getVariable ["restrained", false])) then
		{
			cutText [format["Takwondo!!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};


	case 80://Kneebend Slow(Shift + Num 2)
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player) && {!DWEV_is_arrested} && !(player getVariable ["restrained", false])) then
		{
			cutText [format["Kniebeugen langsam"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		};
	};


	case 81://Kneebend Fast(Shift + Num 3)
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player) && {!DWEV_is_arrested} && !(player getVariable ["restrained", false])) then
		{
			cutText [format["Kniebeugen schnell"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
	};


	case 75: //Pushup(Shift + Num 4)
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player) && {!DWEV_is_arrested} && !(player getVariable ["restrained", false])) then
		{
			cutText [format["Liegestütze"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};
	
	case 76://Pissen(Shift + Num 5)
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player) && {!DWEV_is_arrested} && !(player getVariable ["restrained", false])) then
		{
			cutText [format["!! Pissen !!"], "PLAIN DOWN"];
			player playMove "Acts_AidlPercMstpSlowWrflDnon_pissing";
		};
	};
	
	case 77://Bauchschmerzen(Shift + Num 6)
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player) && {!DWEV_is_arrested} && !(player getVariable ["restrained", false])) then
		{
			cutText [format["Bauchschmerzen"], "PLAIN DOWN"];
			player playMove "AcinPercMstpSnonWnonDnon_agony";
		};
	};
};

_handled;