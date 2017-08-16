private["_mode","_query","_aktuellepartei","_queryResult"]; 
_mode = [_this,0,-1,[0]] call BIS_fnc_param; 
_ownerID = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_ownerID = owner _ownerID; 
 
switch(_mode) do { 
case 1: { 
_queryResult = "SELECT name FROM Zivilist ORDER by bank DESC LIMIT 0,30"; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
}; 
case 2: { 
_queryResult = "SELECT name FROM Zivilist ORDER by exp DESC LIMIT 0,30"; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
}; 
case 3: { 
_queryResult = "SELECT name FROM Zivilist ORDER by time DESC LIMIT 0,30"; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
}; 
case 4: { 
_queryResult = format["SELECT name FROM gangs WHERE active = '%1' ORDER by punkte DESC LIMIT 0,30",1]; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
}; 
case 5: { 
_queryResult = "SELECT name FROM West ORDER by time DESC LIMIT 0,30"; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
}; 
case 6: { 
_queryResult = "SELECT name FROM Independent ORDER by time DESC LIMIT 0,30"; 
_queryResult = [_queryResult,2,true] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
NOCRIS_statistikendaten = _queryResult; 
_ownerID publicVariableClient "NOCRIS_statistikendaten";