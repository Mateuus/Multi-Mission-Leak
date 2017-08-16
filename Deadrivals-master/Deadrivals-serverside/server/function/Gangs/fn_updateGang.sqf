private["_talente","_talentpunkte","_exp","_groupID","_bank","_maxMembers","_members","_query","_owner","_vorstellung"]; 
params [ 
["_mode",0,[0]], 
["_group",grpNull,[grpNull]] 
]; 
 
switch (_mode) do { 
case 0: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_bank = _group getVariable "gang_bank"; 
_owner = _group getVariable "gang_owner"; 
if(_owner == "") exitWith {}; 
 
_query = format ["UPDATE gangs SET bank = '%1', owner = '%2' WHERE id = '%3'",_bank,_owner,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 1: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
_bank = _group getVariable "gang_bank"; 
 
_query = format ["UPDATE gangs SET bank = '%1' WHERE id = '%2'",_bank,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 2: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_vorstellung = _group getVariable "gang_vorstellung"; 
 
_query = format ["UPDATE gangs SET vorstellung = '%1' WHERE id = '%2'",_vorstellung,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 3: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_owner = _group getVariable"gang_owner"; 
if(_owner == "") exitWith {}; 
 
_query = format ["UPDATE gangs SET owner = '%1' WHERE id = '%2'",_owner,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 4: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_members = _group getVariable "gang_members"; 
 
_query = format ["UPDATE gangs SET members = '%1' WHERE id = '%2'",_members,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 5: { 
_gang = [_this,2,"",[""]] call BIS_fnc_param; 
_toAdd = [_this,3,0,[0]] call BIS_fnc_param; 
 
_query = format ["UPDATE gangs SET bank = bank + '%1' WHERE name = '%2'",_toAdd,_gang]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_group = grpNull; 
{if(_gang == (_x getVariable["gang_name",""])) exitWith {_group = _x}} forEach allGroups; 
if(!isNull _group) then { _group setVariable["gang_bank",((_group getVariable["gang_bank",0]) + _toAdd),true]; }; 
}; 
 
case 6: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_vorstellung = _group getVariable "gang_vorstellung"; 
 
_query = format ["UPDATE gangs SET vorstellung = '%1' WHERE id = '%2'",_vorstellung,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 7: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_talentpunkte = _group getVariable "gang_talentpunkte"; 
_talente = _group getVariable "gang_talente"; 
 
_query = format ["UPDATE gangs SET talentpunkte = '%1', talente = '%2' WHERE id = '%3'",_talentpunkte,_talente,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 8: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_exp = _group getVariable "gang_exp"; 
 
_query = format ["UPDATE gangs SET exp = '%1' WHERE id = '%2'",_exp,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 9: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_talentpunkte = _group getVariable "gang_talentpunkte"; 
 
_query = format ["UPDATE gangs SET talentpunkte = '%1' WHERE id = '%2'",_talentpunkte,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 10: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_diplomatiefreundlich = _group getVariable "gang_freundlich"; 
_diplomatiefeindlich = _group getVariable "gang_feindlich"; 
 
_query = format ["UPDATE gangs SET freundlich = '%1', feindlich = '%2' WHERE id = '%3'",_diplomatiefreundlich,_diplomatiefeindlich,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 11: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_rufpunkte = _group getVariable "gang_punkte"; 
 
_query = format ["UPDATE gangs SET punkte = '%1' WHERE id = '%2'",_rufpunkte,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 12: { 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
_rang = _group getVariable "gang_range"; 
 
_query = format ["UPDATE gangs SET rang = '%1' WHERE id = '%2'",_rang,_groupID]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
