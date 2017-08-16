/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {["Bankautomat",["Geld überweisen abgebrochen","Wählen Sie einen Spieler aus"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
if(isNil "_unit") exitWith {["Bankautomat",["Geld überweisen abgebrochen","Der ausgewählte Spieler scheint nicht mehr online zu sein?"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
if(_val > 999999) exitWith {["Bankautomat",["Geld überweisen abgebrochen","Sie können nicht mehr als 999.999€ überweisen!"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
if(_val < 0) exitwith {};
if(!([str(_val)] call EMonkeys_fnc_isnumeric)) exitWith {["Bankautomat",["Geld überweisen abgebrochen","Sie können nur Ziffern verwenden"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
if(_val > EMonkeys_a164) exitWith {["Bankautomat",["Geld überweisen abgebrochen","Soviel Geld besitzen sie nicht auf ihrem Konto!"],"#ADFF2F"] call EMonkeys_fnc_specialText;};
_tax = round(_val / 15);

if((_val + _tax) > EMonkeys_a164) exitWith {["Bankautomat",["Geld überweisen abgebrochen","Sie besitzen nicht genug Geld auf ihrem Konto.",format["Um %1€ zu überweisen benötigen Sie %2€ als Überweisungsgebühr!",_val,_tax]],"#ADFF2F"] call EMonkeys_fnc_specialText;};

EMonkeys_a164 = EMonkeys_a164 - (_val + _tax);

[[_val,profileName],"clientWireTransfer",_unit,false] call EMonkeys_fnc_mp;
[] call EMonkeys_fnc_atmMenu;
["Bankautomat",[format["%1€ an %2 überwiesen.",[_val] call EMonkeys_fnc_numberText,_unit getVariable["realname",name _unit]],format["Eine Überweisungsgebühr in Höhe von %1€ wurde dabei berechnet!",[_tax] call EMonkeys_fnc_numberText]],"#ADFF2F"] call EMonkeys_fnc_specialText;
[1] call SOCK_fnc_updatePartial;

EMonkeys_atmUsed = EMonkeys_atmUsed + 1;

_text = format ["*** Geld überweisen | SpielerID: %1 | Name: %2 | SpielerID Empfänger: %3 | Name Empfänger: %4 | Betrag: %5 |",getPlayerUID player,name player,getPlayerUID _unit,name _unit,_val];
[[4,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
closeDialog 0; 