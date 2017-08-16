/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {["Bankautomat",["Geld einzahlen abgebrochen","Sie können nicht mehr als 999,999€ auf einmal einzahlen"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
if(_value < 0) exitWith {};
if(!([str(_value)] call EMonkeys_fnc_isnumeric)) exitWith {["Bankautomat",["Geld einzahlen abgebrochen","Sie können nur Ziffern verwenden"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
if(_value > EMonkeys_c164) exitWith {["Bankautomat",["Geld einzahlen abgebrochen","Soviel Geld haben sie nicht!"],"#ADFF2F"] call EMonkeys_fnc_specialText;};

EMonkeys_c164 = EMonkeys_c164 - _value;
EMonkeys_a164 = EMonkeys_a164 + _value;

["Bankautomat",[format["%1€ auf ihrem Bankkonto eingezahlt",[_value] call EMonkeys_fnc_numberText]],"#ADFF2F"] call EMonkeys_fnc_specialText;
[] call EMonkeys_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

EMonkeys_atmUsed = EMonkeys_atmUsed + 1;

_text = format ["*** Geld einzahlen | SpielerID: %1 | Name: %2 | Betrag: %3 |",getPlayerUID player,name player,_value];
[[4,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
closeDialog 0; 