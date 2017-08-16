/*
		fn_aufzuschließen
		Author: G00golplexian
		
		Description: Opens or closes the doors of a building on activation.
*/

private ["_building","_door"];
_building = [_this,0,CursorObject,[CursorObject]] call BIS_fnc_param;
_door = [_building] call life_fnc_nearestDoor;

if(_building animationPhase format["door_%1_rot",_door] == 0) then {
	_building setVariable [format['bis_disabled_Door_%1',_door],0,true];
	_building animate [format["Door_%1_rot",_door],1];
} else {
	_building setVariable [format['bis_disabled_Door_%1',_door],1,true];
	_building animate [format["Door_%1_rot",_door],0];
};