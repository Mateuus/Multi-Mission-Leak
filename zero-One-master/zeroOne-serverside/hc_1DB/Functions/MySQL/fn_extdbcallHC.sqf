/* 
HC für ExtDB 
Call der Datenbank 
Erstellt : André "Nokman" Kupfer 
*/ 
private["_queryStmt","_queryResult","_key","_mode","_return","_loop","_query","_multiarr"]; 
diag_log format ["Incoming ExtDB HC: %1",_this]; 
_queryStmt = param[0,"",[""]]; 
_mode = param[1,1,[0]]; 
_multiarr = param[2,false,[false]]; 
_key = "extDB2" callExtension format["%1:%2:%3",_mode, (call extDB_SQL_CUSTOM_ID), _queryStmt]; 
if(_mode isEqualTo 1) exitWith {}; 
_key = call compile format["%1",_key]; 
_key = _key select 1; 
uisleep (random .03); 
_queryResult = ""; 
_loop = true; 
while{_loop} do { 
 _queryResult = "extDB2" callExtension format["4:%1", _key]; 
 if (_queryResult isEqualTo "[5]") then { 
  _queryResult = ""; 
  while{true} do { 
   _pipe = "extDB2" callExtension format["5:%1", _key]; 
   if(_pipe isEqualTo "") exitWith {_loop = false}; 
   _queryResult = _queryResult + _pipe; 
  }; 
 } else { 
  if (_queryResult isEqualTo "[3]") then { 
   uisleep 0.1; 
  } else { 
   _loop = false; 
  }; 
 }; 
}; 
_queryResult = call compile _queryResult; 
if ((_queryResult select 0) == 0) exitWith {diag_log format ["extDB2: Protocol Error: %1", _queryResult]; []}; 
_return = (_queryResult select 1); 
if(!_multiarr) then { 
 if (isnil "_return") then { 
  _return = [[]]; 
  diag_log format["EXTDB-Fehler-LOG: Query dises Fehlers: %1",_queryResult]; 
  diag_log format["EXTDB-Fehler-LOG: Multiarray-Modus dises Fehlers: %1",_multiarr]; 
 }; 
 _return = _return select 0; 
}; 
if (isnil "_return") then { 
 _return = []; 
 diag_log format["EXTDB-Fehler-LOG: Query dises Fehlers: %1",_queryResult]; 
 diag_log format["EXTDB-Fehler-LOG: Multiarray-Modus dises Fehlers: %1",_multiarr]; 
}; 
diag_log format ["Result ExtDB HC: %1",_return]; 
_return; 
