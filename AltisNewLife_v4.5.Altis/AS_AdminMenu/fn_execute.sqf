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
	"B_MRAP_01_F",
	"O_G_Offroad_01_F",
	"O_Truck_03_transport_F",
	"O_Truck_03_covered_F",
	"O_Truck_03_ammo_F",
	"O_Truck_03_device_F",
	"O_MRAP_02_F",
	"I_Heli_light_03_unarmed_F",
	"I_Heli_Transport_02_F",
	"O_Heli_Transport_04_F",
	"O_Heli_Transport_04_bench_F",
	"O_Heli_Transport_04_covered_F",
	"O_Heli_Transport_04_box_F",	
	"I_MRAP_03_F",
	"O_G_Offroad_01_armed_F",
	"I_G_Offroad_01_armed_F",
	"B_G_Offroad_01_armed_F",
	"B_Heli_Transport_03_unarmed_green_F",
	"B_Heli_Attack_01_F",
	"O_Heli_Attack_02_F",
	"B_Heli_Transport_01_camo_F"	
];

if ((_listboxActions lbText (lbCurSel _listboxActions)) in _vehicles AND (_listboxActions lbText (lbCurSel _listboxActions)) != "") exitWith
{
	_pos = position player findEmptyPosition [0,50];
	if (count _pos > 0) then {
		closeDialog 0;
		hint "Vous avez fait spawn un véhicule";
		(_listboxActions lbText (lbCurSel _listboxActions)) createVehicle position player;
	} else { hint "Pas de place a cote de vous"; };
};

switch (_listboxActions lbText (lbCurSel _listboxActions)) do
{
	case "Basculer en GodMode":
	{
		if (AS_godmode) then {
			AS_godmode = false;
			player allowDamage true;
			hint "Godmode off";
		} else {
			AS_godmode = true;
			player allowDamage false;
			hint "Godmode on";
		};
	};

	case "Tp sur le joueur (sans vehicule)":
	{
		if (isNil "_player") exitWith {hint "Selectionner un joueur !";};
		_pos = position _player findEmptyPosition [0,10];
		if (count _pos > 0) then {
			player setPos _pos;
		} else { hint "Pas de place a cote du joueur !"; };
	};

	case "Tp sur le joueur (avec vehicule)":
	{
		if (isNil "_player") exitWith {hint "Selectionner un joueur !";};
		_pos = position _player findEmptyPosition [0,10];
		if (count _pos > 0) then {
			vehicle player setPos _pos;
		} else { hint "Pas de place a cote du joueur !"; };
	};

	case "Tp le joueur (sans vehicule)":
	{
		if (isNil "_player") exitWith {hint "Selectionner un joueur !";};
		_pos = position player findEmptyPosition [0,10];
		if (count _pos > 0) then {
			_player setPos _pos;
		} else { hint "Pas de place a cote du joueur !"; };
	};

	case "Tp le joueur (avec vehicule)":
	{
		if (isNil "_player") exitWith {hint "Selectionner un joueur !";};
		_pos = position player findEmptyPosition [0,10];
		if (count _pos > 0) then {
			vehicle _player setPos _pos;
		} else { hint "Pas de place a cote du joueur !"; };
	};

	case "Activer le GodMode Vehicule":
	{
		if (vehicle player != player) then
		{
			if (isNil {vehicle player getVariable "AS_godmode"}) then {vehicle player setVariable ["AS_godmode",false,true];};
			if (vehicle player getVariable "AS_godmode") then
			{
				vehicle player setVariable ["AS_godmode",false,true];
				vehicle player allowDamage true;
				hint "Déactiver le GodMode vehicule";
			} else {
				vehicle player setVariable ["AS_godmode",true,true];
				vehicle player allowDamage false;
				hint "Activer le GodMode vehicule";
			};
		} else { hint"Tu n'es pas dans un vehicule !"; };
	};

	case "Tp depuis la map":
	{
		openMap true;AS_wait = true;
		closeDialog 0;
		onMapSingleClick "vehicle player setPos _pos;AS_wait = false;";
		waitUntil {!AS_wait};
		onMapSingleClick "";
		openMap false;
		hint format ["Vous vous etes teleporter a %1",getPos player];
	};

	case "Avoir les cles de la cible":
	{
		if (!isNull cursorTarget) then {
			life_vehicles set[count life_vehicles,cursorTarget];
		} else {hint "ECHEC: Pas de cible trouvée.";};
		hint "Vous avez maintenant les clés";
	};

	case "Effacer la cible":
	{
		if (!isNull cursorTarget) then {
			deleteVehicle cursorTarget;
			hint "Cible effacée";
		} else {hint "ECHEC: Pas de cible trouvée.";};
	};

	case "Soigner/Reparer la cible":
	{
		if (!isNull cursorTarget) then {
			cursorTarget setDamage 0;
			if (cursorTarget isKindOf "LandVehicle") then {cursorTarget setFuel 1;};
				hint "Cible soignée";
		} else {hint "ECHEC: Pas de cible trouvée.";};
	};

	case "Tuer la cible":
	{
		if (!isNull cursorTarget) then {
			cursorTarget setDamage 1;
			hint "Cible tuée";
		} else {hint "ECHEC: Pas de cible trouvée.";};
	};

	case "Ressusciter la cible":
	{
		if (!isNull cursorTarget) then {
			[[name player],"life_fnc_revived", cursorTarget,false] spawn life_fnc_MP;
			hint "Cible réssuscitée";
		} else {hint "ECHEC: Pas de cible trouvée.";};
	};

	case "Ouvrir coffre":
	{
		if (vehicle player == player) then {
			if (!isNull cursorTarget) then {
				closeDialog 0;uiSleep 0.01;[cursorTarget] call life_fnc_openInventory;
				hint "Force l'ouverture du coffre de la cible";
			} else {hint "ECHEC: Pas de cible trouvée.";};
		} else {
			closeDialog 0;uiSleep 0.01;[vehicle player] call life_fnc_openInventory;
			hint "Force l'ouverture du coffre du vehicule";
		};
	};

	case "Force Verrouiller/Deverouiller":
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
		} else {hint "ECHEC: Pas de cible trouvée.";};
	};
	case "Spawn Vehicule":
	{
		lbClear _listboxActions;
		{ _listboxActions lbAdd _x} forEach _vehicles;
		_listboxActions lbAdd "";
		_listboxActions lbAdd "<< RETOUR";
	};

	case "Mode spectateur":
	{
		closeDialog 0;[player] execVM "AS_AdminMenu\specta.sqf";
	};

	case "Rembourser":
	{
		if (!isNil "_player") then {
			AS_toRefund = _player;
			closeDialog 0;
			createDialog "AS_Refund";
			hint format ["Merci de choissir le montant (Joueur selectionné : %1)",name _player];
		};
	};

	case "RAFRAICHIR":
	{
		closeDialog 0;
		[] spawn life_fnc_openMenu;
	};

	case "<< RETOUR":
	{
		closeDialog 0;
		[] spawn life_fnc_openMenu;
	};
};