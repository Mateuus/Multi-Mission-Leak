/*
	File: fn_keyHandler.sqf
	
	Description:
	Main key handler for event 'keyDown'
*/

params ["_ctrl", "_code", "_shift", "_ctrlKey", "_alt", ["_handled", false, [false]], "_veh", "_locked", "_interactionKey", "_mapKey", ["_interruptionKeys", [17,30,31,32]]];
_speed = speed cursorTarget;
if(life_antispamactive) exitWith { _handled; };

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "sitDown")) && {(player getVariable ["restrained",false]) || (player getVariable ["tied",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
		if((player distance (getMarkerPos "police_mark") > 200) && (player distance (getMarkerPos "police_mark3") > 200) && (player distance (getMarkerPos "police_mark1") > 200)) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
		};
	};


	case 68:
	{
		_handled = true;
		[] call life_fnc_helpMenu;
	};

	//Shift+O = Disable / Enable Dispatch.
	case 24:
	{
		if(!_shift && !_alt && !_ctrlKey) then
		{
			if(!dialog) then {
				if(!dispatch2) then {
					["Przesylki wylaczone.", false] spawn doquickmsg; 
					dispatch2 = true;	
				} else {
					["Przesylki wlaczone.", false] spawn doquickmsg; 
					dispatch2 = false;
				};
			};
		};
	};

	//Shift+P = Faded Sound
	case 25:
	{
	    if(_shift && !_alt && !_ctrlKey) then
	    {
	        [] call life_fnc_fadeSound;
	        _handled = true;
	        [] spawn life_fnc_AntiSpam2;
	    };
		if(_alt && _ctrlKey && !_shift && playerSide isEqualTo west) then 
		{
			createDialog "radioMenu";
			_handled = true;
		};
	};
	
	//EMP Konsole - O
    case 24:
    {
        if (!_shift && !_alt && _ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["melb_h6m"])) then
        {
            [] call life_fnc_openEmpMenu; [_this] call life_fnc_isEmpOperator;
        };
    };

	//Siren - F9
    case 67:
    {
        if (!_shift && !_alt && !_ctrlKey && playerSide == west) then
        {
            [] call life_fnc_actAirSiren;
        };
    };
	
	//Siren - F9
    case 67:
    {
        if (!_shift && !_alt && !_ctrlKey && playerSide == independent) then
        {
            [] call life_fnc_medactAirSiren;
        };
    };
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers}};
		};
	};


	
	//code 1 key shift+1
	case 2:
	{
		if((vehicle player) == player && !dialog) then {
			_handled = true;
		};
		if(!_shift && !_ctrlkey && playerSide == west) then {
			createDialog "Life_Charge_Menu";
		};
		if(_shift) then
		{
			if (vehicle player != player && side player == west) then {
				["Kod 1", false] spawn doquickmsg; 
					vehicle player animate ["ani_lightbar", 0];
					vehicle player animate ["ani_siren", 0];
					vehicle player animate ["ani_directional", 0];
					vehicle player setvariable ["lightbar",0,true];
					vehicle player setVariable ["siren",0,true];
				[] spawn life_fnc_AntiSpam2;
				_handled = true;
			};
			if (isNull objectParent player && player distance cursortarget < 4) then {
				[] spawn life_fnc_trydriver;
				[] spawn life_fnc_AntiSpam2;
			};
			_handled = true;
		};

		if(_ctrlkey && !dialog) then
		{
			if( vehicle player != player || !isPlayer cursortarget ) then {
				[] spawn fnc_findPlayers;
			} else {
				_vehicle = cursortarget;
				if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "Bicycle") || (_vehicle isKindOf "Motorbike") || (_vehicle isKindOf "A3L_Tahoe_Base")) then {
					
				} else {
					[_vehicle] spawn fnc_medicUpdater;
				};
			};

			_handled = true;
		};
	};

	//code 2 key shift+2
	case 3:
	{
		if(!_alt && _ctrlKey && !dialog) then
		{
			[] spawn life_fnc_animMenu;
		};
		if(_shift) then
		{
			if (vehicle player != player && side player == west) then {
				[] spawn life_fnc_AntiSpam2;
				["Kod 2", false] spawn doquickmsg; 
				if( typeOf(vehicle player) IN ["ivory_isf_marked","ivory_isf_unmarked","ivory_isf_slicktop","ivory_m3_marked","ivory_m3_unmarked","ivory_m3_slicktop","ivory_wrx_marked","ivory_wrx_unmarked","ivory_wrx_slicktop"] ) then {
  				   vehicle player animate ["ani_siren", 0];
     		   	   vehicle player animate ["ani_lightbar", 1];
       			    vehicle player animate ["ani_directional", 1];
			    } else {
					vehicle player animate ["ani_lightbar", 0.1];
					vehicle player animate ["ani_siren", 0]; 
					vehicle player setvariable ["lightbar",1,true];
					vehicle player setVariable ["siren",0,true];
				};			
			};
			if (isNull objectParent player && player distance cursortarget < 4) then {
				[true] spawn life_fnc_trydriver;
				[] spawn life_fnc_AntiSpam2;
			};
			_handled = true;
		};
	};

	//code 3 key shift+3
	case 4:
	{
		if(_shift) then
		{
			if (vehicle player != player && side player == west) then {
				[] spawn life_fnc_AntiSpam2;
				["Kod 3", false] spawn doquickmsg; 
				if( typeOf(vehicle player) IN ["ivory_isf_marked","ivory_isf_unmarked","ivory_isf_slicktop","ivory_m3_marked","ivory_m3_unmarked","ivory_m3_slicktop","ivory_wrx_marked","ivory_wrx_unmarked","ivory_wrx_slicktop"] ) then {
  				   vehicle player animate ["ani_siren", 1];
     		   	   vehicle player animate ["ani_lightbar", 1];
       			    vehicle player animate ["ani_directional", 1];
			    } else {
					vehicle player animate ["ani_siren", 0.2];
					vehicle player animate ["ani_lightbar", 0.1];
					vehicle player setvariable ["lightbar",1,true];
					vehicle player setVariable ["siren",1,true];
				};
			};
			_handled = true;
		};

		if(_ctrlkey && !dialog) then
		{
			if( vehicle player != player ) then {
				[] spawn life_fnc_seatbelt;
				_handled = true;
			};
		};

	};

	//code 4 
	case 5:
	{
		if(_shift && has_job) then
		{
			[] spawn fnc_quitjobs;
			_handled = true;
		};
	};

	//shift + 5
	case 6:
	{
		if(_shift) then
		{
			if( vehicle player != player ) then
			{
				_locked = locked (vehicle player);
				if(_locked == 2) then {
					_handled = true;
					[] spawn fnc_doorkick;
					["Wykopales drzwi pojazdu..", false] spawn domsg; 
				};
			};
		};
	};

	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
			[] spawn life_fnc_AntiSpam2;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
				[] spawn life_fnc_AntiSpam2;
			};
		};

        if( playerSide == west && vehicle player != player && ((driver vehicle player) == player) && _ctrlKey ) then
		{
			_veh = vehicle player;
			if( _veh isKindOf "Car" || _veh isKindOf "Motorcycle" || _veh isKindOf "Motorbike" ) then {
			if(isNil {_veh getVariable "sirenUC"}) then {_veh setVariable["sirenUC",false,true];};
			if((_veh getVariable "sirenUC")) then
			{
			   ["Syreny wylaczone", false] spawn doquickmsg; 
				_veh setVariable["sirenUC",false,true];
				[] spawn life_fnc_AntiSpam2;
			};
			};
		};

        if( playerSide == west && vehicle player != player && ((driver vehicle player) == player) && !_ctrlKey ) then
		{
			_veh = vehicle player;
			if( _veh isKindOf "Car" || _veh isKindOf "Motorcycle" || _veh isKindOf "Motorbike" ) then {
			if(isNil {_veh getVariable "sirenUC"}) then {_veh setVariable["sirenUC",false,true];};
			if(!(_veh getVariable "sirenUC")) then
			{
				 _veh setVariable["sirenUC",true,true];
				 ["Syreny wlaczone - CTRL + H aby wylaczyc!", false] spawn doquickmsg; 
				[_veh] remoteExec ["life_fnc_copSiren",-2];
				[] spawn life_fnc_AntiSpam2;
			};
			};
		};

        if( playerSide == independent && vehicle player != player && ((driver vehicle player) == player) && _ctrlKey ) then
		{
			_veh = vehicle player;
			if( _veh isKindOf "Car" || _veh isKindOf "Motorcycle" || _veh isKindOf "Motorbike" ) then {
			if(isNil {_veh getVariable "sirenUC"}) then {_veh setVariable["sirenUC",false,true];};
			if((_veh getVariable "sirenUC")) then
			{
			   ["Syreny wylaczone!", false] spawn doquickmsg; 
				_veh setVariable["sirenUC",false,true];
				[] spawn life_fnc_AntiSpam2;
			};
			};
		};

        if( playerSide == independent && vehicle player != player && ((driver vehicle player) == player) && !_ctrlKey ) then
		{
			_veh = vehicle player;
			if( _veh isKindOf "Car" || _veh isKindOf "Motorcycle" || _veh isKindOf "Motorbike" ) then {
				if(isNil {_veh getVariable "sirenUC"}) then {
					_veh setVariable["sirenUC",false,true];
				};
				if(!(_veh getVariable "sirenUC")) then
				{
					 _veh setVariable["sirenUC",true,true];
					["Syreny wlaczone - CTRL + H aby wylaczyc!", false] spawn doquickmsg; 
					[_veh] remoteExec ["life_fnc_copSiren",-2];
					[] spawn life_fnc_AntiSpam2;
				};
			};
		};
  	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				[] spawn life_fnc_AntiSpam2;
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	case 50:
	{	
		if((player getVariable ["tied", false])) then {
			_handled = true;
		};	
	};	

	case 36:
	{	
		if(!dialog) then {
		_handled = true;
		};
	};	

	case 83:
	{	
		if(!dialog) then {
		_handled = true;
		};
	};	




	//Restraining
	case 19:
	{

		if(_shift) then {
			_handled = true;
		};

		if(_ctrlKey) then {
			_handled = true;
		};

		if(_shift && (driver (vehicle player) == player) && (vehicle player) != player) then {
			[] spawn life_fnc_Nos;
			[] spawn life_fnc_AntiSpam2;
		};

		if(_shift && !isNull cursorTarget && playerSide == west && !life_paintball && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && cursorTarget distance player < 3 && !(cursorTarget getVariable ["Escorting", false]) && !(cursorTarget getVariable ["restrained", false]) && vehicle player == player) then
		{
			if( "CG_ATF_Handcuffs_i" in magazines player ) then {
				[] spawn life_fnc_AntiSpam2;
				[] call life_fnc_restrainAction;
			} else {

			};
		};
		if(_ctrlKey && !isNull cursorTarget && playerSide == west && !life_paintball && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && cursorTarget distance player < 3 && !(cursorTarget getVariable ["Escorting", false]) && !(cursorTarget getVariable ["restrained", false]) && vehicle player == player) then
		{
			if( "CG_ATF_Handcuffs_i" in magazines player ) then {
				[] spawn life_fnc_AntiSpam2;
				[true] call life_fnc_restrainAction;
			} else {

			};
		};


	};
	
	//Knockout
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && !(cursorTarget getVariable["dead",FALSE]) && cursorTarget distance player < 3 && vehicle player == player) then
		{
			if((animationState cursorTarget) != "Incapacitated" && !life_knockout && !(player getVariable["restrained",false]) && !(player getVariable["tied",false]) && !life_istazed && !life_paintball && (stance player) != "PRONE") then
			{
				if(side player == west) then {
					_curWep = currentWeapon player;
					if(_curWep != "CG_Torch") then {
						[cursorTarget] spawn life_fnc_tackleAction;
						[] spawn life_fnc_AntiSpam2;
					} else {
						[cursorTarget] spawn life_fnc_knockoutAction;
						[] spawn life_fnc_AntiSpam2;
					};
				} else {
					if(time - life_knockOutCD < 2) exitWith {["Nie masz odpowiednio dobrego chwytu aby kogos powalic!",false] spawn domsg};
					if(currentWeapon player != "" && currentWeapon player != "Binocular" && currentWeapon player != "Rangefinder") then {
						[cursorTarget] spawn life_fnc_knockoutAction;
						[] spawn life_fnc_AntiSpam2;
					};
				};
			};

			if ((animationState cursorTarget) != "Incapacitated" && life_breakouton == 2 && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed && !life_paintball) then {
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{		
		/*
		if(vehicle player == player && _shift && !(player getVariable ["restrained", false]) && !(player getVariable ["tied", false])) then {
			[] spawn life_fnc_punchsystem;
			_handled = true;
		};
		*/
		if(!_shift && !_alt && !_ctrlKey && !(player getVariable ["restrained", false]) && !(player getVariable ["tied", false])) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
					[] spawn life_fnc_AntiSpam2;
				};
			}
			else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F" OR cursorTarget isKindOf "Motorcycle") && player distance cursorTarget < 7 && isNull objectParent player && !(cursorTarget getVariable["dead",FALSE])) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
						[] spawn life_fnc_AntiSpam2;
					};
				};
			};
		};
	};
	//L Key?
	case 38: 
	{
		if(!_alt && !_ctrlKey) then {  [] call life_fnc_radar; };
	};

	//CAPSLOCK CHECK
	case 58:
	{
		if((player getVariable ["tied", false])) then {
			_handled = true;
		};		
		if((player getVariable ["restrained", false])) then {
			_handled = true;
		};
	};

	//Y Player Menu
	case 21:
	{	
		_stop = false;
		_radios = player call TFAR_fnc_radiosList;
		if(count _radios > 0 && ([(call TFAR_fnc_activeSwRadio),"cg_tabletd"] call TFAR_fnc_isSameRadio) ) then {
			if(life_battery < 1) then {
				if ( !_alt && !_ctrlKey ) then {
					["Slaba bateria. CTRL+Y aby otworzyc menu ekwipunku | ALT+Y aby otworzyc menu z kluczykami | CTRL+8 aby zsynchronizowac", false] spawn doquickmsg; 
					_stop = true;
					_handled = true;
					[] spawn life_fnc_AntiSpam2;
				};
			};	
		};
		if(count _radios == 0) then {
			if( !_alt && !_ctrlKey ) then {
				["Nie masz telefonu. CTRL+Y aby otworzyc menu ekwipunku | ALT+Y aby otworzyc menu z kluczykami | CTRL+8 aby zsynchronizowac", false] spawn doquickmsg; 
				_stop = true;
				_handled = true;
				[] spawn life_fnc_AntiSpam2;
			};
		};

		if(!_alt && _ctrlKey && !dialog && !_stop) then
		{
			createdialog "playerSettings";
		};
		if(_alt && !_ctrlKey && !dialog && !_stop) then
		{
			createdialog "Life_key_management";
		};
		if(!_alt && !_ctrlKey && !dialog && !_stop) then
		{
			[] spawn {
				if(start_up) then {
					player say "startup";
					start_up = false;
					sleep 5;
					start_up = true;
				};
			};
			[] call fnc_opentablet;
			[8] call SOCK_fnc_updatePartial;
		};
	};

	//6 - Surrender
	case 7:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (isNull objectParent player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed && !life_paintball) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", nil, true];
					[] spawn life_fnc_AntiSpam2;
				} else
				{
					[] spawn life_fnc_surrender;
					[] spawn life_fnc_AntiSpam2;
				};
			};
		};
		
		if(_alt) then
		{
			(findDisplay 46) displayAddEventHandler ["MouseZchanged", "_this spawn life_fnc_enableActions"];
			["addActions readded", false] spawn doquickmsg; 
			_handled = true;
		};
		
		if(_ctrlKey) then {
			if (isNull objectParent player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed && !life_paintball) then
			{
				[] spawn life_fnc_middlefinger;
				[] spawn life_fnc_AntiSpam2;
				_handled = true;
			};
	    };
	};




	//8 - Resync Option
	case 9:
	{
		if(!_alt && _ctrlKey && !dialog) then
		{
			[] spawn life_fnc_AntiSpam2;
			[] call SOCK_fnc_syncData;
			_items = uniformItems player;
			player forceAddUniform uniform player;
			{player addItemToUniform _x} foreach _items;
			_vestItems = vestItems player;
			player addVest vest player;
			{player addItemToVest _x} foreach _vestItems;
			_handled = true;
		};
	};
	
	case 1:
	{
		[8] call SOCK_fnc_updatePartial;
		closeDialog 602;
	};

	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(isNull objectParent player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {[localize "STR_House_Door_NotNear", false] spawn doquickmsg; };
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						[localize "STR_House_Door_Lock", false] spawn doquickmsg; 
						[] spawn life_fnc_AntiSpam2;
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						[localize "STR_House_Door_Unlock", false] spawn doquickmsg; 
						[] spawn life_fnc_AntiSpam2;
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8 && (velocity _veh select 2) < 20) then {

					if(_veh getVariable ["parkingTicket2", false]) then {
						_veh setVariable["parkingTicket2",false,true];
						["Otrzymales $1500 mandatu za nieprawidlowe parkowanie!", false] spawn domsg;
						["bank","take", 1500] call life_fnc_handleCash;
					};
					if(_veh getVariable ["parkingTicket", false]) then {
						_veh setVariable["parkingTicket",false,true];
						["Otrzymales $500 mandatu za nieprawidlowe parkowanie!", false] spawn domsg;
						["bank","take", 500] call life_fnc_handleCash;
					};

					if(_locked == 2) then {
						
						if(local _veh) then {
							_veh lock 0;
							[] spawn life_fnc_AntiSpam2;
						} else {
							[_veh,0] remoteExecCall ["life_fnc_lockVehicle",_veh];
							[] spawn life_fnc_AntiSpam2;
						};
						[localize "STR_MISC_VehUnlock", false] spawn doquickmsg; 


						//[_veh,"lockunlock"] spawn life_fnc_nearestSound;
						playSound "lockunlock";
					} else {

						if(local _veh) then {
							_veh lock 2;
							[] spawn life_fnc_AntiSpam2;
						} else {
							[_veh,2] remoteExecCall ["life_fnc_lockVehicle",_veh];
							[] spawn life_fnc_AntiSpam2;
						};	

						[localize "STR_MISC_VehLock", false] spawn doquickmsg; 
						//[player,"CarLocked"] spawn life_fnc_nearestSound;
						playSound "CarLocked";
					};
				};
			};
		};
	};
};

_handled;
