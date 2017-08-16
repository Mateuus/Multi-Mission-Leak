/* 
 Author: Karel Moricky 
 Modified by Tonic for function white-listing. 
 
 Description: 
 Execute received remote execution 
 
 Parameter(s): 
 _this select 0: STRING - Packet variable name (always "BIS_fnc_MP_packet") 
 _this select 1: ARRAY - Packet value (sent by BIS_fnc_MP_packet function; see it's description for more details) 
 
 Returns: 
 BOOL - true if function was executed successfully 
*/ 
private["_validFunctions","_params","_functionName","_target","_isPersistent","_isCall","_varName","_varValue","_function","_callerName","_callerUID"]; 
_varName = param[0,"",[""]]; 
_varValue = param[1,[],[[]]]; 
 
_mode = _varValue param[0,0,[0]]; 
_params = _varValue param[1,[],[[]]]; 
_functionName = _varValue param[2,"",[""]]; 
_target = _varValue param[3,true,[ObjNull,true,0,[],sideUnknown,GrpNull,""]]; 
_isPersistent = _varValue param[4,false,[false]]; 
_isCall = _varValue param[5,false,[false]]; 
_callerName = _varValue param[6,"",[""]]; 
_callerUID = _varValue param[7,"",[""]]; 
 
if (!isserver) exitWith {false}; 
if(!(toLower(_functionName) in ["bis_fnc_execvm","bis_fnc_objectVar"])) exitWith {false}; 
if(toLower(_functionName) == "bis_fnc_execvm" && toLower((_varValue select 1) select 1) != "initPlayerServer.sqf") exitWith {false}; 
 
_function = missionnamespace getVariable _functionName; 
if (!isnil "_function") then { 
 if (_isCall) then { 
  _params call _function; 
 } else { 
  _params spawn _function; 
 }; 
 true 
} else { 
 ["Function '%1' does not exist",_functionName] call bis_fnc_error; 
 false 
}; 
