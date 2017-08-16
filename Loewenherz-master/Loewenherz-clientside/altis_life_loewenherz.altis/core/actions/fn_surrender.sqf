
/*
    File: fn_surrender.sqf
    Author: Blackd0g

    Description: Causes player to put their hands on their head.
*/
private ["_primaryWeapon","_handgunWeapon","_attachmentsPrimary","_attachmentsHandgun","_dir","_pos","_groundcontainer"];
if ( player getVariable ["restrained",false] ) exitWith {};
if ( player getVariable ["Escorting",false] ) exitWith {};
if ( vehicle player != player ) exitWith {};
if ( speed player > 1 ) exitWith {};

if (player getVariable ["playerSurrender",false]) then {
    player setVariable ["playerSurrender",false,true];
} else {
    player setVariable ["playerSurrender",true,true];

	// Check if player has weapons then drop all weapons on  the ground
	if ((primaryWeapon player != "") or (handgunWeapon player != "")) then {
		_primaryWeapon = primaryWeapon player;
		_handgunWeapon = handgunWeapon player;
		_attachmentsPrimary = primaryWeaponItems player;
		_attachmentsHandgun = handgunItems player;

		// Remove all Weapons and attachments
		player removeweapon _primaryWeapon;
		player removeweapon _handgunWeapon;
		removeAllPrimaryWeaponItems player;
		removeAllHandgunItems player;

		// Hotfix Dupe for P07 Taser
		if(_handgunWeapon == "hgun_P07_snds_F") then {
			_attachmentsHandgun = ["","","",""];
		};

		// Create WeaponHolder and set the pos in front of player
		_dir = getdir player;
		_pos = getposATL player;
		_pos = [(_pos select 0)+0.5*sin(_dir),(_pos select 1)+0.5*cos(_dir), (_pos select 2)];
		_groundcontainer = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
		_groundcontainer setDir _dir;
		_groundcontainer setposATL _pos;

		// Add Weapons
		If (_primaryWeapon != "") then {
		_groundcontainer addWeaponCargoGlobal [_primaryWeapon, 1];
		};
		If (_handgunWeapon != "") then {
		_groundcontainer addWeaponCargoGlobal [_handgunWeapon, 1];
		};

		// Add Attachment Items
		{_groundcontainer addItemCargoGlobal [_x, 1];} forEach _attachmentsPrimary;
		{_groundcontainer addItemCargoGlobal [_x, 1];} forEach _attachmentsHandgun;

	};

};

titleText["Du hast dich ergeben!","PLAIN"];
while {player getVariable ["playerSurrender",false]} do {
    player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
    if (!alive player || (vehicle player) != player) then { player setVariable ["playerSurrender",false,true]; };
};
//[] call LHM_fsm_fnc_surrenderAnim;
player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
titleText["Du nimmst deine Haende wieder runter...","PLAIN"];