private["_index","_data"];
params [
["_player","",[""]],
["_target","",[""]],
["_name","",[""]],
["_amount","",[""]],
["_gangName","",[""]]
];
if(isNil "_player" OR {isNil "_target"} OR {parseNumber(_amount) <= 0}) exitWith {};
if(_gangName isEqualTo "") then {_gangName = "None";};
_query = format["CheckHit:%1",_target];
_queryResult = [_query,2] call DB_fnc_asyncCall;
if!(count _queryResult isEqualTo 0) then {
_query = format["UpdateHit:%1:%2:%3",_amount,_name,_target];
[_query,1] call DB_fnc_asyncCall;
[5,format["<t size = '3' t color='#FFFF00'>Hit Updated</t><br/><t size ='1.75' color='#00FF00'>Target: %1</t><br/><br/><t size ='1.65' color ='#FF0000'>Added: $%2</t>",_name,_amount]] remoteExecCall ["life_fnc_brusathusek",-2];
} else {
_query = format["InsertHit:%1:%2:%3:%4:%5",_player,_target,_name,_amount,_gangName];
[_query,1] call DB_fnc_asyncCall;
[5,format["<t size = '3' color='#FFFF00'>Hit Listed</t><br/><t size ='1.75' color='#00FF00'>Target: %1</t><br/><br/><t size='1.65' color='#FF0000'>Amount: $%2</t>",_name,_amount]] remoteExecCall ["life_fnc_brusathusek",-2];
};