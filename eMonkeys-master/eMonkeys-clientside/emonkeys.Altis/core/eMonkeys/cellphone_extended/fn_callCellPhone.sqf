/*
Cell Phone Battery script by KampfKuerbisHD // http://www.youtube.com/kampfkuerbishd
*/
closeDialog 0;

if(EMonkeys_bat164 < 2) exitWith {hint "Dein Handy Akku ist leer."};
if(player getVariable["restrained",false] || player getVariable ["surrender", false] || player getVariable ["restrainedciv",false]) exitWith { hint "Du kommst nicht an dein Handy ran!"; };
if(!("ItemRadio" in (assignedItems  player))) exitWith {hint "Du hast kein Handy!";};

createDialog "cellphone_extended";