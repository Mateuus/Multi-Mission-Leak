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
if((lbCurSel 2023) == -1) exitWith {hint "Du hast niemanden ausgewaehlt!";ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if((lbCurSel 2005) == -1) exitWith {hint "Du hast kein Iten ausgewaehlt.";ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(_unit == player) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "Du hast keine gueltige Zahl eingegeben.";ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {hint "Du musst eine richtige Anzahl an zu vergebenden Items angeben.";ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der ausgewaehlte Player ist nicht in Reichweite";};
if(!([false,_item,(parseNumber _val)] call lhm_fnc_handleInv)) exitWith {hint "Konnte nicht so viele Items uebergeben, vll hast du nicht so viele Items?";ctrlShow[2002,true];};
[[_unit,_val,_item,player],"lhm_fnc_receiveItem",_unit,false] call lhm_fnc_mp;
_type = [_item,0] call lhm_fnc_varHandle;
_type = [_type] call lhm_fnc_varToStr;
hint format["You gave %1 %2 %3",_unit getVariable["realname",name _unit],_val,_type];
[] call lhm_fnc_p_updateMenu;

ctrlShow[2002,true];