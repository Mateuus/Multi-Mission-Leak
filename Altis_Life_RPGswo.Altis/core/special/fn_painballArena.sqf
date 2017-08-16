/*
	File: fn_painballArena.sqf
	Author: MarkusSR1984
	
	Description:
	Initiert den Paintball Modus für den Spieler
*/

//paintball_hitcounter = 0;
paintball_gotHits = 0;

_paintball_spawnpoints = [];

player setVariable["DWEV_paintball_transfer",true];
player setVariable["DWEV_paintball_sidelock",true];



switch (player getVariable["pballSide",""]) do
{
	case "blau":
	{
		_paintball_spawnpoints pushBack "paintball_blue_spawn_1";
		_paintball_spawnpoints pushBack "paintball_blue_spawn_2";
		_paintball_spawnpoints pushBack "paintball_blue_spawn_3";
		player forceAddUniform "U_B_Protagonist_VR";
	};
	case "rot":
	{
		_paintball_spawnpoints pushBack "paintball_red_spawn_1";
		_paintball_spawnpoints pushBack "paintball_red_spawn_2";
		_paintball_spawnpoints pushBack "paintball_red_spawn_3";
		player forceAddUniform "U_O_Protagonist_VR";
	};
		
};



//player setPos [8513.95,25208.8,0.000801086]; // Auf Spawninsel

player setVariable["DWEV_paintball_arena",true];


_paintballSpawnMarker =  (_paintball_spawnpoints select round (random ((count _paintball_spawnpoints) - 1)));
player setPos getMarkerPos _paintballSpawnMarker;
player setDir markerDir _paintballSpawnMarker;


hint "Willkommen in der Arena\n wenn du den Spielbereich verlässt ist die Runde für dich zu Ende";



		
			pIayer addvest "V_BandollierB_blk";
			pIayer addHeadGear "H_HelmetB_light_black";
			pIayer addGoggles "G_Balaclava_combat";
			pIayer addWeapon "Binocular";
			pIayer linkItem "ItemMap";
			pIayer linkItem "ItemCompass";
			pIayer linkItem "ItemWatch";
			pIayer linkItem "ItemGPS";
			pIayer linkItem "NVGoggles_OPFOR";

			pIayer addWeapon "arifle_MXC_Black_F";
			pIayer addPrimaryWeaponItem "muzzle_snds_H";
			pIayer addPrimaryWeaponItem "optic_Arco";
			pIayer addWeapon "hgun_P07_F";
			pIayer addHandgunItem "muzzle_snds_L";
			pIayer addmagazine "30Rnd_65x39_caseless_mag_Tracer";
			pIayer addmagazine "30Rnd_65x39_caseless_mag_Tracer";
			pIayer addmagazine "30Rnd_65x39_caseless_mag_Tracer";
			pIayer addmagazine "30Rnd_65x39_caseless_mag_Tracer";
			pIayer addmagazine "30Rnd_65x39_caseless_mag_Tracer";
			pIayer addmagazine "30Rnd_65x39_caseless_mag_Tracer";
			
			pIayer addmagazine "30Rnd_9x21_Mag";
			pIayer addmagazine "30Rnd_9x21_Mag";
			pIayer addmagazine "30Rnd_9x21_Mag";


player setVariable["DWEV_paintball_dome",false];

[] spawn 
{
	sleep 2;
	player setVariable["DWEV_paintball_transfer",false];
	DWEV_paintballExitAction = player addAction["Arena verlassen",{["Du hast die Arena verlassen"] call DWEV_fnc_paintballLeafArena;},"",0,false,false,"",'(player getVariable["DWEV_paintball_arena",false])']
};