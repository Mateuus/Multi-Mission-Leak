/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Key Pressed
*/

private ["_userAction12","_interactionKey","_userAction1","_userAction2","_userAction3","_userAction4","_userAction5","_userAction6","_userAction7","_userAction8","_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt","_abortKeys","_mapKey"];
_ctrl = _this select 0;
_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;
if(isNil "DS_lockKeys")then{DS_lockKeys = false};
if(DS_lockKeys)exitwith{};
_abortKeys = [17,19,30,31,32,45,44,42,18,16];
_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_userAction1 = (actionKeys "User1") select 0;
_userAction2 = (actionKeys "User2") select 0;
_userAction3 = (actionKeys "User3") select 0;
_userAction4 = (actionKeys "User4") select 0;
_userAction5 = (actionKeys "User5") select 0;
_userAction6 = (actionKeys "User6") select 0;
_userAction7 = (actionKeys "User7") select 0;
_userAction8 = (actionKeys "User8") select 0;
_userAction9 = (actionKeys "User9") select 0;
_userAction10 = (actionKeys "User11") select 0;
_userAction11 = (actionKeys "User12") select 0;
_userAction12 = (actionKeys "User13") select 0;
_userAction13 = (actionKeys "User14") select 0;
_userAction14 = (actionKeys "User15") select 0;
_userAction15 = (actionKeys "User16") select 0;
_userAction16 = (actionKeys "User17") select 0;
_mapKey = actionKeys "ShowMap" select 0;
if((DS_doingStuff)&&(_dikCode in _abortKeys))then
	{
	DS_moved = true;
	}
	else
	{
	DS_moved = false;
	};
if((_dikCode in _abortKeys)&&((player getVariable["cuffed",FALSE])||(player getVariable["Escorted",FALSE])||(player getVariable["cuffedVeh",FALSE])))then {_handled = true;};
if (_dikCode in (actionKeys "TacticalView")) then
{
	_handled = true;
};

