/* 
 Author: CooliMC 
 File: fn_sellHouse.sqf 
  
 Description: 
 Used in selling the house, sets the owned to 0 and will cleanup with a  
 stored procedure on restart. 
*/ 
 
private["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers","_data","_dataOld"]; 
 
_houseID = [_this,0,-1] call BIS_fnc_param; 
_ownerID = [_this,1,""] call BIS_fnc_param; 
_playerID = [_this,2,""] call BIS_fnc_param; 
_housePos = [_this,3,[]] call BIS_fnc_param; 
_radius = [_this,4,0] call BIS_fnc_param; 
_player = [_this,5,ObjNull] call BIS_fnc_param; 
if((_houseID == (-1)) || (_ownerID == "") || (_playerID == "") || ((count _housePos) == 0) || (_radius == 0)) exitWith {}; 
if(_playerID != _ownerID) exitWith {}; //NOT THE HOUSE OWNER 
 
_query = format["UPDATE houses SET owned='0', pos='[]' WHERE pid='%1' AND id='%2' AND owned='1'",_ownerID,_houseID]; 
[_query,1] call DB_fnc_asyncCall; 
systemChat format[":SERVER:sellHouse: house_id is %1",_houseID]; 
 
_containers = nearestObjects[_housePos, ["Box_IND_Grenades_F","I_supplyCrate_F"], _radius]; 
{ 
 deleteVehicle _x 
} foreach _containers; 
 
if(isNull _player) exitWith {}; 
[_housePos] remoteExec ["tanoarpg_fnc_sellHouseFinal", _player]; 
 
_dataOld = (mvh getVariable [format["HousesData_%1", _ownerID],[]]); 
_data = []; 
{ 
 if((_x select 0) != _houseID) then 
 { 
  _data pushBack _x; 
 }; 
} forEach _dataOld; 
mvh setVariable [format["HousesData_%1", _ownerID], _data, true];