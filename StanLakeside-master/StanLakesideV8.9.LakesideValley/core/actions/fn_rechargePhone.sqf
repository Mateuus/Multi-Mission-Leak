/*
Charge phone to 3 for free
*/
["STORE CLERK: Okay, let me charge that for you.", false] spawn domsg;
if(life_battery > 34) exitWith {["STORE CLERK: Already charged enough.", false] spawn domsg; };
uiSleep 3;
["Set",35] call fnc_battery;
playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25];
["Charged, Thank You - Come Again!", false] spawn domsg;
