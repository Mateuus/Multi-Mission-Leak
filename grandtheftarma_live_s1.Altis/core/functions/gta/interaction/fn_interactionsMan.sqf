/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_object", "_interactions", "_items"];
_object = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_interactions = [];

//--- Error checks
if (_object == player) exitWith {_interactions};
if (player distance _object > 3) exitWith {_interactions};
if !(isPlayer player) exitWith {_interactions};

//--- Assigned items and items
_items = assignedItems _object + items _object;
if (alive _object) then {
  if (group player == _object getVariable ["restrained_group", group player]) then {
    //--- Unrestrain
    _interactions pushBack ["Unrestrain", {[_this, player, false] call GTA_fnc_restrain}, 11];
  };

	//--- Revive
	if (_object getVariable ["incapacitated", false]) exitWith {
		//--- Paramedic revive
		if ([] call GTA_fnc_isMedic) then {
			_interactions pushBack ["Revive", GTA_fnc_reviveUnit, 14, "Medikit" in items player, "Requires a Medikit"];
		};

		//--- Cannibal perk
		if (["blood_donor"] call GTA_fnc_hasPerk) then {
			_interactions pushBack ["Transfuse Blood", GTA_fnc_reviveTransfuseBlood, 13, "FirstAidKit" in items player, "Requires a First Aid Kit"];
		};

		//--- Cannibal perk
		if (["cannibal"] call GTA_fnc_hasPerk) then {
			_interactions pushBack ["Cannibalise", GTA_fnc_cannibaliseCorpse, 12];
		};
	};

	//--- Can restrain
	if (playerSide == west || {playerSide == civilian && {license_civ_rebel || license_civ_advrebel || ["bounty_hunter"] call GTA_fnc_hasPerk}}) then {
		//--- License check + ticket (West)
		if (playerSide == west && {isPlayer _object} && {side group _object != west}) then {
			//--- Check licenses
			_interactions pushBack ["Check Licenses", {[[player], "life_fnc_licenseCheck", _this] call GTA_fnc_remoteExec}, 8];

			//--- Ticket
			_interactions pushBack ["Ticket", life_fnc_ticketAction, 7];
		};

		//--- Restrained
		if (_object getVariable ["restrained", false]) then {
			//--- Is retrained by same side
			if (group player == _object getVariable ["restrained_group", group player]) then {
				//--- Escort
				if (_object getVariable ["escorting", false]) then {
					_interactions pushBack ["Stop Escorting", life_fnc_stopEscorting, 10];
				} else {
					_interactions pushBack ["Escort", life_fnc_escortAction, 10];
				};

				//--- Put in Vehicle
				_interactions pushBack ["Put in Vehicle", life_fnc_putInCar, 9, count nearestObjects [player call GTA_fnc_getPos3D, ["Car", "Ship", "Submarine", "Air"], 8] > 0, "Requires a nearby vehicle"];

        //--- Inventory
        if (["GTA_milRank", 0] call GTA_fnc_getConstant >= 3 || {["GTA_copRank", 0] call GTA_fnc_getConstant >= 6} || {license_civ_advrebel}) then {
          _interactions pushBack ["Inventory", {player action ["Gear", _this]}, 5];
        };

				//--- Seize Communications
				if ("ItemRadio" in _items || "ItemGPS" in _items) then {
					_interactions pushBack ["Seize Communications", {[[], "GTA_fnc_seizeCommunications", _this] call GTA_fnc_remoteExec}, 4];
				};

				//--- Seize Mask
				if ([_object] call GTA_fnc_isMasked) then {
					_interactions pushBack ["Seize Mask", {[[], "GTA_fnc_seizeMask", _this] call GTA_fnc_remoteExec}, 3];
				};

				//--- Search and seize (West)
				if (playerSide == west) then {
					//--- Search
					_interactions pushBack ["Search", {[0, _this] call GTA_fnc_searchPlayer}, 6];

					//--- Seize Weapons
					_interactions pushBack ["Seize Weapons", {[[], "GTA_fnc_seizeWeapons", _this] call GTA_fnc_remoteExec}, 2];

					//--- Seize Money
					if ("GTA_copRank" call GTA_fnc_const >= 7 || {"GTA_milRank" call GTA_fnc_const >= 4}) then {
						_interactions pushBack ["Seize Money", {[0, _this] call GTA_fnc_seizeMoney}, 1];
					};
				};

				//--- Send to jail
				if (playerSide == west || {["bounty_hunter"] call GTA_fnc_hasPerk}) then {
					//--- Send to Jail
					if (
            player distance getMarkerPos "spawn_cop_1" < 30
						|| {player distance getMarkerPos "spawn_cop_2" < 30}
						|| {player distance getMarkerPos "spawn_cop_3" < 30}
						|| {player distance getMarkerPos "spawn_cop_4" < 30}
						|| {player distance getMarkerPos "spawn_cop_5" < 30}
						|| {player distance getMarkerPos "spawn_cop_6" < 30}
						|| {player distance getMarkerPos "spawn_cop_7" < 30}
						|| {player distance getMarkerPos "prison" < 30}
          ) then {
						_interactions pushBack ["Send to Jail", life_fnc_gtaArrestAction, 0];
					};
				};
			};
		};
	};
};

_interactions
