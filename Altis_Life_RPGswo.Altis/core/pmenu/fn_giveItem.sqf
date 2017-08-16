#include "..\..\macros.hpp"
/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val","_item"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if ((lbCurSel 2023) isEqualTo -1) exitWith {hint "Du hast niemanden ausgewählt!";
ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format ["%1",_unit];

if ((lbCurSel 2005) isEqualTo -1) exitWith {hint "Wähle einen Gegenstand aus.";ctrlShow[2002,true];};

_item = lbData [2005,(lbCurSel 2005)];
if (isNil "_unit") exitWith {ctrlShow[2002,true];};
if (_unit == player) exitWith {ctrlShow[2002,true];};
if (isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if(!([_val] call DWF_fnc_isnumber)) exitWith {hint "Gebe eine Zahl ein.";ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {hint "Gebe eine Mengenanzahl an.";ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der Ausgewähle Spieler ist nicht in Reichweite.";};
if(_item == "muell") exitWith {hint "Müll muss bei der Mülldeponie verkauft werden!";};
if((side player) == civilian && (__GETC__(DWEV_adminlevel) < 4 ) && ITEM_ILLEGAL(_item) isEqualTo 1 && ([west,getPos player,200] call DWEV_fnc_nearUnits)) exitWith {hint "Dieser Gegenstand ist illegal, du kannst ihn nicht weitergeben, solange die Polizei in der nähe ist.";};
if(!([false,_item,(parseNumber _val)] call DWEV_fnc_handlelnv)) exitWith {hint "Du hast davon nicht genug!";ctrlShow[2002,true];};

[_unit,_val,_item,player] remoteExec ["DWEV_fnc_receiveItem",_unit];
_type = M_CONFIG(getText,"VirtualItems",_item,"displayName");

hint format["Du hast %1 %2 %3 gegeben.",getPlayerDName(_unit),_val,_type];

[] call DWEV_fnc_p_updateMenu;

ctrlShow[2002,true];