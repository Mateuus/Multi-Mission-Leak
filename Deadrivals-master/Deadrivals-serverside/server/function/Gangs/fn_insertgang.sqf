private ["_gangflag","_query","_queryResult","_gangMembers","_group","_gangName","_uid","_information","_vorstellung"]; 
params [ 
["_ownerID",objNull,[objNull]], 
["_uid","",[""]], 
["_gangName","",[""]], 
["_name","",[""]] 
]; 
_group = group _ownerID; 
if(isNull _ownerID OR _uid == "" OR _gangName == "") exitWith {}; 
 
_ownerID = owner _ownerID; 
_berechtigung = ["diplomatieeinsehen","gangverwalten","rpauszahlen","neuesmitglied","rangbearbeiten","rangvergeben","infobearbeiten","diplomatiebearbeiten","beschreibung","schatzmeister"]; 
_gangMembers = [[_uid,_name,""]]; 
_vorstellung = "Unsere Gang stellt sich vor!"; 
_information = "Willkommen bei unserer Gang!"; 
_array = []; 
_rangarray = [["Rang1",[]],["Rang2",[]],["Rang3",[]],["Rang4",[]],["Rang5",[]]]; 
_gangflag = "flag.paa"; 
_queryResult = format["SELECT id FROM gangs WHERE name = '%1' AND active = '%2'",_gangName,1]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _queryResult != 0) exitWith { 
[1,"Es existiert bereits eine Gang mit diesem Namen, bitte wähle einen anderen"] remoteExecCall ["NETWORK_fnc_broadcast",_ownerID]; 
}; 
 
_queryResult = format["SELECT id FROM gangs WHERE members LIKE '%2%1%2' AND active = '1'",_uid,"%"]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _queryResult != 0) exitWith { 
[1,"Du bist in einer Gang, verlasse diese zuerst!"] remoteExecCall ["NETWORK_fnc_broadcast",_ownerID]; 
}; 
 
_queryResult = format["SELECT id, active FROM gangs WHERE name = '%1' AND active = '%2'",_gangName,0]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _queryResult != 0) then { 
_query = format ["UPDATE gangs SET active = '1', owner = '%1', members = '%2', vorstellung = '%3', information = '%4', talente = '%5', freundlich = '%6', feindlich = '%7', rang = '%8', flag = '%9' WHERE id = '%10'",_uid,_gangMembers,_vorstellung,_information,_array,_array,_array,_rangarray,_gangflag,(_queryResult select 0)]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_queryResult = format["INSERT INTO gangs SET owner = '%1', name = '%2', members = '%3', vorstellung = '%4', information = '%5', talente = '%6', freundlich = '%7', feindlich = '%8', rang = '%9', flag = '%10'",_uid,_gangName,_gangMembers,_vorstellung,_information,_array,_array,_array,_rangarray,_gangflag]; 
[_queryResult,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
_group setVariable["gang_name",_gangName,true]; 
_group setVariable["gang_owner",_uid,true]; 
_group setVariable["gang_bank",0,true]; 
_group setVariable["gang_members",[[_uid,_name,""]],true]; 
_group setVariable["gang_punkte",0,true]; 
_group setVariable["gang_vorstellung",_vorstellung,true]; 
_group setVariable["gang_information",_information,true]; 
_group setVariable["gang_exp",0,true]; 
_group setVariable["gang_talentpunkte",0,true]; 
_group setVariable["gang_talente",_array,true]; 
_group setvariable["gang_level",0,true]; 
_group setvariable["gang_freundlich",_array,true]; 
_group setvariable["gang_feindlich",_array,true]; 
_group setvariable["gang_range",_rangarray,true]; 
_group setvariable["gang_berechtigung",_berechtigung,true]; 
_group setvariable["gang_flag",_gangflag,true]; 
[_group] remoteExecCall ["CLIENT_fnc_gangCreated",_ownerID]; 
 
sleep 2; 
_queryResult = format["SELECT id FROM gangs WHERE members LIKE '%2%1%2' AND active = '1'",_uid,"%"]; 
_queryResult = [_queryResult,2] call SERVERDATABASE_fnc_asyncCall; 
_group setvariable ["gang_id",(_queryResult select 0),true];