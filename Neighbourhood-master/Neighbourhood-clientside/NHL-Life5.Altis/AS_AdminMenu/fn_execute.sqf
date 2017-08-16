disableSerialization;
_listboxPlayers = (findDisplay 16000) displayCtrl 16001;
_listboxActions = (findDisplay 16000) displayCtrl 16002;

_player = call compileFinal (_listboxPlayers lbData (lbCurSel _listboxPlayers));

if (isNil "AS_godmode") then { // SETUP BASIC VARS
	AS_godmode = false;
};


_vehicles = [
	"B_QuadBike_01_F",
	"C_Hatchback_01_F",
	"C_Offroad_01_F",
	"B_G_Offroad_01_F",
	"C_SUV_01_F",
	"C_Van_01_transport_F",
	"C_Hatchback_01_sport_F",
	"C_Van_01_fuel_F",
	"I_Heli_Transport_02_F",
	"C_Van_01_box_F",
	"I_Truck_02_transport_F",
	"I_Truck_02_covered_F",
	"B_Truck_01_transport_F",
	"B_Truck_01_box_F",
	"O_MRAP_02_F",
	"B_Heli_Light_01_F",
	"O_Heli_Light_02_unarmed_F",
	"C_Rubberboat",
	"C_Boat_Civil_01_F",
	"B_Boat_Transport_01_F",
	"C_Boat_Civil_01_police_F",
	"B_Boat_Armed_01_minigun_F",
	"B_SDV_01_F",
	"B_MRAP_01_F"
];

if ((_listboxActions lbText (lbCurSel _listboxActions)) in _vehicles AND (_listboxActions lbText (lbCurSel _listboxActions)) != "") exitWith
{
	_pos = position player findEmptyPosition [0,50];
	if (count _pos > 0) then {
		closeDialog 0;
		hint "You have spawned a vehicle";
		(_listboxActions lbText (lbCurSel _listboxActions)) createVehicle position player;
	} else { hint "No empty position found at players location"; };
};

