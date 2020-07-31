/*
Charge phone to 200
*/
if(cash_in_hand < 45) exitWith { ["STORE CLERK: Not enough money, I need $45.", false] spawn domsg; };

if(life_battery > 199) exitWith { ["STORE CLERK: Already charged.", false] spawn domsg; };

["STORE CLERK: Okay, let me charge that for you.", false] spawn domsg;
uiSleep 3;
["Set",200] call fnc_battery;
_price = 45;

if(life_karma > 100) then {
		["Otrzymales 10% znizki za dobra reputacje!", false] spawn domsg;
	_price = round(_price * 0.9);
	["cash","take",_price] call life_fnc_handleCash;
} else {
	["cash","take",_price] call life_fnc_handleCash;	
};


playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25];
["Charged, Thank You - Come Again!", false] spawn domsg;