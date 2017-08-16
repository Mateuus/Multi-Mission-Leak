private["_uid","_side","_type","_classname","_color","_plate"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_bug = [_this,2,"",[""]] call BIS_fnc_param; 
 
if((_uid == "") OR (_name == "") OR (_bug == "")) exitWith {systemChat "Bitte gebe ein Bug an!";}; 
 
_string = ""; 
 
_createbugreport = format["INSERT INTO bugreport SET playerid = '%1', name = '%2', bug = '%3', antwort = '%4'",_uid,_name,_bug,_string]; 
[_createbugreport,1] call SERVERDATABASE_fnc_asyncCall;