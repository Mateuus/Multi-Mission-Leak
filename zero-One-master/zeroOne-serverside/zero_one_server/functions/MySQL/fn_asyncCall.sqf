/* 
 File: fn_asyncCall.sqf 
 Description: 
 Sende Daten an den HC zum einlesen oder eintragen in Extdb2 
 verteilt auf 200 Pipes 
 Parameters: 
  0: STRING (Query to be ran). 
  1: BOOL (True to return for query's, false to not return for update/insert). 
  2: STRING (Unique ID that is stored as QUERY_UNIQUEID so it can be fetched). 
  3: BOOL (True to return a single array, false to return multiple entries mainly for garage). 
*/ 
private["_queryStmt","_queryResult","_timestamp","_mode","_return","_check","_multiarr"]; 
waitUntil {HC1_on}; 
_timestamp = diag_tickTime; 
_queryStmt = param[0,"",[""]]; 
_mode = param[1,1,[0]]; 
_multiarr = param[2,false,[false]]; 
_check = round random 200; 
 
if (!(isnil (format["HC_DBaktion_%1",_check])) OR !(isnil (format["HC_DB_Retour_%1",_check]))) then { 
 while {true} do { 
  _check = round random 200; 
  if ((isnil (format["HC_DBaktion_%1",_check])) && (isnil (format["HC_DB_Retour_%1",_check]))) exitwith {}; 
 }; 
}; 
//waituntil {isnil (format["HC_DBaktion_%1",_check])}; 
//waituntil {isnil (format["HC_DB_Retour_%1",_check])}; 
 
call compile (format['HC_DBaktion_%1=%2',_check,[_queryStmt,_mode,_multiarr,_check]]); 
HC1_owner publicvariableclient (format ["HC_DBaktion_%1",_check]); 
 
 
if(_mode isEqualTo 1) exitWith {diag_log format ["Zeit %1 : %2 Ergebniss: %3 ",(diag_tickTime - _timestamp),_queryStmt,_check];call compile (format['HC_DBaktion_%1=nil',_check]);true}; 
 
//weiter bei rückantwort 
 
waituntil {!isnil (format["HC_DB_Retour_%1",_check])}; 
_return = call compile format["HC_DB_Retour_%1",_check]; 
call compile format["HC_DB_Retour_%1=nil",_check]; 
call compile (format['HC_DBaktion_%1=nil',_check]); 
diag_log format ["Zeit %1 Ergebniss: %2 ",(diag_tickTime - _timestamp),_return]; 
_return; 