switch (_listboxActions lbText (lbCurSel _listboxActions)) do
{
	case "Toggle Godmode":
	{
		if (AS_godmode) then {
			AS_godmode = false;
			player allowDamage true;
			hint "Godmode disabled";
		} else {
			AS_godmode = true;
			player allowDamage false;
			hint "Godmode enabled";
		};
	};

	case "Teleport to Player (Without Vehicle)":
	{
		if (isNil "_player") exitWith {hint "Select a player!";};
		_pos = position _player findEmptyPosition [0,10];
		if (count _pos > 0) then {
			player setPos _pos;
		} else { hint "No empty position found at players location"; };
	};

	case "Teleport to Player (With Vehicle)":
	{
		if (isNil "_player") exitWith {hint "Select a player!";};
		_pos = position _player findEmptyPosition [0,10];
		if (count _pos > 0) then {
			vehicle player setPos _pos;
		} else { hint "No empty position found at players location"; };
	};

	case "Teleport Player to Me (Without Vehicle)":
	{
		if (isNil "_player") exitWith {hint "Select a player!";};
		_pos = position player findEmptyPosition [0,10];
		if (count _pos > 0) then {
			_player setPos _pos;
		} else { hint "No empty position found at players location"; };
	};

	case "Teleport Player to Me (With Vehicle)":
	{
		if (isNil "_player") exitWith {hint "Select a player!";};
		_pos = position player findEmptyPosition [0,10];
		if (count _pos > 0) then {
			vehicle _player setPos _pos;
		} else { hint "No empty position found at players location"; };
	};

	case "Enable Vehicle GodMode":
	{
		if (vehicle player != player) then
		{
			if (isNil {vehicle player getVariable "AS_godmode"}) then {vehicle player setVariable ["AS_godmode",false,true];};
			if (vehicle player getVariable "AS_godmode") then
			{
				vehicle player setVariable ["AS_godmode",false,true];
				vehicle player allowDamage true;
				hint "Disabled Godmode for your vehicle";
			} else {
				vehicle player setVariable ["AS_godmode",true,true];
				vehicle player allowDamage false;
				hint "Enabled Godmode for your vehicle";
			};
		} else { hint"You are not in a vehicle!"; };
	};

	case "Teleport to Maplocation":
	{
		openMap true;AS_wait = true;
		closeDialog 0;
		onMapSingleClick "vehicle player setPos _pos;AS_wait = false;";
		waitUntil {!AS_wait};
		onMapSingleClick "";
		openMap false;
		hint format ["You have teleported yourself to %1",getPos player];
	};

	case "Get Keys of CursorTarget":
	{
		if (!isNull cursorTarget) then {
			life_vehicles set[count life_vehicles,cursorTarget];
		} else {hint "FAILED: Your cursortarget returned nothing.";};
		hint "You now have the keys";
	};

	case "Delete CursorTarget":
	{
		if (!isNull cursorTarget) then {
			deleteVehicle cursorTarget;
			hint "Deleted Vehicle";
		} else {hint "FAILED: Your cursortarget returned nothing.";};
	};

	case "Heal/Repair CursorTarget":
	{
		if (!isNull cursorTarget) then {
			cursorTarget setDamage 0;
			if (cursorTarget isKindOf "LandVehicle") then {cursorTarget setFuel 1;};
				hint "Cursortarget has been healed";
		} else {hint "FAILED: Your cursortarget returned nothing.";};
	};

	case "Kill CursorTarget":
	{
		if (!isNull cursorTarget) then {
			cursorTarget setDamage 1;
			hint "Cursortarget has been killed";
		} else {hint "FAILED: Your cursortarget returned nothing.";};
	};

	case "Revive CursorTarget":
	{
		if (!isNull cursorTarget) then {
			[[name player],"life_fnc_revived", cursorTarget,false] spawn life_fnc_MP;
			hint "Cursortarget has been revived";
		} else {hint "FAILED: Your cursortarget returned nothing.";};
	};

	case "Open Trunk of CursorTarget/Current Vehicle":
	{
		if (vehicle player == player) then {
			if (!isNull cursorTarget) then {
				closeDialog 0;sleep 0.01;[cursorTarget] call life_fnc_openInventory;
				hint "Force opened the inventory of the cursortarget vehicle";
			} else {hint "FAILED: Your cursortarget returned nothing.";};
		} else {
			closeDialog 0;sleep 0.01;[vehicle player] call life_fnc_openInventory;
			hint "Force opened the inventory of your current vehicle";
		};
	};

	case "Force Unlock / Lock CursorTarget/Current Vehicle":
	{
		_veh = objNull;
		if (vehicle player == player) then {
			_veh = cursorTarget;
		} else {
			_veh = vehicle player;
		};
		if (!isNull _veh) then {
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehUnlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehLock";
					};
				};
			};
		} else {hint "FAILED: Your cursortarget returned nothing.";};
	};

	case "Add $100.000":
	{
		life_cash = life_cash + 100000;
	};
	case "Add $1.000.000":
	{
		life_cash = life_cash + 1000000;
	};

	case "Spawn Vehicle":
	{
		lbClear _listboxActions;
		{ _listboxActions lbAdd _x} forEach _vehicles;
		_listboxActions lbAdd "";
		_listboxActions lbAdd "<< BACK";
	};

	case "Spectator Mode":
	{
		closeDialog 0;[player] execVM "AS_AdminMenu\specta.sqf";
	};

	case "Refund":
	{
		if (!isNil "_player") then {
			AS_toRefund = _player;
			closeDialog 0;
			createDialog "AS_Refund";
			hint format ["Please type the amount you want to refund (Selected Player %1",name _player];
		};
	};
	
	case "Unsichtbar":
	{
	
		[player, true] remoteExec ["hideObjectGlobal", 2];
		hint "Du bist nun UNSICHTBAR";
	};
	case "Sichtbar":
	{
	
		[player, false] remoteExec ["hideObjectGlobal", 2];
		hint "Du bist nun SICHTBAR";
	};

	case "REFRESH":
	{
		closeDialog 0;
		[] spawn life_fnc_openMenu;
	};

	case "<< BACK":
	{
		closeDialog 0;
		[] spawn life_fnc_openMenu;
	};
};