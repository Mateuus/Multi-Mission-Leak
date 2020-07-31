/*
Search Words: 
grab shovel
grabshovel
yard work
*/

if (!life_is_arrested) exitwith {
	["Nie mozesz podniesc tego przedmiotu", false] spawn domsg;
};

if ((currentWeapon player) != "A3L_Shovel") then {
	player addWeapon "A3L_Shovel";
	["Podniosles lopate!", false] spawn domsg;
};