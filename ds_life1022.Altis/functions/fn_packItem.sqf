/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Function for packing packable game items
*/

private ["_info","_className","_itemString","_side","_shortName","_vehicle","_itemWeight"];

_info = _this select 3;
_className = _info select 0; //Class name of object to pack
_itemString = _info select 1; //String name to display of object being packed
_side = _info select 2; //Side of player packing object
_shortName = _info select 3; //Short variable name of object
_itemWeight = [_shortName] call DS_fnc_itemWeight;

systemChat format ["Packing your %1...",_itemString];

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;

_vehicle = ((nearestObjects [player,[_className],6]) select 0);
if(isNil "_vehicle")exitWith{"No campfire or vehicle was found to pack";};
if(!alive _vehicle)exitWith{hint format ["You can not pack a destroyed %1",_itemString];};

if(_className isEqualTo "Land_Campfire_F")exitWith {
	DS_firePlaced = false;
	deleteVehicle _vehicle;
	[_shortName,true,1] call DS_fnc_handleInventory;
	systemChat format ["You have placed a packed %1 into your inventory",_itemString];
	hint format ["You have placed a packed %1 into your inventory",_itemString];
};

if(_vehicle in DS_keyRing)then {
	if((vehicle player) isEqualTo _vehicle)exitWith{hint "You can not be in this vehicle while you pack it";};
	deleteVehicle _vehicle;
	[_shortName,true,1] call DS_fnc_handleInventory;
	systemChat format ["You have placed a packed %1 into your inventory",_itemString];
	hint format ["You have placed a packed %1 into your inventory",_itemString];
} else {
	systemChat format ["This is not your %1",_itemString];
	hint format ["This is not your %1",_itemString];
};