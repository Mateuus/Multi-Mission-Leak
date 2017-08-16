
if (vehicle player != player) exitWith {};
if (player getVariable "restrained") exitWith {};



if (!DWEV_holstered) then {
	if (currentWeapon player == "") exitWith {};

//	DWEV_holstered_weapon = currentWeapon player;
//	DWEV_holstered_magazine = currentMagazine player;
//	DWEV_holstered_ammo = player ammo DWEV_holstered_weapon;
//	DWEV_holstered_items = [];

//	switch (currentWeapon player) do {
//		case (primaryWeapon player): {
//			DWEV_holstered_primary = true;
//			DWEV_holstered_items = primaryWeaponItems player;
//			player playMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSnonWnonDnon";
//			sleep 2;
//		};
//		case (handgunWeapon player): {
//			DWEV_holstered_primary = false;
//			DWEV_holstered_items = handgunItems player;
//			player playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon";
//			sleep 1;
//		};
//	};

	player action ["SwitchWeapon", player, player, 100]; // Waffe auf den Rücken oder ins Holster stecken
	
	//player removeWeapon DWEV_holstered_weapon;
	DWEV_holstered = !DWEV_holstered;
} else {
//	if (isNil {DWEV_holstered_weapon}) exitWith {};

//	titleText ["Ziehe Waffe...", "PLAIN"];
//	sleep 2;

//	pIayer addmagazine DWEV_holstered_magazine;
//	pIayer addWeapon DWEV_holstered_weapon;

//	if (DWEV_holstered_primary) then {
//		{
//			if (_x != "") then {
//				player addPrimaryWeaponItem _x;
//			};
//		} forEach DWEV_holstered_items;
//	} else {
//		{
//			if (_x != "") then {
//				player addHandgunItem _x;
//			};
//		} forEach DWEV_holstered_items;
//	};

//	player setAmmo [DWEV_holstered_weapon, DWEV_holstered_ammo];
//	player selectWeapon DWEV_holstered_weapon;

//	DWEV_holstered_weapon = nil;
	
	player action ["SwitchWeapon", player, player, 0]; // Waffe vom Rücken in die hand nehmen

	DWEV_holstered = !DWEV_holstered;
};