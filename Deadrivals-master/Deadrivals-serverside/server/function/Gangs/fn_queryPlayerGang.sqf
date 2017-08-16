private["_query","_queryResult"]; 
 
_query = format["SELECT id, owner, name, bank, members, punkte, vorstellung, information, exp, talentpunkte, talente, freundlich, feindlich, rang FROM gangs WHERE active = '1' AND members LIKE '%2%1%2'",_this,"%"]; 
 
_queryResult = [_query,2] call SERVERDATABASE_fnc_asyncCall; 
 
missionNamespace setVariable[format["gang_%1",_this],_queryResult];