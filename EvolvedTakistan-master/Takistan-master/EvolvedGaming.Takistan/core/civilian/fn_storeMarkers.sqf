#include <macro.h>
/*
	File: fn_storeMarkers.sqf
	Author: blaster
	
	Description:
	Creates Makers for player owned stores.
*/
private["_pos","_name"];
_pos = SEL(_this,0);
_name = SEL(_this,1);

//if(isNull _player) exitWith {};
if(playerSide != civilian) exitWith {};

_store = createMarker [("store" + _name), _pos];
_store setmarkertype"c_unknown";
_store setmarkercolor "colorYellow";
_store setmarkertext format ["%1's store",_name];
for "_i" from 1 to 30 do {sleep 60;};
deleteMarker _store;