switch(_dikCode)do
	{
	case _userAction1:
		{
		[0] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction2:
		{
		[1] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction3:
		{
		[2] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction4:
		{
		[3] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction5:
		{
		[4] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction6:
		{
		[5] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction7:
		{
		[6] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction8:
		{
		[7] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction9:
		{
		[8] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction10:
		{
		[9] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction11:
		{
		[10] spawn DS_fnc_hotKeys;
		_handled = true;
		};
	case _userAction12:
		{
		[DS_cursorTarget] spawn DS_cop_unescortCiv;
		_handled = true;
		};
	case _mapKey:
		{
		((findDisplay 12) displayCtrl 51) mapCenterOnCamera true;
		[] spawn DS_fnc_vehGPS;
		switch(playerside)do
			{
			case west:
				{
				if(DS_copMapMarkers)then
					{
					[] spawn DS_cop_markers;
					}
					else
					{
					hint "Police map markers are currently deactivated - Press F5 and reopen your map to activate them";
					};
				};
			case civilian:
				{
				[] spawn DS_civ_markers;
				};
			};
		if(player getVariable ["security",false])then
			{
			[] spawn DS_sec_markers;
			};
		if(player getVariable ["medic",false])then
			{
			[] spawn DS_med_medicMarkers;
			};
		if(player getVariable ["mechanic",false])then
			{
			[] spawn DS_mech_mechanicMarkers;
			};
		};
	case 49://N Key //Disable Thermal and NV for fuelDart
	{
		if(currentWeapon player == "launch_B_Titan_short_F") then
			{
			_handled = true;
			};
		/*
		if((_ctrlKey)&&((((vehicle player) getVariable ["nitro",0]) > 0))||(playerside == west)||(player getVariable ["security",false]))then
			{
			[] spawn DS_fnc_activateNitro;
			};
		*/
	};
	case 8://7 Key
		{
		[] spawn DS_fnc_moneyInfo;
		_handled = true;
		};
	case 9:	//8 key - Test Server
		{
		if((getPlayerUID player) in DS_adminlist5)then
			{
			if((!_shift)&&(!_ctrlKey))then
				{
				[0] spawn DS_fnc_testing;
				};
			if((isServer)&&(!_shift)&&(!_ctrlKey))then
				{
				[] spawn DS_mech_mechRepairBuildings;
				//[cursorTarget] execVM "test.sqf";
				};
			if(_shift)then
				{
				[2] spawn DS_fnc_testing;
				}
			};
			_handled = true;
		};
	case 11://0 Key?
		{
		if((playerside == west)||(player getVariable ["security",false]))then
			{
			[DS_openGate] spawn DS_cop_barGates;
			_handled = true;
			};
		};
	case 3://2 Key + Shift
		{
		if((_shift)&&(currentWeapon player == "launch_B_Titan_short_F")) then
			{
			[] spawn DS_cop_fuelDart;
			_handled = true;
			};
		if(_ctrlKey)then
			{
			if((playerside == west)||(player getVariable ["security",false]))then
				{
				[2] spawn DS_cop_policeSounds;
				_handled = true;
				};
			};
		if((!_shift)&&(!_ctrlKey))then
			{
			[] spawn DS_fnc_quickPhone;
			_handled = true;
			};
		};
	case 10://9 Key
		{
		closeDialog 0;
		createDialog "bugMenu";
		_handled = true;
		};
	case 4://3 Key + Shift
		{
		if(_shift)then
			{
			[] spawn DS_cop_cleanUpWeapon;
			_handled = true;
			};
		if(_ctrlKey)then
			{
			if((playerside == west)||(player getVariable ["security",false]))then
				{
				[3] spawn DS_cop_policeSounds;
				_handled = true;
				};
			};
		if((!_shift)&&(!_ctrlKey))then
			{
			DS_cursorTarget = cursorTarget;
			[false] spawn DS_fnc_menuPhone;
			_handled = true;
			};
		};
	case 41:
		{
		if(!DS_tags)then
			{
			[] spawn DS_fnc_requestTag;
			};
		};
	case 2://1 key
		{
		if(_ctrlKey)then
			{
			if((playerside == west)||(player getVariable ["security",false]))then
				{
				[1] spawn DS_cop_policeSounds;
				_handled = true;
				};
			}
			else
			{
			[] call DS_fnc_quickDisplay;
			/*
			if(isServer)then
				{
				[]execVM "test.sqf";
				};
			*/
			};
		_handled = true;
		};
	case 5://4 key
		{
		if(((playerside) == west)||(player getVariable ["security",false])) then
			{
			[] call DS_cop_wantedlist;
			_handled = true;
			};
		};
	case 6://5 key
		{
		if((playerside) == west) then
			{
			[] call DS_cop_setwanted;
			_handled = true;
			};
		};
	case 7://6 key
		{
		if((playerside) == west) then
			{
			[] call DS_cop_martiallaw;
			_handled = true;
			};
		if(player getVariable ["security",false]) then
			{
			[] call DS_sec_shopInfo;
			_handled = true;
			};
		};
	case _interactionKey:
		{
		[] call DS_fnc_masterActionKey;
		_handled = true;
		};
	case 21://Y Player menu
		{
		[] call DS_fnc_menuPlayer;
		_handled = true;
		};
	case 22://U unlock
		{
		_pods = ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F",
				"B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"]; 
		if((player getVariable["cuffed",FALSE])||(player getVariable["Escorted",FALSE])||(player getVariable["cuffedVeh",FALSE]))exitwith{_handled = true;};
		if(((vehicle player)isKindOf "Car")||((vehicle player) isKindOf "Air")||((vehicle player) isKindOf "Ship")||(typeOf (vehicle player) in _pods))exitwith
			{
			[] call DS_fnc_unlock;
			_handled = true;
			};
		if((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")||(typeOf cursorTarget in _pods))exitwith
			{
			[] call DS_fnc_unlock;
			_handled = true;
			};
		/*
		if((typeOf cursorTarget == "Land_Net_Fence_Gate_F")&&(cursorTarget in DS_keyRing)&&(player distance cursorTarget < 10)&&((playerside == west)||(player getVariable ["security",false])))exitwith
			{
			_lockedState = cursorTarget getVariable [format["bis_disabled_door_%1",_door],0];
			if(_lockedState == 0)then
				{
				cursorTarget setVariable[format["bis_disabled_door_%1",_door],1,true];
				cursorTarget animate [format["door_%1_rot",_door],0];
				systemchat "Gate locked";
				}
				else
				{
				cursorTarget setVariable[format["bis_disabled_door_%1",_door],0,true];
				cursorTarget animate [format["door_%1_rot",_door],1];
				systemchat "Gate unlocked";
				};
			};
		*/
		if((cursorTarget isKindOf "House_F")&&(cursorTarget in DS_keyRing)&&(player distance cursorTarget < 10))exitwith
			{
			[cursorTarget] call DS_civ_houseUnlock;
			_handled = true;
			};
		};
	case 23://I
		{
		if((player getVariable["cuffed",FALSE])||(player getVariable["Escorted",FALSE])||(player getVariable["cuffedVeh",FALSE]))exitwith{_handled = true;};
		};
	case 20://T Boot
		{
		_pods = ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F",
				"B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"]; 
		if((player getVariable["cuffed",FALSE])||(player getVariable["Escorted",FALSE])||(player getVariable["cuffedVeh",FALSE]))exitwith {_handled = true;};
		if(((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")||(typeOf cursorTarget in _pods))&&(cursorTarget in DS_keyRing)&&(player distance cursorTarget < 7))exitwith
			{
			[cursorTarget] call DS_fnc_menuBoot;
			_handled = true;
			};
		if((((vehicle player) isKindOf "Car")||((vehicle player) isKindOf "Air")||((vehicle player) isKindOf "Ship")||(typeOf (vehicle player) in _pods))&&((vehicle player) in DS_keyRing))exitwith
			{
			[(vehicle player)] call DS_fnc_menuBoot;
			_handled = true;
			};
		/*
		if((cursorTarget isKindOf "House_F")&&(cursorTarget in DS_keyRing)&&(player distance cursorTarget < 7))exitwith
			{
			[cursorTarget] call DS_civ_houseStorage;
			_handled = true;
			};
		*/
		};
	case 5://Gang Menu(Civ)
		{
		if(playerside == civilian)then
			{
			closeDialog 0;
			[]spawn DS_civ_menuGangList;
			_handled = true;
			};
		};
	case 6://Gang Menu(Civ)
		{
		if(playerside == civilian)then
			{
			closeDialog 0;
			[]spawn DS_civ_openGangMenu;
			_handled = true;
			};
		};
	case 57://Jumping
		{
		if((player != (vehicle player))&&(driver (vehicle player) == player)&&(!((vehicle player) isKindOf "Air"))&&(speed (vehicle player) > 10)&&((((vehicle player) getVariable ["nitro",0]) > 0)||(playerside == west)||(player getVariable ["medic",false])||(player getVariable ["security",false])))then
			{
			_handled = true;
			[] spawn DS_fnc_activateNitro;
			};
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "5"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!DS_jailed} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
 			jumpActionTime = time; //Update the time.
  			[player,true] spawn DS_fnc_jump;
			[[player],"DS_fnc_jump",nil,FALSE] call DS_fnc_MP;
			_handled = true;
			};
		};
	case 59://Shift + F1 = Surrender
		{
			if((_shift)&&(vehicle player == player)) then
			{
				[] spawn DS_fnc_handsUp;
				_handled = true;
			};
		};
	case 60://F2 (Police check status)
		{
			if(playerside == west) then
			{
				[] spawn DS_cop_checkTaskActions;
				_handled = true;
			};
		};
	case 61://F3 Earplugs
		{
		DS_earPlugs = !DS_earPlugs;
		[] spawn DS_fnc_earPlugs;
		_handled = true;
		};
	case 64://F6 Animation
		{
			if(((vehicle player) != player)||(player getVariable ["cuffed",false])||(player getVariable ["ziptied",false])||(DS_jailed))exitwith{hint "Can't do this while in a vehicle, restrained or in jail"}then
				{}
				else
				{
				player switchMove "";
				DS_donorUsed1 = false;
				};
		};
	case 62://F4 Earplugs
		{
			if((!_shift)&&(playerside == west)||((player getVariable ["security",false])&&(DS_wlLevel > 2)))then
				{
				[] spawn DS_cop_switchFireType;
				_handled = true;
				};
		};
	case 63://Police markers
		{
			if(playerside == west)then
				{
				if(!DS_copMapMarkers)then
					{
					hint "Police map markers activated";
					DS_copMapMarkers = true;
					}
					else
					{
					hint "Police map markers deactivated";
					DS_copMapMarkers = false;
					};
				_handled = true;
				};
		};
	case 19://Shift + R restrain
		{
		if((playerside == west)&&(_shift)&&(!isNull cursorTarget)&&(cursorTarget isKindOf "Man")&&(isPlayer cursorTarget)&&(side cursorTarget in [civilian,independent])&&(alive cursorTarget)&&(cursorTarget distance player < 7)&&(!(cursorTarget getVariable ["Escorted",false]))&&(!(cursorTarget getVariable ["cuffed",false]))&&(speed cursorTarget < 1)&&(((animationState cursorTarget) == "Incapacitated")||(cursorTarget getVariable ["surrender",false])||(animationState cursorTarget == "AinjPfalMstpSnonWnonDf_carried_fallwc"))) then
			{
			[] call DS_cop_restrain;
			_handled = true;
			};
		if((player getVariable ["security",false])&&(_shift)&&(!isNull cursorTarget)&&(cursorTarget isKindOf "Man")&&(isPlayer cursorTarget)&&(side cursorTarget in [civilian,independent])&&(alive cursorTarget)&&(cursorTarget distance player < 7)&&(!(cursorTarget getVariable ["Escorted",false]))&&(!(cursorTarget getVariable ["cuffed",false]))&&(speed cursorTarget < 1)&&(((animationState cursorTarget) == "Incapacitated")||(cursorTarget getVariable ["surrender",false])||(animationState cursorTarget == "AinjPfalMstpSnonWnonDf_carried_fallwc"))) then
			{
			[] call DS_cop_restrain;
			_handled = true;
			};
		if((playerside == civilian)&&(_shift)&&(!isNull cursorTarget)&&(cursorTarget isKindOf "Man")&&(isPlayer cursorTarget)&&(alive cursorTarget)&&(cursorTarget distance player < 7)&&(!(cursorTarget getVariable ["ziptied",false]))&&(!(cursorTarget getVariable ["Escorted",false]))&&(!(cursorTarget getVariable ["cuffed",false]))&&(speed cursorTarget < 1)&&(((animationState cursorTarget) == "Incapacitated")||(cursorTarget getVariable ["surrender",false])||(animationState cursorTarget == "AinjPfalMstpSnonWnonDf_carried_fallwc"))) then
			{
			[] call DS_civ_restrain;
			_handled = true;
			};
		if(_shift)then{_handled = true};
		};
	case 15://Tab - Mining etc
		{
			if((playerside == civilian)&&(!DS_mining))then
				{
				_drugArray = ["weedField","cocaineField","heroinfield"];
				_miningArray = ["oil","diamond","copper","rock","salt","iron","sand","oil2","wood","wheat"];
				_relicArray = ["relic1","relic2","relic3","relic6"];
				_fruitArray = ["apple1","apple2","apple3","apple4","peach1","peach2","peach3","peach4"];
					{
					if(player distance (getMarkerPos _x) < 40)then
						{
						[] spawn DS_civ_mining;
						_handled = true;
						};
					}forEach _miningArray;
					{
					if(player distance (getMarkerPos _x) < 40)then
						{
						[] spawn DS_civ_plantDrugs;
						_handled = true;
						};
					}forEach _drugArray;
					{
					if(player distance (getMarkerPos _x) < 40)then
						{
						[] spawn DS_civ_relicMining;
						_handled = true;
						};
					}forEach _relicArray;
					{
					if(player distance (getMarkerPos _x) < 40)then
						{
						[] spawn DS_civ_pickFruit;
						_handled = true;
						};
					}forEach _fruitArray;
				};
		};
	case 18://E Key
		{
		if((DS_tazed)||(player getVariable["cuffed",FALSE])||(player getVariable["Escorted",FALSE])||(player getVariable["cuffedVeh",FALSE])) exitwith {_handled = true;};
		private ["_vcl","_range","_dirV","_pos","_posFind","_vcls","_vcl","_locked"];
		for [{_i=1}, {_i < 3}, {_i=_i+1}] do 
			{
			_range   = _i;
			_dirV    = vectorDir vehicle player;
			_pos     = player modelToWorld [0,0,0];
			_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
			_vcls    = nearestobjects [_posFind,["LandVehicle", "Air", "Ship","Tank"], 5];
			_vcl     = _vcls select 0;
			if(!(isnull _vcl))exitwith{_i = 4};
			};
		_locked = locked _vcl;
		if((_vcl in DS_keyRing)||(_locked == 0)||(playerside == west))then
			{
				if((playerside == west)||(player getVariable ["Security",false]))then
					{
					if((_shift)&&(_locked != 0))then
						{
						if(_vcl emptyPositions "Driver" > 0)exitwith   {[_vcl,true] spawn DS_fnc_vehDoors;_vcl lock false;player action ["getInDriver", _vcl];_vcl lock true;};
						if(_vcl emptyPositions "Cargo" > 0)exitwith  {[_vcl,false] spawn DS_fnc_vehDoors;_vcl lock false;player action ["getInCargo", _vcl];_vcl lock true;};
						if(_vcl emptyPositions "Gunner" > 0)exitwith   {[_vcl,false] spawn DS_fnc_vehDoors;_vcl lock false;player action ["getInGunner", _vcl];_vcl lock true;};
						if(_vcl emptyPositions "Commander" > 0)exitwith{[_vcl,false] spawn DS_fnc_vehDoors;_vcl lock false;player action ["getInCommander", _vcl];_vcl lock true;};
						};
					if((!_shift)&&(_locked == 0))then
						{
						if(_vcl emptyPositions "Driver" > 0)exitwith   {[_vcl,true] spawn DS_fnc_vehDoors;_vcl lock false;player action ["getInDriver", _vcl];_vcl lock true;};
						if(_vcl emptyPositions "Cargo" > 0)exitwith  {[_vcl,false] spawn DS_fnc_vehDoors;_vcl lock false;player action ["getInCargo", _vcl];_vcl lock true;};
						if(_vcl emptyPositions "Gunner" > 0)exitwith   {[_vcl,false] spawn DS_fnc_vehDoors;_vcl lock false;player action ["getInGunner", _vcl];_vcl lock true;};
						if(_vcl emptyPositions "Commander" > 0)exitwith{[_vcl,false] spawn DS_fnc_vehDoors;_vcl lock false;player action ["getInCommander", _vcl];_vcl lock true;};
						};
					}
					else
					{
					if(_vcl emptyPositions "Driver" > 0)exitwith   {[_vcl,true] spawn DS_fnc_vehDoors;player action ["getInDriver", _vcl]};
					if(_vcl emptyPositions "Cargo" > 0)exitwith  {[_vcl,false] spawn DS_fnc_vehDoors;player action ["getInCargo", _vcl];};
				    if(_vcl emptyPositions "Gunner" > 0)exitwith   {[_vcl,false] spawn DS_fnc_vehDoors;player action ["getInGunner", _vcl]};
				    if(_vcl emptyPositions "Commander" > 0)exitwith{[_vcl,false] spawn DS_fnc_vehDoors;player action ["getInCommander", _vcl]};
				    };
			};
		};
	case 33://F Key
		{    
		 if((playerSide == west)&&(vehicle player != player)&&(((driver vehicle player) == player)))then
            {
			if(DS_usedSiren)exitwith{};
			if((vehicle player) getVariable ["siren",false])then
				{
				titleText ["Siren Off","PLAIN"];
				[true] spawn DS_fnc_siren;
				}
				else
				{
				titleText ["Siren On","PLAIN"];
				(vehicle player) setVariable ["siren",true,true];
				[] spawn DS_fnc_siren;
				};
				_handled = true;
            };
		if((player getVariable ["medic",false])&&(vehicle player != player)&&(((driver vehicle player) == player)))then
            {
			if(DS_usedSiren)exitwith{};
			if((vehicle player) getVariable ["siren",false])then
				{
				titleText ["Siren Off","PLAIN"];
				[true] spawn DS_fnc_siren;
				}
				else
				{
				titleText ["Siren On","PLAIN"];
				(vehicle player) setVariable ["siren",true,true];
				[] spawn DS_fnc_siren;
				};
				_handled = true;
			/*
			
                [] spawn
					{
                    DS_sirenActive = true;
                    sleep 1.2;
                    DS_sirenActive = false;
					};
                _veh = vehicle player;
                if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
                if((_veh getVariable "siren")) then
					{
                    titleText ["Siren Off","PLAIN"];
                    _veh setVariable["siren",false,true];
					}
                    else
					{
                    titleText ["Siren On","PLAIN"];
                    _veh setVariable["siren",true,true];
                    [[_veh],"DS_med_Medicsiren",nil,true] spawn BIS_fnc_MP;
					};
			*/
            };
		};
	case 38://L key
		{
		if((_ctrlKey)&&(playerside == west)&&((vehicle player) != player))then
			{
			[] spawn DS_cop_radarInfo;
			_handled = true;
			};
		if((_ctrlKey)&&(playerside == civilian))then
			{
			_gangName = (group player) getVariable ["gangName",""];
			if((_gangName != "")&&((DS_infoArray select 15) > 27))then
				{
				[] spawn DS_civ_gangLock;
				};
			_handled = true;
			};
		if((_shift)&&(playerside == west))then
			{
			_sirenVehicles = ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Truck_01_mover_F","O_G_Offroad_01_armed_F","O_MRAP_02_F","I_MRAP_03_F"];
			if((vehicle player != player)&&(typeOf (vehicle player) in _sirenVehicles))then
				{
				_handled = true;
				[(vehicle player)] call DS_fnc_lights;
				};
			};
		if((_shift)&&(player getVariable ["medic",false])) then 
			{
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Van_01_box_F","I_Heli_light_03_F","B_Heli_Light_01_F"]) then 
				{
				if(!isNil {vehicle player getVariable ["sirens",false]}) then 
					{
					[vehicle player] call DS_med_sirenLightsmedic;
					_handled = true;
					};
				};
			};
		if((_shift)&&(player getVariable ["mechanic",false])) then 
			{
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_Truck_01_mover_F"]) then 
				{
				if(!isNil {vehicle player getVariable "sirens"}) then 
					{
					[vehicle player] call DS_mech_sirenLightsmech;
					_handled = true;
					};
				};
			};
		};
		
	case 47://V Key
		{
		if((player getVariable["cuffed",FALSE]) OR (player getVariable["Escorted",FALSE]) OR (player getVariable["cuffedVeh",FALSE])) exitwith {_handled = true;};
		if(((playerside == west)||(player getVariable ["Security",false]))&&((vehicle player) isKindOf "Car")&&(speed (vehicle player) < 2))then
		{
			_vehicle = (vehicle player);
			if(driver _vehicle == player)then
				{
				[_vehicle,true] spawn DS_fnc_vehDoors;
				}
				else
				{
				[_vehicle,false] spawn DS_fnc_vehDoors;
				};
			_vehicle engineOn false;
			player action ["Eject", _vehicle];
			_handled = true;
		};
		};
		
	case 35://H Key
		{
			if((_shift)&&(!_ctrlKey)&&(currentWeapon player != ""))then 
				{
				DS_curWep_h = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
				player switchcamera cameraView;
				};
			
			if((!_shift)&&(_ctrlKey)&&(!isNil "DS_curWep_h")&&({(DS_curWep_h != "")}))then 
				{
				if(DS_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then 
					{
					player selectWeapon DS_curWep_h;
					};
				};
		};
	case 34:
	{
		if((player getVariable["cuffed",FALSE]) OR (player getVariable["Escorted",FALSE]) OR (player getVariable["cuffedVeh",FALSE])) then {_handled = true;};
		if((_shift)&&(!isNull cursorTarget)&&(cursorTarget isKindOf "Man")&&(isPlayer cursorTarget)&&(alive cursorTarget)&&(cursorTarget distance player < 4)&&(speed cursorTarget < 1))then
		{
		_handled = true;
			if(((vehicle player) == player)&&((animationState cursorTarget) != "Incapacitated")&&((currentWeapon player == primaryWeapon player)||(currentWeapon player == handgunWeapon player))&&(currentWeapon player != "")&&(!DS_knockout)&&(!(player getVariable["cuffed",false]))&&(!DS_tazed))exitwith
			{
				[cursorTarget] spawn DS_fnc_smack;
			};
		};
		if(_shift)then{_handled = true};
	};
	};

	
_handled; 
