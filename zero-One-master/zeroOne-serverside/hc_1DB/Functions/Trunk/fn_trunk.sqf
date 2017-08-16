private["_vehicle","_invnew","_player","_search","_owner","_send","_mode","_exit"]; 
diag_log format ["DEBUG: fn_trunk _this %1", _this]; 
_mode = param[0,-1,[0]]; 
_vehicle = param[1,objNull,[objNull]]; 
_player = param[2,objNull,[objNull]]; 
_invnew = param[3,[[],0],[[],0]]; 
_owner = param[4,-1,[0]]; 
_exit = false; 
if ((_mode isEqualTo -1) ||  (_vehicle isEqualTo objNull) || (_player isEqualTo objNull) || (_owner isEqualTo -1)) exitWith {diag_log "raus";}; 
 
if (_mode in [0,2]) then { 
 _inuse = _vehicle getVariable "inuse"; 
 if (!isNil "_inuse") then { 
  if ((alive (_inuse select 1)) && (!isNull (_inuse select 1))) then { 
   if (!((_inuse select 0) isEqualTo (name (_inuse select 1)))) exitWith {_vehicle setVariable ["inuse",nil];}; 
   sendtrunkre = (_inuse select 0); 
   _owner publicVariableClient "sendtrunkre"; 
   sendtrunkre = nil; 
   _exit = true; 
  } else { 
   _vehicle setVariable ["inuse",nil]; 
  }; 
 }; 
}; 
if (_exit) exitWith {}; 
 
switch (_mode) do { 
 case 0 : {sendtrunkre = _vehicle getVariable ["koffer",[[],0]]; _vehicle setVariable ["inuse",[name _player,_player]];}; 
 case 1 : {_vehicle setVariable ["koffer",_invnew];sleep 1; _vehicle setVariable ["inuse",nil];}; 
 
 case 2 : {sendtrunkre = _vehicle getVariable ["koffer",[[],0]]; _vehicle setVariable ["inuse",[name _player,_player]];}; //gerät mining 
 case 3 : {_vehicle setVariable ["koffer",_invnew];sleep 1; _vehicle setVariable ["inuse",nil];}; //gerät speichern 
}; 
 
if (_mode in [0,2]) then { 
 _owner publicVariableClient "sendtrunkre"; 
 sendtrunkre = nil; 
}; 
