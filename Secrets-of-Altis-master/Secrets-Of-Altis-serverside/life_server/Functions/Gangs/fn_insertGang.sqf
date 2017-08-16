 
 
 
 
 
 
private["_owner","_ownerID","_uid","_gangName","_query","_queryResult","_gangMembers","_group"]; 
_owner = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_gangName = [_this,2,"",[""]] call BIS_fnc_param; 
_group = group _owner; 
 
if(isNull _owner OR _uid == "" OR _gangName == "") exitWith {};  
 
_ownerID = owner _owner; 
_gangName = [_gangName] call DB_fnc_mresString; 
_query = format["SELECT id FROM gangs WHERE name='%1' AND active='1'",_gangName]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
 
if(count _queryResult != 0) exitWith { 
[1,"Es existiert bereits eine Gang mit diesem Namen, bitte wähle einen anderen."] remoteExecCall ["life_fnc_broadcast",_ownerID]; 
life_action_gangInUse = nil; _ownerID PublicVariableClient "life_action_gangInUse"; 
}; 
 
_query = format["SELECT id FROM gangs WHERE members LIKE '%2%1%2' AND active='1'",_uid,"%"]; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
 
if(count _queryResult != 0) exitWith { 
[1,"Du gehörst derzeitig bereits einer Gang an, bitte verlasse diese zuerst."] remoteExecCall ["life_fnc_broadcast",_ownerID]; 
life_action_gangInUse = nil; _ownerID PublicVariableClient "life_action_gangInUse"; 
}; 
 
 
_query = format["SELECT id, active FROM gangs WHERE name='%1' AND active='0'",_gangName]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
_gangMembers = [[_uid]] call DB_fnc_mresArray; 
 
if(count _queryResult != 0) then { 
_query = format["UPDATE gangs SET active='1', owner='%1',members='%2' WHERE id='%3'",_uid,_gangMembers,(_queryResult select 0)]; 
} else { 
_query = format["INSERT INTO gangs (owner, name, members) VALUES('%1','%2','%3')",_uid,_gangName,_gangMembers]; 
}; 
 
_queryResult = [_query,1] call DB_fnc_asyncCall; 
 
_group setVariable["gang_name",_gangName,true]; 
_group setVariable["gang_owner",_uid,true]; 
_group setVariable["gang_bank",0,true]; 
_group setVariable["gang_bank_inUse",false,true]; 
_group setVariable["gang_maxMembers",8,true]; 
_group setVariable["gang_members",[_uid],true]; 
_group setVariable["gang_tag","NEU",true]; 
[] remoteExecCall ["life_fnc_gangCreated",_ownerID]; 
 
sleep 0.35; 
_query = format["SELECT id FROM gangs WHERE owner='%1' AND active='1'",_uid]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
_group setVariable["gang_id",(_queryResult select 0),true]; 
