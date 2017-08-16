if (playerSide == independent) exitWith {hint "You must be a cop to purchase this!"};  //cops only
if (playerSide == civilian) exitWith {hint "You must be a cop to purchase this!"};  //cops only
/*
if((FETCH_CONST(life_coplevel)) < 4) exitWith { hint "You are not the right level!"};  //level 3+

{
	exitWith { hint "You are not the right level!"};  //level 3+
};
*/
if (life_cash > 100) then //Free
{
	life_cash = life_cash -100;  //Free
	hintSilent "has been removed for this kit";
	sleep 2;
	hintSilent "Please wait while your kit is being assembled, this may take a while";
	//Removes all items the player has (Not Y Menu)
	RemoveAllWeapons player;
	{ player removeMagazine _x; } forEach (magazines player);
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadGear player;
	sleep 2;
	//Arma id for weapons, clothes, ...
	player addUniform "U_B_CombatUniform_mcam";
	player addVest "V_PlateCarrier2_blk";
	player addBackpack "B_ViperHarness_blk_F";
	player addHeadGear "H_HelmetB_black";
	player addWeapon "arifle_MX_F"; //lethal
	player addMagazine "30Rnd_65x39_caseless_mag";
	player addMagazine "30Rnd_65x39_caseless_mag";
	player addMagazine "30Rnd_65x39_caseless_mag";
    player addMagazine "30Rnd_65x39_caseless_mag";
    player addMagazine "30Rnd_65x39_caseless_mag";
    player addMagazine "30Rnd_65x39_caseless_mag";
    player addMagazine "30Rnd_65x39_caseless_mag";
    player addMagazine "30Rnd_65x39_caseless_mag";
    player addMagazine "30Rnd_65x39_caseless_mag";
	player addWeapon "hgun_P07_snds_F"; //tazer
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
//
	hintSilent "You are all kitted up and ready to stop crime, good luck officer!";
}
else
{
 hintSilent "Sorry you do not have $100 for this loadout";
};