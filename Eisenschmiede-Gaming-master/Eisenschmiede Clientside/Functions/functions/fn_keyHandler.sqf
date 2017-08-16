#include "..\script_macros.hpp"
#define KINDOF_BLUPS(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}
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
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(ES_action_inUse) exitWith {
	if(!ES_interrupted && _code in _interruptionKeys) then {ES_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(!(EQUAL(count (actionKeys "User10"),0)) && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!ES_action_inUse) then {
		[] spawn {
			private "_handle";
			_handle = [] spawn ES_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			ES_action_inUse = false;
		};
	};
	true;
};

switch (_code) do {
	//Space key for Jumping
	case 57: {
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {!(EQUAL(animationState player,"AovrPercMrunSrasWrflDf"))} && {isTouchingGround player} && {EQUAL(stance player,"STAND")} && {speed player > 2} && {!ES_is_arrested} && {SEL((velocity player),2) < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn ES_fnc_jumpFnc; //Local execution
			[player] remoteExec ["ES_fnc_jumpFnc",0]; //Global execution 
			_handled = true;
		};
	};
	
	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			case west: {if(!visibleMap) then {[] spawn ES_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn ES_fnc_medicMarkers; [] spawn ES_fnc_medicMarkersMed}};
			case civilian: {if(playerSide == civilian && !visibleMap) then {[] spawn ES_fnc_gangMarkers;}};   
		};
	};
	
	//Holster / recall weapon.
	case 35: {
		if(_shift && !_ctrlKey && !(EQUAL(currentWeapon player,""))) then {
			ES_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "ES_curWep_h" && {!(EQUAL(ES_curWep_h,""))}) then {
			if(ES_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon ES_curWep_h;
			};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey: {
		if(!ES_action_inUse) then {
			[] spawn  {
				private "_handle";
				_handle = [] spawn ES_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				ES_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19: {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && {!isNull cursorTarget} && {cursorTarget isKindOf "Man"} && {(isPlayer cursorTarget)} && {(side cursorTarget in [civilian,independent])} && {alive cursorTarget} && {cursorTarget distance player < 3.5} && {!(cursorTarget getVariable "Escorting")} && {!(cursorTarget getVariable "restrained")} && {speed cursorTarget < 1}) then {
			[] call ES_fnc_restrainAction;
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34: {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide in [civilian,east] && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !ES_knockout && !(player getVariable["restrained",false]) && !ES_istazed) then
			{
				[cursorTarget] spawn ES_fnc_knockoutAction;
			};
		};
	};
	
	//Shift+C Zipties
	case 46:
	{
		if(_shift) then {_handled = true;};
		if (!(license_civ_rebel) && (_shift) && (playerSide == civilian)) exitWith { hint "Du bist kein Rebelle um Personen festzunehmen."; };
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,east,west]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			if([false,"zipties",1] call ES_fnc_handleInv) then
			{
				[] call ES_fnc_restrainAction;
				[player,"handcuff"] call ES_fnc_globalSound;
				hint "Du hast ihn Festgenommen ! Mit dem Interaktionsmenü kannst zu weiter fortfahren.";
			} else {
				hint "Du hast keine Kabelbinder";
			};
		};
	};

	//T Key (Trunk)
	case 20: {
		if (player getVariable["restrained",false]) exitWith {};
		if(!_alt && !_ctrlKey && !dialog && {!ES_action_inUse}) then {
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in ES_vehicles) then {
					[vehicle player] call ES_fnc_openInventory;
				};
			} else {
				private "_list";
				_list = ["landVehicle","Air","Ship","House_F"];
				if(KINDOF_BLUPS(cursorTarget,_list) && {player distance cursorTarget < 7} && {vehicle player == player} && {alive cursorTarget} && {!ES_action_inUse}) then {
					if(cursorTarget in ES_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then {
						[cursorTarget] call ES_fnc_openInventory;
					};
				};
			};
		};
	};
	
	case 21: {
		if(!_alt && !_ctrlKey && !dialog && {!ES_action_inUse}) then {
			[] call ES_fnc_p_openMenu;
		};
	};

	case 211:
	{
		if(FETCH_CONST(ES_adminlevel) < 4) exitWith {closeDialog 0;};
		if (!isNull cursorTarget) then {
			deleteVehicle cursorTarget;
		};
	};
	
	case 210:
	{
		[] spawn ES_fnc_openMenu;
	};

	case 60:
	{
		[1] spawn ES_fnc_openKey;
	};

	case 61:
	{
		[2] spawn ES_fnc_openKey;
	};

	case 41:
    {
        if(playerSide in [west,independent,civilian,east]) then 
        {
            _handled = true;
        };
    };
	
	case 62:
    {
    if(_alt && !_shift) then {
		[] call SOCK_fnc_updateRequest;
		};
    };
	
	case 1:
    {
    if( _ctrlKey)  then {
		[] call SOCK_fnc_updateRequest;
		};
    };
	
	//F Key
	case 33: {
		if(_shift) then {Med_Hupe = true;};
		if(playerSide in [west,independent] && {vehicle player != player} && {!ES_siren_active} && {((driver vehicle player) == player)}) then {
			[] spawn {
				ES_siren_active = true;
				uiSleep 0.5;
				ES_siren_active = false;
			};
			
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable ["siren",false,true];};
			if((_veh getVariable "siren")) then {
				if(playerSide == west) then { titleText [localize "STR_MISC_SirensOFF","PLAIN"]; }else{ if (!Med_Hupe) then { titleText [localize "STR_MISC_SirensOFF","PLAIN"]; }; };
				_veh setVariable ["siren",false,true];
			} else {
				if(playerSide == west) then { titleText [localize "STR_MISC_SirensON","PLAIN"]; }else{ if (!Med_Hupe) then { titleText [localize "STR_MISC_SirensON","PLAIN"]; }; };
				_veh setVariable ["siren",true,true];
				if(playerSide == west) then {
					[_veh] remoteExec ["ES_fnc_copSiren",-2];
				} else {
					if (Med_Hupe) then { [_veh] remoteExec ["ES_fnc_medHupe",-2]; }else { [_veh] remoteExec ["ES_fnc_medicSiren",-2]; };
				};
			};
		};
	};

	case 38: //Shift + L Key = Emergency Lights - Radar
    {
        _veh = vehicle player;
        if (_shift && !_alt && !_ctrlKey) then
        {
            if(playerSide in [west,independent] && _veh != player && ((driver _veh) == player)) then
            {
                if(!isNil {_veh getVariable "lights"}) then
                {
                    if(playerSide == west) then
                    {
                        [_veh] call ES_fnc_sirenLights;
                    } else {
                        [_veh] call ES_fnc_medicSirenLights;
                    };
                };
            };
            _handled = true;
        };
        if(!_alt && !_ctrlKey) then { [] call ES_fnc_radar; };
    };
	
	//EMP Konsole - K
    case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["B_Heli_Light_01_F","I_Heli_light_03_unarmed_F"])) then
        {
            [] call ES_fnc_openEmpMenu; [_this] call ES_fnc_isEmpOperator;
        };
    };
	
	//Shift+P = Faded Sound
	case 25:
	{
		if(_shift) then
		{
			[] call ES_fnc_fadeSound;
			_handled = true;
		};
	};
	
	case 2:
	{
		if(ES_xp_lvl >= 3 && !_shift) then {
			if (vehicle player == player) then
			{["gestureHi"] spawn ES_fnc_ESMoves;};
		};
	};
	
	case 3:
	{
		if(ES_xp_lvl >= 3 && !_shift) then {
			if (vehicle player == player) then
			{["gestureHiB"] spawn ES_fnc_ESMoves;};
		};	
	};
	
	case 4:
	{
		if(ES_xp_lvl >= 3 && !_shift) then {
			if (vehicle player == player) then
			{["gestureHiC"] spawn ES_fnc_ESMoves;};
		};	
	};
	
	case 5:
	{
		if(ES_xp_lvl >= 3 && !_shift) then {	
			if (vehicle player == player) then
			{["gestureNod"] spawn ES_fnc_ESMoves;};
		};	
	};
	
	case 6:
	{
		if(ES_xp_lvl >= 3 && !_shift) then {
			if (vehicle player == player) then
			{["Scared"] spawn ES_fnc_ESMoves;};
		};
	};
	
	case 7:
	{
		if(ES_xp_lvl >= 5 && !_shift) then {
			if ((_shift) && (vehicle player == player)) then
			{["Pissing"] spawn ES_fnc_ESMoves;};
		};
	};
	
	case 8:
	{
		if(ES_xp_lvl >= 42 && !_shift) then {
			if (vehicle player == player) then
			{["EpicSplit"] spawn ES_fnc_ESMoves;};
		};	
	};
	
	case 9:
	{
		if(ES_xp_lvl >= 10 && !_shift) then {
			if (vehicle player == player) then
			{["LowGesture"] spawn ES_fnc_ESMoves;};
		};	
	};

	case 79:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{["Takwondo"] spawn ES_fnc_ESMoves;};
	};

	case 80:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{["KneebendSlow"] spawn ES_fnc_ESMoves;};
	};

	case 81:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{["KneebendFast"] spawn ES_fnc_ESMoves;};
	};
	
	case 75:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{["Pushup"] spawn ES_fnc_ESMoves;};
	};
	
	// B - Surrender
	case 48:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !ES_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn ES_fnc_surrender;
				};
			};
		};
	};
	
	// Ä, police gate opener
    case 40:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide in [west,independent]) && (vehicle player != player)) then {
		[] call ES_fnc_copOpener;
		};
		if(ES_is_arrested or (player getVariable "restrained")) then {
			_handled = true;
		};
	};
	
	//Ö Key
	case 39:
	{
		if(_shift) then {Cop_Kampfansage = true;};
		if(playerSide in [west] && vehicle player != player && !ES_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				ES_siren_active = true;
				sleep 7;
				ES_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
			if((_veh getVariable "siren2")) then
			{
				titleText ["Warnung AUS","PLAIN"];
				_veh setVariable["siren2",false,true];
			}
				else
			{
				titleText ["Warnung AN","PLAIN"];
				_veh setVariable["siren2",true,true];
				if(playerSide == west) then {
				if(Cop_Kampfansage) then {[[_veh],"ES_fnc_copSiren3",nil,true] spawn ES_fnc_MP;}else{[[_veh],"ES_fnc_copSiren2",nil,true] spawn ES_fnc_MP;};
				} else {
					[[_veh],"ES_fnc_medicSiren",nil,true] spawn ES_fnc_MP;
				};
			};
		};

		if(playerSide in [civilian] && license_civ_skskins && vehicle player != player && !ES_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				ES_siren_active = true;
				sleep 10;
				ES_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "SKsirene"}) then {_veh setVariable["SKsirene",false,true];};
			if((_veh getVariable "SKsirene")) then
			{
				titleText ["Sirene AUS","PLAIN"];
				_veh setVariable["SKsirene",false,true];
			}
				else
			{
				titleText ["Sirene AN","PLAIN"];
				_veh setVariable["SKsirene",true,true];
				[[_veh],"ES_fnc_SKsirene",nil,true] spawn ES_fnc_MP;
			};
		};

	};

	// Q
    case 16:
    {
        if ((ES_inv_pickaxe >0) && (vehicle player == player) && !ES_action_pickaxeInUse) then{
            [] spawn ES_fnc_pickaxeUse;
        }else
        {
			if (vehicle player != player && ((typeOf vehicle player) in ["C_Offroad_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Van_01_box_F","C_Van_01_transport_F"]) && ((driver vehicle player) == player)) then
			{
				_blinke = 1;
				if ((vehicle player getVariable ["blinke", 0]) == 1) then { _blinke = 0; };
				[[vehicle player,_blinke],"ES_fnc_wenden",true,false] spawn BIS_fnc_MP;
				(vehicle player) setVariable ["blinke",_blinke,true];
			};
	    };
    };

	if (_code in (actionKeys "LeanRight") || _code in (actionKeys "LeanRightToggle")) then
	{
		if (vehicle player != player && ((typeOf vehicle player) in ["C_Offroad_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Van_01_box_F","C_Van_01_transport_F"]) && ((driver vehicle player) == player)) then
		{
			_blinke = 2;
			if ((vehicle player getVariable ["blinke", 0]) == 2) then { _blinke = 0; };
			[[vehicle player,_blinke],"ES_fnc_wenden",true,false] spawn BIS_fnc_MP;
			(vehicle player) setVariable ["blinke",_blinke,true];
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
			
			if(_veh isKindOf "House_F" && (playerSide == civilian || playerSide == east)) then {
				if(_veh in ES_vehicles && player distance _veh < 12) then {
					_door = [_veh] call ES_fnc_nearestDoor;
					if(EQUAL(_door,0)) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					
					if(EQUAL(_locked,0)) then {
						_veh setVariable [format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable [format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in ES_vehicles && player distance _veh < 12) then {
					if(_locked == 2) then {
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
						} else {
							[[_veh,0],"ES_fnc_lockVehicle",_veh,false] spawn ES_fnc_MP;
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
						};
						hint composeText [ image "Images\icons\unlock.paa", "  Fahrzeug aufgeschlossen" ];
						player say3D "unlock";
						systemChat localize "STR_MISC_VehUnlock";
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
						} else {
							[[_veh,2],"ES_fnc_lockVehicle",_veh,false] spawn ES_fnc_MP;
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
						};	
						hint composeText [ image "Images\icons\lock.paa", "  Fahrzeug abgeschlossen" ];
						player say3D "car_lock";
						systemChat localize "STR_MISC_VehLock";
					};
				};
			};
		};
	};
};

_handled;