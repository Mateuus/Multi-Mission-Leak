/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {["Bankautomat",["Geld abheben abgebrochen.","Sie können nicht mehr als 999.999€ abheben!"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
if(_val < 0) exitwith {};
if(!([str(_val)] call EMonkeys_fnc_isnumeric)) exitWith {["Bankautomat",["Geld abheben abgebrochen.","Sie können nur Ziffern verwenden"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
if(_val > EMonkeys_a164) exitWith {["Bankautomat",["Geld abheben abgebrochen.","Soviel Geld haben sie nicht!"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
if(_val < 100 && EMonkeys_a164 > 20000000) exitWith {["Bankautomat",["Geld abheben abgebrochen.","Der Mindestbetrag beträgt 100€"],"#ADFF2F"] call EMonkeys_fnc_specialText;}; //Temp fix for something.

EMonkeys_c164 = EMonkeys_c164 + _val;
EMonkeys_a164 = EMonkeys_a164 - _val;
["Bankautomat",[format ["%1€ von ihrem Bankkonto abgehoben.",[_val] call EMonkeys_fnc_numberText]],"#ADFF2F"] call EMonkeys_fnc_specialText;
[] call EMonkeys_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

EMonkeys_atmUsed = EMonkeys_atmUsed + 1;

_text = format ["*** Geld abheben | SpielerID: %1 | Name: %2 | Betrag: %3 |",getPlayerUID player,name player,_val];
[[4,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
closeDialog 0; 