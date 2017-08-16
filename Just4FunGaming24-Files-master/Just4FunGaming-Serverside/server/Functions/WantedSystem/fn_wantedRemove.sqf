// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private["_uid"]; 
 
if( !params[ 
        [ "_uid", "", [""]] 
    ]) exitWith {}; 
 
{ 
    if( (_x select 0) isEqualTo _uid ) exitWith { 
        _x set [1, []]; 
    }; 
} forEach XY_wantedList; 
 
// Remove crimes from database 
[ format["UPDATE wanted SET active = '0' WHERE playerid = '%1'", _uid], 1 ] remoteExec ["XYDB_fnc_asyncCall", XYDB];