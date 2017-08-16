/* 
	
	Author: OktasLP
	http://www.lostofparadise.de/
	
*/

if (alive player) then 
{
	player setDamage 0;
	player allowDamage false;
	titleText ["••• GODMODE AKTIVIERT, ADMIN LOADOUT WIRD GELADEN. •••","PLAIN",1];
	sleep 1;
	removeHeadgear player;
	removeVest player;
	removeAllWeapons player;
	removeBackpack player;
	hintSilent parseText format["<t size='1.2' color='#31B404'> Achtung, %1. Dein Godmode deaktiviert sich wenn Du gestorben, festgenommen oder getazert bist. Beachte, dass Du dein Godmode dann erneut aktivieren musst. Nach dem einloggen bedeutet der Godmodeanzug nicht, dass Du noch Godmode hast!</t>", name player];
	player forceAddUniform "U_I_Protagonist_VR";
	player addItem "NVGoggles";
	player addItem "H_Shemag_olive";
	player addItem "ItemGPS";
}else{
	hint "Fehler 502";
};