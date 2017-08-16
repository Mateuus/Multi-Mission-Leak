/* 
HC für ExtDB 
Call der Datenbank 
Erstellt : André "Nokman" Kupfer 
 
*/ 
private["_queryStmt","_queryResult","_key","_mode","_return","_loop","_tickTime","_varname","_query","_multiarr","_check"]; 
_tickTime = diag_tickTime; 
_varname = param[0,"",[""]]; 
_query = param[1,[],[[]]]; 
_queryStmt = _query param[0,"",[""]]; 
_mode = _query param[1,1,[0]]; 
_multiarr = _query param[2,false,[false]]; 
_check = _query param[3,0,[0]]; 
 
diag_log format ["Incoming ExtDB: %1",_this]; 
 
if(_mode isEqualTo 1) then { 
 if((_queryStmt find "updatePlayerLiz" != -1) || //(_queryStmt find "updatePlayerGear" != -1) || 
     (_queryStmt find "updatePlayerCiv" != -1) || (_queryStmt find "updatePlayerIndep" != -1) ||(_queryStmt find "updatePlayerReb" != -1)) then { 
  _queryStmt = [0,_queryStmt] call DB2_fnc_convertItemsLicenses; 
  diag_log format ["ExtDB %1", _queryStmt]; 
 }; 
}; 
/*if((_queryStmt find "playerCivInfo" != -1) || (_queryStmt find "playerRebInfo" != -1)) then { 
    [_queryStmt] spawn hc_fnc_convertLocker; 
};*/ 
 
_key = "extDB2" callExtension format["%1:%2:%3",_mode, (call extDB_SQL_CUSTOM_ID), _queryStmt]; 
 
//Diag_log format ["ExtDB Ergebniss: %1",_key]; 
 
if(_mode isEqualTo 1) exitWith {}; 
 
_key = call compile format["%1",_key]; 
//Diag_log format ["Key Verarbeitung: %1",_key]; 
_key = _key select 1; 
//Diag_log format ["Key select 1: %1",_key]; 
uisleep (random .03); 
 
_queryResult = ""; 
_loop = true; 
while{_loop} do { 
 _queryResult = "extDB2" callExtension format["4:%1", _key]; 
 
 if (_queryResult isEqualTo "[5]") then { 
  // extDB2 returned that result is Multi-Part Message 
  _queryResult = ""; 
  while{true} do { 
   _pipe = "extDB2" callExtension format["5:%1", _key]; 
   if(_pipe isEqualTo "") exitWith {_loop = false}; 
   _queryResult = _queryResult + _pipe; 
  }; 
 }else{ 
  if (_queryResult isEqualTo "[3]") then { 
   //diag_log format ["extDB2: uisleep [4]: %1", diag_tickTime]; 
   uisleep 0.1; 
  } else { 
   _loop = false; 
  }; 
 }; 
}; 
_queryResult = call compile _queryResult; 
if(isNil "_queryResult") exitWith {diag_log format ["extDB2: Error isNil _queryResult"]; []}; 
if((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["extDB2: Protocol Error: %1", _queryResult]; []}; 
 
_return = (_queryResult select 1); 
if(!_multiarr) then { 
 if (isnil "_return") then { 
  _return = [[]]; 
  diag_log format["EXTDB-Fehler-LOG: Query dieses Fehlers: %1",_queryResult]; 
  diag_log format["EXTDB-Fehler-LOG: Multiarray-Modus dieses Fehlers: %1",_multiarr]; 
 }; 
 _return = _return select 0; 
}; 
if (isnil "_return") then { 
 _return = []; 
 diag_log format["EXTDB-Fehler-LOG: Query dieses Fehlers: %1",_queryResult]; 
 diag_log format["EXTDB-Fehler-LOG: Multiarray-Modus dieses Fehlers: %1",_multiarr]; 
}; 
 
if(!(_return isEqualTo []) && {(_queryStmt find "playerWestInfo" != -1) || (_queryStmt find "playerCivInfo" != -1) || (_queryStmt find "playerMedInfo" != -1) ||(_queryStmt find "playerRebInfo" != -1)}) then { 
 _return = [1,_return] call DB2_fnc_convertItemsLicenses; 
 diag_log format ["ExtDB _return %1", _return]; 
}; 
 
call compile (format["HC_DB_Retour_%1=%2",_check,_return]); 
publicvariableserver (format ["HC_DB_Retour_%1",_check]); 
 
//Diag_log format ["Zeit %1 : für %2 Ergebniss: %3 ",(diag_tickTime - _tickTime),_queryStmt,_return]; 
