/* 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Updates the storage for a house blah blah 
*/ 
 
private["_house"]; 
 
diag_log format["updateHouseTrunk(%1)", _this]; 
 
_house = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param; 
 
if( isNull _house ) exitWith {}; 
 
// Delay reading trunk contents by a few seconds to allow global variable to update properly... 
sleep 5; 
 
_houseTrunk = _house getVariable[ "Trunk", [[], 0] ]; 
_houseID = _house getVariable["house_id", -1]; 
 
diag_log format["updateHouseTrunk, id %1, trunk %2", _houseID, _houseTrunk]; 
if( _houseID < 0 ) exitWith {}; 
 
_houseTrunk = [ _houseTrunk ] call XYDB_fnc_mresArray; 
 
_query = format["UPDATE houses SET inventory='%1' WHERE id='%2'", _houseTrunk, _houseID]; 
[ _query, 1 ] call XYDB_fnc_asyncCall; 
 
diag_log format["updateHouseTrunk, query: %1", _query];