/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Returns information on the chosen house
*/
private["_property"];
_property = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_infoArray = [(typeOf _property)] call DS_civ_houseInfo;

hint format ["You can buy this house for $%1\n\nThis house can be upgraded to %2 slots.\n\n\n\nStorage slots increases the amount of inventory and weapons that your house can hold",[(_infoArray select 0)] call DS_fnc_numberText,(_infoArray select 1)];






