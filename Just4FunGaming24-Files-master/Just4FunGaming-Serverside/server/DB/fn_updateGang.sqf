// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _group = param[ 0, grpNull, [grpNull] ]; 
     
if( _group isEqualTo grpNull ) exitWith { diag_log "<ERROR> updateGang NULL GRP 1" }; 
 
// Wait for variables to sync... 
uisleep 1; 
 
private _members = _group getVariable [ "gang.members", [] ]; 
private _moderators = _group getVariable [ "gang.moderators", [] ]; 
private _maxMembers = _group getVariable [ "gang.maxMembers", 8 ]; 
private _owner = _group getVariable [ "gang.owner", "" ]; 
private _groupID = _group getVariable[ "gang.id", -1 ]; 
 
if( _groupID isEqualTo -1 ) exitWith { 
    diag_log format["<ERROR> updateGang, gang id empty, %1", _group]; 
}; 
if( _owner isEqualTo "" ) exitWith { 
    diag_log format["<ERROR> updateGang, gang owner empty, %1, %2", _group, _groupID]; 
}; 
if( _members isEqualTo [] ) exitWith { 
    diag_log format["<ERROR> updateGang, gang members empty, %1, %2", _group, _groupID]; 
}; 
 
if( !(_owner in _members) ) then { 
    _members pushBack _owner; 
    _group setVariable[ "gang.members", _members, true ]; 
}; 
 
[ 
    format[ "UPDATE gangs SET members='%1', moderators = '%2', maxmembers = '%3', owner = '%4', lastactivity = CURRENT_TIMESTAMP WHERE id = '%5'", 
        [_members] call XYDB_fnc_mresArray, 
        [_moderators] call XYDB_fnc_mresArray, 
        _maxMembers, 
        _owner, 
        _groupID 
], 1] call XYDB_fnc_asyncCall;