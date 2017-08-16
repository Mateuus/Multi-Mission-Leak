/* 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Used in selling the house, sets the owned to 0 and will cleanup with a  
 stored procedure on restart. 
*/ 
private["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers"]; 
 
_house = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param; 
_unit =  [ _this, 1, ObjNull, [ObjNull] ] call BIS_fnc_param; 
_price = [ _this, 2, -1,      [0]       ] call BIS_fnc_param; 
 
if( isNull _house || isNull _unit || _price < 0 ) exitWith { 
    diag_log format["[ERROR] Invalid call to removeHouse: %1", _this]; 
}; 
 
if( _house getVariable["house_sold", false] ) exitWith { 
    [1, "Das Haus ist bereits verkauft"] remoteExec ["XY_fnc_broadcast", _unit]; 
}; 
_house setVariable["house_sold", true, true]; 
[ getPlayerUID _unit, 9, format ["Verkauft Haus @ %1 für %2", mapGridPosition _house, [_price] call XY_fnc_numberText ]] call XYDB_fnc_log; 
 
_houseID = _house getVariable["house_id", -1]; 
if(_houseID == -1) then { 
 _housePos = getPosATL _house; 
 _ownerID = (_house getVariable "house_owner") select 0; 
 _query = format["UPDATE houses SET owned='0', pos='[]' WHERE pid='%1' AND pos='%2' AND owned='1'", _ownerID, _housePos]; 
} else { 
 _query = format["UPDATE houses SET owned='0', pos='[]' WHERE id='%1'",_houseID]; 
}; 
[_query, 1] call XYDB_fnc_asyncCall; 
 
_uid = _house getVariable[ "uid", -1 ]; 
 
_house setVariable["house_sold", true, true]; 
_house setVariable["house_id", nil, true]; 
_house setVariable["house_owner", nil, true]; 
_house setVariable["locked", false, true]; 
_house setVariable["trunk", nil, true]; 
_house setVariable["containers", nil, true]; 
_house setVariable["uid", nil, true]; 
 
_radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2)); 
 
_containers = nearestObjects[(getPosATL _house), ["B_supplyCrate_F"], _radius]; 
{ 
    deleteVehicle _x 
} forEach _containers; 
 
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors"); 
for "_i" from 1 to _numOfDoors do { 
    _house setVariable[format["bis_disabled_Door_%1", _i], 0, true]; 
}; 
 
// This function is called with zero price if client-side payment fails, no need to report back to client then 
if( _price > 0 ) then { 
    [ _house, _uid, _price ] remoteExec ["XY_fnc_houseSold", _unit]; 
};