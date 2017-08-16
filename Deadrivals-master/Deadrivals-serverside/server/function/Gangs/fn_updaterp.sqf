private ["_mode","_query","_queryResult","_gangMembers","_group","_gangName","_uid","_information","_vorstellung"]; 
_mode = [_this,0,0,[0]] call BIS_fnc_param; 
 
switch (_mode) do { 
case 0: { 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_val = [_this,2,0,[0]] call BIS_fnc_param; 
 
_query = format ["UPDATE zivilist SET rufpunkte = rufpunkte + '%1' WHERE playerid = '%2'",_val,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 1: { 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_group = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
_value = format["SELECT rufpunkte FROM zivilist WHERE playerid = '%1'",_uid]; 
_value = [_value,2] call SERVERDATABASE_fnc_asyncCall; 
 
_query = format ["UPDATE zivilist SET rufpunkte = '0' WHERE playerid = '%1'",_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_gangRp = _gangRp + _value; 
_group setvariable ["gang_punkte",_gangRp,true]; 
 
[11,_group] remoteExec ["SERVER_fnc_updateGang",2]; 
}; 
}; 
