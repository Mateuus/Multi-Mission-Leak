/*
Cell Phone Battery script by KampfKuerbisHD // http://www.youtube.com/kampfkuerbishd
*/

if(life_battery < 2) exitWith {hint "Dein Akku ist leer."};
if(player getVariable ["restrained", false]) exitWith {hint "Du bist gefesselt."};
createDialog "Life_my_smartphone";