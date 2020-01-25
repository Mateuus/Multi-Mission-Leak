/*
Charge phone to 100
*/
if(cash_in_hand < 25) exitWith { ["STORE CLERK: Not enough money, I need $25.", false] spawn domsg; };
if(life_battery > 99) exitWith { ["STORE CLERK: Already charged.", false] spawn domsg; };
["STORE CLERK: Okay, let me charge that for you.", false] spawn domsg;
uiSleep 3;
["Set",100] call fnc_battery;
["cash","take",25] call life_fnc_handleCash;
playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25];
["Charged, Thank You - Come Again!", false] spawn domsg;
