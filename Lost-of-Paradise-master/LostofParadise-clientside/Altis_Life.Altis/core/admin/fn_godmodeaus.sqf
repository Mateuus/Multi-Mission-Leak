/*
	Author: Oktas
	http://www.lostofparadise.de/
*/

if (alive player) then 
{
	player allowDamage true;
	player setDamage 0;
	titleText ["••• GODMODE DEAKTIVIERT, STANDARD LOADOUT WIRD GENERIERT •••","PLAIN",1];
	sleep 1;
	player forceAddUniform "U_O_CombatUniform_oucamo";
	player addVest "V_PlateCarrier1_blk";
	player addBackPack "B_Carryall_oucamo";
	player addItem "NVGoggles";
};