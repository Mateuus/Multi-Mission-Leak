/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Searches target
*/
private ["_civ","_action"];
closeDialog 0;
_civ = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

_action = [
	"Are you sure you want to search this person, remember if this search is illegal you will be required to compensate the person",
	"Search person",
	"Search",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

hint "Searching......";
sleep 3;
if((player distance _civ > 5)||(!alive player)||(!alive _civ)) exitWith {hint "Cannot search that person."};
[[player],"DS_fnc_searchCiv",_civ,false] spawn BIS_fnc_MP;







