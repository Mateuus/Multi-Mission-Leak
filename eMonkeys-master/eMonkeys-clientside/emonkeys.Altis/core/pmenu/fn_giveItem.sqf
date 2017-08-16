/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if((lbCurSel 2023) == -1) exitWith {hint "Niemand wurde ausgewählt!";ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if((lbCurSel 2005) == -1) exitWith {hint "Du hast keinen Gegendstand ausgewählt.";ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(_unit == player) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if(!([_val] call fnc_isnumber)) exitWith {hint "Dies ist kein gültiges Zahlenformat.";ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {hint "Du musst einen reelen Wert eingeben.";ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der ausgewählte Spieler ist außer Reichweite";};
if(!([false,_item,(parseNumber _val)] call EMonkeys_fnc_handleInv)) exitWith {hint "Konnte nicht so viel weitergeben, hast du überhaupt genug?";ctrlShow[2002,true];};
[[_unit,_val,_item,player],"EMonkeys_fnc_receiveItem",_unit,false] call EMonkeys_fnc_mp;
_type = [_item,0] call EMonkeys_fnc_varHandle;
_type = [_type] call EMonkeys_fnc_varToStr;
hint format["Du hast %1 %2 %3 gegeben.",_unit getVariable["realname",name _unit],_val,_type];
[] call EMonkeys_fnc_p_updateMenu;

_text = format ["*** Item geben | SpielerID Empfänger: %1 | Name Empfänger: %2 | SpielerID: %3 | Name: %4 | Item: %5 | Anzahl: %6 |",getPlayerUID _unit,name _unit,getPlayerUID player ,name player,_item,_val];
[[2,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;

ctrlShow[2002,true];