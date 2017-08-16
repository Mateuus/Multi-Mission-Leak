/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 3206;
ctrlEnable[3205,false];
if((lbCurSel 3204) == -1) exitWith {hint "Du hast niemanden ausgewählt.";ctrlEnable[3205,true];};
_unit = lbData [3204,lbCurSel 3204];
_unit = call compile format["%1",_unit];
if((lbCurSel 3201) == -1) exitWith {hint "Du hast keinen Gegendstand zum handeln ausgewählt.";ctrlEnable[3205,true];};
_item = lbData [3201,(lbCurSel 3201)];
if(isNil "_unit") exitWith {ctrlEnable[3205,true];};
if(_unit == player) exitWith {ctrlEnable[3205,true];};
if(isNull _unit) exitWith {ctrlEnable[3205,true];};

//A series of checks *ugh*
if(!([_val] call SOA_fnc_isnumber)) exitWith {hint "Du hast keine Nummer eingegeben.";ctrlEnable[3205,true];};
if(parseNumber(_val) <= 0) exitWith {hint "Du musst eine Anzahl zum Handeln eingeben.";ctrlEnable[3205,true];};
if(isNil "_unit") exitWith {ctrlEnable[3205,true]; hint "Der Spieler ist nicht in Reichweite!";};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {hint "Es konnte nicht so viel gehandelt werden, bist du dir sicher das du so viel besitzt?";ctrlEnable[3205,true];};
[_unit,_val,_item,player] remoteExecCall ["life_fnc_receiveItem",_unit];
_type = [_item,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast %1 %2 vergeben.",_val,_type];
[] call life_fnc_inventory;

ctrlEnable[3205,true];