#include "..\..\script_macros.hpp"
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
if((lbCurSel 2023) == -1) exitWith {hint "Vous n’avez selectionné aucune personne!";ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
if(_unit == "targetgiveitemmoney") then {
_unit = cursorObject;
} else {
_unit = call compile format["%1",_unit];
};
if((lbCurSel 2005) == -1) exitWith {hint "Vous n’avez selectionnez aucun objet à donner.";ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {hint "La cible n’est pas un joueur !";ctrlShow[2002,true];};
if(isNull _unit) exitWith {hint "La cible n’est pas un joueur !";ctrlShow[2002,true];};
if(_unit == player) exitWith {hint "La cible n’est pas un joueur !";ctrlShow[2002,true];};
if(!(_unit isKindOf "Man")) exitWith {hint "La cible n’est pas un joueur !";ctrlShow[2002,true];};
if(!isPlayer _unit) exitWith {hint "La cible n’est pas un joueur !";ctrlShow[2002,true];};
if(life_is_processing) exitWith {hint "Vous êtes en train de process petit malin.";ctrlShow[2002,true];};
if(player distance _unit > 15) exitWith {hint "Cette personne est trop loin";ctrlShow[2001,true];};

//A series of checks ugh
if(!([_val] call life_fnc_isnumber)) exitWith {hint "You didn’t enter an actual number format.";ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {hint "Couldn’t give that much of that item, maybe you don’t have that amount?";ctrlShow[2002,true];};
[_unit,_val,_item,player] remoteExecCall ["life_fnc_receiveItem",_unit];
// hint format["You gave %1 %2 %3",_unit getVariable["realname",name _unit],_val,_type];
hint format["Vous avez donné un objet à la personne devant vous"];
[] call life_fnc_p_updateMenu;

ctrlShow[2002,true];