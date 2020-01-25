/*
phone call
phonecall
*/
if(cash_in_bank < 50) exitWith { ["Nie masz $50 w banku aby to zrobic", false] spawn domsg; };

["bank","take", 50] call life_fnc_handleCash;
[] call fnc_opentablet;