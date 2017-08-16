/*
	File: fn_placeStorage.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Place storage container in owned house
*/

private["_item", "_house", "_owners", "_uid", "_maxCount", "_count", "_handle"];

_item = [_this,0,"",[""]] call BIS_fnc_param;

_objs = lineIntersectsObjs [(eyepos player),[(eyepos player) select 0, (eyepos player) select 1, ((eyepos player) select 2) + 15],objNull,player,true,16];
_house = (_objs select 0);
_buildingID = [_house] call life_fnc_getBuildID;
_uid = getPlayerUID player;

if (!(_house in life_houses)) exitWith { hint "You do not own this house and cannot place containers within it."; };

_maxCount = [typeOf _house] call life_fnc_houseContainers;
if (_maxCount == 0) exitWith { hint "This house does not support containers."; };
//if (life_donator < 1) exitWith { hint "You must be donor rank 1 ($10) to place containers in a home."; };
//if (life_donator > 2) then { _maxCount = _maxCount + 1; }; <-- Add this back when we have preset locations per home class

_count = _house getVariable ["containerCount", 0];
if (_count >= _maxCount) exitWith { hint "You cannot place any more containers at this time."; };

hint "Placing storage container...";

[false,_item,1] call life_fnc_handleInv;
[] spawn life_fnc_sessionUpdate;

[[player,_item,_house],"ASY_fnc_placeStorage",false,false] spawn life_fnc_MP;