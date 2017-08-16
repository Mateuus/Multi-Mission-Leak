// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _unit = param[0, objNull, [objNull]]; 
private _gangName = param[1, "", [""]]; 
 
if( isNull _unit || _gangName isEqualTo "" ) exitWith {}; 
 
_group = group _unit; 
_uid = getPlayerUID _unit; 
 
_gangName = [_gangName] call XYDB_fnc_mresString; 
 
if( !(([ format["SELECT id FROM gangs WHERE name = '%1' AND active = '1'", _gangName], 2] call XYDB_fnc_asyncCall) isEqualTo []) ) exitWith { 
    [false, "Es gibt schon eine Gang mit dem Namen, wähle bitte einen anderen Namen"] remoteExec ["XY_fnc_gangCreated", _unit]; 
}; 
if( !(([format["SELECT id FROM gangs WHERE (members LIKE '%2%1%2' OR owner = '%1') AND active = '1'", _uid, "%"], 2] call XYDB_fnc_asyncCall) isEqualTo []) ) exitWith { 
    [false, "Du bist derzeit schon in einer Gang, verlasse diese erstmal"] remoteExec ["XY_fnc_gangCreated", _unit]; 
}; 
 
_moderators = [[]] call XYDB_fnc_mresArray; 
_gangMembers = [[_uid]] call XYDB_fnc_mresArray; 
_queryResult = [format["SELECT id FROM gangs WHERE name='%1' AND active = '0'", _gangName], 2] call XYDB_fnc_asyncCall; 
 
private _query = ""; 
if( _queryResult isEqualTo [] ) then { 
    _query = format["INSERT INTO gangs (owner, name, members, moderators, maxmembers) VALUES('%1', '%2', '%3', '%4', '4')", _uid, _gangName, _gangMembers, _moderators]; 
} else { 
    _query = format["UPDATE gangs SET active = '1', owner = '%1', members = '%2', moderators = '%3', maxmembers = '4' WHERE id = '%4'", _uid, _gangMembers, _moderators, _queryResult select 0]; 
}; 
[_query, 1] call XYDB_fnc_asyncCall; 
 
_queryResult = [ format["SELECT id FROM gangs WHERE owner = '%1' AND active = '1'", _uid], 2] call XYDB_fnc_asyncCall; 
 
_group setVariable["gang.id", _queryResult select 0, true]; 
_group setVariable["gang.name", _gangName, true]; 
_group setVariable["gang.owner", _uid, true]; 
_group setVariable["gang.maxMembers", 4, true]; 
_group setVariable["gang.members", [_uid], true]; 
_group setVariable["gang.moderators", [], true]; 
 
[true] remoteExec ["XY_fnc_gangCreated", _unit];