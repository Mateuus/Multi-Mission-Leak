/*

	Author Shinji
	Es wird immer Trolle geben... -.-'

*/
waffenschein_best = false;
waffen_lizenz = true;

while { waffen_lizenz } do { 

	if ( (player distance (getmarkerpos "waffenschein_lizenzs")) > 7) exitwith { waffen_lizenz = false;};
	if ( !alive player) exitwith {waffen_lizenz = false;};
	if ( vehicle player != player ) exitwith {waffen_lizenz = false;};
	if (waffenschein_best) exitwith {waffen_lizenz = false;};
	sleep 1;
};


license_waffen_in_use =  false;
publicVariable "license_waffen_in_use";


clearWeaponCargo waffenschein_regal;
clearMagazineCargo waffenschein_regal;
player removeWeapon "hgun_Rook40_F";
player removeMagazines "16Rnd_9x21_Mag";

sleep 5;

player setPos current_position_p; 

