/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'

	https://community.bistudio.com/wiki/ListOfKeyCodes
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorObject;
_handled = false;
BUILD_space = false;
_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player getVariable ["restrained",false]) || (player getVariable ["playerSurrender",false]) || lhm_knockout || lhm_istazed)) exitWith {
    true;
};

if(lhm_action_inUse) exitWith {
	if(!lhm_interrupted && _code in _interruptionKeys) then {lhm_interrupted = true;};
	_handled;
};
/*
if((ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") && currentChannel == 7 && playerside isEqualTo civilian) then {

	[] spawn lhm_fnc_shutUpChannel; //Anti Side channel gelaber skript

};
*/

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!lhm_action_inUse) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn lhm_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			lhm_action_inUse = false;
		};
	};
	true;
};


if (lhm_container_active) then {
	switch (_code) do {
		//space key
		case 57: {
			[] call lhm_fnc_placestorage;
		};
	};
	true;
};

switch (_code) do
{
//////////////////// BASE BUILD KEYS ////////////////////
	case 201: // BILD hoch
	{
		if (lhm_gangarea_buildmode) then {
			//BUILD_Z_OFFSET = (BUILD_Z_OFFSET + 0.1) min 6; _handled = true
		};
	};
	case 209: // BILD runter
	{
		if (lhm_gangarea_buildmode) then {
			//BUILD_Z_OFFSET = (BUILD_Z_OFFSET - 0.1) max 0; _handled = true
		};
	};
	case 199: // POS1
	{
		if (lhm_gangarea_buildmode) then {
			BUILD_Y_OFFSET = (BUILD_Y_OFFSET + 0.1) min 5; _handled = true
		};
	};
	case 207: // ENDE
	{
		if (lhm_gangarea_buildmode) then {
			BUILD_Y_OFFSET = (BUILD_Y_OFFSET - 0.1) max 2; _handled = true
		};
	};
	case 205: // Right
	{
		if (lhm_gangarea_buildmode) then {
			BUILD_X_OFFSET = (BUILD_X_OFFSET + 0.1) min 5; _handled = true
		};
	};
	case 203: // Left
	{
		if (lhm_gangarea_buildmode) then {
			BUILD_X_OFFSET = (BUILD_X_OFFSET - 0.1) max -5; _handled = true
		};
	};
	case 16: // Q
	{
		if (lhm_gangarea_buildmode) then {
			BUILD_buildDirection = (BUILD_buildDirection + 1) min 360; BUILD_space = true; hintsilent str(BUILD_buildDirection); _handled = true
		} else {
			// Key Shift + Q Cop Vehicle Radio
			if (_ctrlKey && !_shift && playerside isEqualTo west && (vehicle player != player && alive vehicle player)) then
			{
				[] spawn lhm_fnc_copVehRadio;
			};
			if(!(isnull LHM_COP_BUILD_OBJ)) then {
				LHM_COP_BUILD_OBJ setdir((getdir LHM_COP_BUILD_OBJ + 1));
			};

		};
	};
	case 18: // E
	{
		if (lhm_gangarea_buildmode) then {
			BUILD_buildDirection = (BUILD_buildDirection - 1) max 0; BUILD_space = true; hintsilent str(BUILD_buildDirection); _handled = true
		};
		if(!(isnull LHM_COP_BUILD_OBJ)) then {
				LHM_COP_BUILD_OBJ setdir((getdir LHM_COP_BUILD_OBJ - 1));
			};
		if(vehicle player != player && ((vehicle player) iskindof "Car") && ((vehicle player) getvariable["injection",0] > 0) && !LHM_injection && ((driver vehicle player) == player)) then {
			LHM_injection = true;
			[[player,"speed"],"lhm_fnc_say3d",true,false]call lhm_fnc_mp;
			_vehicle = vehicle player;
			_vel = velocity _vehicle;
			_dir = direction _vehicle;
			_speed = 35;
			_vehicle setVelocity [   (_vel select 0) + (sin _dir * _speed),    (_vel select 1) + (cos _dir * _speed),    (_vel select 2)  ];
			_tmp = _vehicle getvariable["injection",0];
			if(_tmp > 1) then {
				_tmp = _tmp - 1;
				_vehicle setvariable["injection",_tmp,true];
			} else {
				_vehicle setvariable["injection",nil,true];
			};
			LHM_injection = false;

		};
	};
	case 211: // ENTF
	{
		if (lhm_gangarea_buildmode) then {
			BUILD_Z_OFFSET = 0; BUILD_X_OFFSET = 0; BUILD_Y_OFFSET = 5; BUILD_buildDirection = 0; hintsilent "RESET ALIGNMENT"; _handled = true
		};
	};

	case 210: // INSERT
	{
		if (!lhm_gangarea_buildmode) then {
			[["spy",(format["%1 with UID %2 is using the Insert Key",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;
		};
	};

//////////////////// BASE BUILD KEYS ////////////////////

	case 86: // Volume Sound up and down
	{
		if(_shift) then
		{
			[] call lhm_fnc_fadeSound;
			_handled = true;
		};
	};

	case 28: // Terminal System
	{
		disableSerialization;
		_display = findDisplay 2799;
		_eingabe = _display displayCtrl 1400;
		if(dialog && ctrlshown _eingabe) then
		{
			[] spawn lhm_fnc_terminal_input;
		};
	};

	// Key 1 Menu System
	case 2:
	{
		if(playerside isEqualTo west)then
		{
			[] call lhm_fnc_opportunities_dialog;
		};
	};

	case 3:
	{
		if((playerSide in [west,east,independent]) && (player distance cursorObject < 6) && (vehicle player == player)) then
		{
			createDialog "Get_In_Menu";

		};
	};
	case 4:
	{
		if (vehicle player turretUnit [0] == player && playerside isEqualTo west)then
			{
				[] spawn lhm_fnc_cop_Radar_open_normal;
			};
	};

	//surrender... shift + b
	case 48:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
			{
				if (player getVariable ["playerSurrender", false]) then
				{
					player setVariable ["playerSurrender", false, true];
				} else
				{
					[] spawn lhm_fnc_surrender;
				};
			};
		};
	};

	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {lhm_is_arrested == 0} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn lhm_fnc_jumpFnc; //Local execution
			[[player,false],"lhm_fnc_jumpFnc",nil,FALSE] call lhm_fnc_mp; //Global execution
			_handled = true;
		};

	};

	//Map Key
	case _mapKey:
	{
		switch (playerSide) do
		{
			case west: {if(!visibleMap) then {[] spawn lhm_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn lhm_fnc_medicMarkers;}};
			case east: {if(!visibleMap) then {[] spawn lhm_fnc_secMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn lhm_fnc_mapMarkerplayer;}};
		};
	};

	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			lhm_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "lhm_curWep_h" && {(lhm_curWep_h != "")}) then {
			if(lhm_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon lhm_curWep_h;
			};
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!lhm_action_inUse) then {
			[] spawn
			{
				private["_handle"];
				_handle = [] spawn lhm_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				lhm_action_inUse = false;
			};
		};
	};

	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		//if(_shift && playerside isEqualTo west && !isNull cursorObject && cursorObject isKindOf "Man" && (isPlayer cursorObject) && (side cursorObject == civilian) && alive cursorObject && cursorObject distance player < 3.5 && !(cursorObject getVariable "Escorting") && !(cursorObject getVariable "restrained") && speed cursorObject < 1) then
		if(_shift && !isNull cursorObject && cursorObject isKindOf "Man" && (isPlayer cursorObject) && alive cursorObject && cursorObject distance player < 3.5 && !(cursorObject getVariable "Escorting") && !(cursorObject getVariable "restrained") && speed cursorObject < 1) then // LHM
		{
			If (playerside isEqualTo west or playerside isEqualTo opfor) then {
			[] call lhm_fnc_restrainAction;
			};

			If (playerside isEqualTo civilian) then {
				If ((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && lhm_knockout) then {
				[] call lhm_fnc_restrainAction;
				};
			};
		};
	};

	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		//if(_shift && playerside isEqualTo civilian && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4 && speed cursorObject < 1) then
		if(_shift && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 3.1) then
		{
			if((animationState cursorObject) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !lhm_knockout && !(player getVariable["restrained",false]) && !lhm_istazed) then
			{
				[cursorObject] spawn lhm_fnc_knockoutAction;
			};
		};
	};


		//T Key (Trunk)
	case 20: {
		if(!_alt && !_ctrlKey && !dialog && {!lhm_action_inUse}) then {
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in lhm_vehicles) then {
					[vehicle player] call lhm_fnc_openInventory;
				};
			} else {
				private "_list";
				_containers = [getPosATL player, ["Box_IND_Grenades_F","B_supplyCrate_F"], 2.5] call lhm_fnc_nearestObjects;
				if (count _containers > 0) then {
					_container = _containers select 0;
					[_container] call lhm_fnc_openInventory;
				} else {
					if((cursorObject isKindOf "Car" OR cursorObject isKindOf "Air" OR cursorObject isKindOf "Ship" OR cursorObject isKindOf "House_F") && player distance cursorObject < 7 && vehicle player == player && alive cursorObject) then
					{
						if(cursorObject in lhm_vehicles OR {!(cursorObject getVariable ["locked",true])}) then
						{
							[cursorObject] spawn lhm_fnc_openInventory;
						};
					};
				};
			};
		};
	};


	//Shift + L Key?
	case 38:
	{
		//If cop run checks for turning lights on.
		if(_shift) then {
			if(isNil {_veh getVariable "lights"}) then {_veh setVariable["lights",false,true];};
			[] spawn
			{
				lhm_sirenLight_active = true;
				sleep 2;
				lhm_sirenLight_active = false;
			};

			if(vehicle player != player) then {
				if(!isNil {vehicle player getVariable "lights"} && !lhm_sirenLight_active) then {

					[playerSide,vehicle player] call lhm_fnc_sirenLights;
					_handled = true;
				};
			};
		};

	};
	//z Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog && lhm_canOpenPMenu) then
		{
			[] call lhm_fnc_p_openMenu;
		};
	};

		//Animation: Kung Fu  Shift + Num 1
    case 79:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
		if(!LHM_GERICHT) then {
       		 [] spawn {
			_weapon = primaryWeapon player;
			_magazin = primaryWeaponMagazine player;
			_items = primaryWeaponItems player;
			 player removeWeapon _weapon;
			 player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
			 waitUntil{animationState player == "AmovPercMstpSnonWnonDnon_exerciseKata"};
			 sleep 2;
			 waitUntil{!(animationState player == "AmovPercMstpSnonWnonDnon_exerciseKata")};
			 player addWeapon _weapon;
		 	player addMagazines[_magazin select 0,1];
			 player addPrimaryWeaponItem (_items select 0);
			 player addPrimaryWeaponItem (_items select 1);
			 player addPrimaryWeaponItem (_items select 2);
			 player addPrimaryWeaponItem (_items select 3);
			 };
		} else {
			hint "Das geht hier nicht!";
		};
        };
        };
    };

	//Animation: Liegestütze  Shift + Num 2
    case 80:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
		if(!LHM_GERICHT) then {
         		player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		} else {
			hint "Das geht hier nicht!"
		};
        };
        };
    };

		//Animation: pushups A  Shift + Num 3
    case 81:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
         player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";

        };
        };
    };

		//Animation: pushups B  Shift + Num 4
    case 75:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
         player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";

        };
        };
    };

		//Animation: CeaseFire  Shift + Num 5
    case 76:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
         player playAction "gestureCeaseFire";

        };
        };
    };

		//Animation: No  Shift + Num 6
    case 77:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
         player playAction "gestureNo";

        };
        };
    };

			//Animation: Hi  Shift + Num 7
	 case 71:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
         player playAction "gestureHi";

        };
        };
    };

		//Animation: Noe  Shift + Num 8
	 case 72:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
         player playAction "gestureNod";

        };
        };
    };

		//Animation: Pinkeln  Shift + Num 9
	 case 73:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
		if(!LHM_GERICHT) then {
         		player playMove "Acts_AidlPercMstpSlowWrflDnon_pissing";
		} else {
			hint "Das geht hier nicht!"
		};
        };
        };
    };

		//Animation: Point  Shift + Num 0
	 case 82:
    {
         if(_shift) then {_handled = true;};
         if (_shift) then
        {
         if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !lhm_istazed) then
        {
         player playAction "gesturePoint";

        };
        };
    };

	//F Key
	case 33:
	{
		if(playerSide in [west,independent,east] && vehicle player != player && !lhm_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				lhm_siren_active = true;
				sleep 4.7;
				lhm_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerside isEqualTo west) then {
					[[_veh,11,"SirenLong"],"lhm_fnc_sirenSoundEx",nil,true] call lhm_fnc_mp;
				};
				if(playerside isEqualTo independent) then {
					[[_veh,10.4,"SirenMedic"],"lhm_fnc_sirenSoundEx",nil,true] call lhm_fnc_mp;
				};
				if(playerside isEqualTo east) then {
					/* No Sounds yet */
				};
				if(playerside isEqualTo civilian) then {
					/* No Sounds yet */
				};
			};
		};
	};
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorObject;
			} else {
				_veh = vehicle player;
			};

			//if(_veh isKindOf "House_F" && playerside isEqualTo civilian) then {
			if(_veh isKindOf "House_F") then {

			if (playerside isEqualTo west) then {
				if (player distance _veh < 8 && (_veh getVariable ["gangarea_id",-1] != -1)) then {
					[_veh] spawn lhm_fnc_copBreakDoor;
				};
			};

			if (playerside isEqualTo civilian) then {
				//if(_veh in lhm_vehicles && player distance _veh < 8) then {
				if((_veh in lhm_vehicles && player distance _veh < 8.5)) then { // LHM
					_door = [_veh] call lhm_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animateSource [format["Door_%1_source",_door],0];
						systemChat localize "STR_House_Door_Lock";
						hint parseText "<img image='core\textures\icons\misc\lock.paa'/> Haus abgeschlossen";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animateSource [format["Door_%1_source",_door],1];
						systemChat localize "STR_House_Door_Unlock";
						hint parseText "<img image='core\textures\icons\misc\unlock.paa'/> Haus aufgeschlossen";
					};
				} else {
						if(player distance _veh < 8 && (_veh getVariable ["gangarea_id",-1] != -1) && (_veh getVariable ["gangarea_id", -1]) == (lhm_gangData select 0)) then {
						_door = [_veh] call lhm_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animateSource [format["Door_%1_source",_door],0];
						systemChat localize "STR_House_Door_Lock";
						hint parseText "<img image='core\textures\icons\misc\lock.paa'/> Haus abgeschlossen";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animateSource [format["Door_%1_source",_door],1];
						systemChat localize "STR_House_Door_Unlock";
						hint parseText "<img image='core\textures\icons\misc\unlock.paa'/> Haus aufgeschlossen";
					};
						};

				};
			};
			} else {
				_locked = locked _veh;
				if(_veh in lhm_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
							playSound "vehicle_unlock";
						} else {
							[[_veh,0],"lhm_fnc_lockVehicle",_veh,false] call lhm_fnc_mp;
							playSound "vehicle_unlock";

						};
						systemChat localize "STR_MISC_VehUnlock";
						hint parseText "<img image='core\textures\icons\misc\unlock.paa'/> Fahrzeug aufgeschlossen";
					} else {
						if(local _veh) then {
							_veh lock 2;
							playSound "vehicle_lock";
						} else {
							[[_veh,2],"lhm_fnc_lockVehicle",_veh,false] call lhm_fnc_mp;
							playSound "vehicle_lock";
						};
						systemChat localize "STR_MISC_VehLock";
						hint parseText "<img image='core\textures\icons\misc\lock.paa'/> Fahrzeug abgeschlossen";

					};
				};
			};
		};
	};
};

_handled;