/* 
 Author: Karel Moricky 
 Modified by Tonic for function white-listing. 
 
 Description: 
 Execute received remote execution 
 
 Parameter(s): 
 _this select 0: STRING - Packet variable name (always "zero_fnc_MP_packet") 
 _this select 1: ARRAY - Packet value (sent by zero_fnc_MP function; see it's description for more details) 
 
 Returns: 
 BOOL - true if function was executed successfully 
*/ 
private["_validFunctions","_params","_functionName","_target","_isPersistent","_isCall","_varName","_varValue","_function","_callerName","_callerUID","_exitScope"]; 
_exitScope = false; 
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
 
if(_callerName == "" OR _callerUID == "") exitWith {}; //NO. 
if(toLower(_functionName) == "db_fnc_asynccall") exitWith {false}; 
if(toLower(_functionName) in ["bis_fnc_endmission","endmission","failmission","playmission","forceend","startloadingscreen"]) exitWith {false}; //Don't allow BIS_fnc_endMission to be passed. 
if (typename _target == typename true) then { 
 if (_target) then { //an alle 
  if !(toLower(_functionName) in ["zero_fnc_sirensound","zero_fnc_jumpfnc","zero_fnc_cpbpJzzAd","zero_fnc_tazesound","zero_fnc_DCYaGMz","zero_fnc_lighthouse","zero_fnc_AlGOrljtA","zero_fnc_sounddevice","zero_fnc_cell_recivemessage","zero_fnc_sirenlightsex","zero_fnc_copyelp","zero_fnc_medicyelp","zero_fnc_caralarmsound"]) then 
  { 
  _exitScope = true; 
  }; 
 } else { //nur der Server 
  if !(toLower(_functionName) in [ 
   "zero_fnc_cleanuprequest","zero_fnc_wantedbounty","zero_fnc_vehiclestore","zero_fnc_jailsys","zero_fnc_wantedremove","zero_fnc_wantedadd","zero_fnc_insertgang","zero_fnc_removegang","zero_fnc_updategang", 
   "zero_fnc_addhouse","zero_fnc_updatehousetrunk","zero_fnc_sellhousedb","zero_fnc_updatehousecontainers","zero_fnc_managesc","zero_fnc_wantedpardon","zero_fnc_insertrequest","zero_fnc_updateplayerinfo", 
   "zero_fnc_chopshopsellveh","zero_fnc_vehiclecreate","zero_fnc_vehicledelete","zero_fnc_spawnvehicle","zero_fnc_getvehicles","zero_fnc_wantedfetch","zero_fnc_pushbackdispatch", 
   "zero_fnc_queryrequest","zero_fnc_ZQgOJPe","zero_fnc_removedispatch","zero_fnc_updateplayerinfopartial","zero_fnc_AlGOrljtA","zero_fnc_nokpass" 
  ]) then { 
  _exitScope = true; 
  }; 
 }; 
}; 
if(_exitScope) exitWith {diag_log format["MP-EXEC: Nicht durchgelassen: %1",str (toLower (_functionName))];false}; //Blah. 
 
if (ismultiplayer && _mode == 0) then { 
 if (isserver) then { 
  if (typename _target == typename []) then { 
 
   //--- Multi execution 
   { 
    [_varName,[_mode,_params,_functionName,_x,_isPersistent,_isCall,_callerName,_callerUID]] call zero_fnc_handleMPexec; 
   } foreach _target; 
  } else { 
 
   //--- Single execution 
   private["_ownerID","_serverID"]; 
   _serverID = owner (missionnamespace getVariable ["bis_functions_mainscope",objnull]); //--- Server ID is not always 0 
 
   //--- Server process 
   switch (typename _target) do { 
    case (typename objnull): { 
     _ownerID = owner _target; 
    }; 
    case (typename true): { 
     _ownerID = [_serverID,-1] select _target; 
    }; 
    case (typename 0): { 
     _ownerID = _target; 
    }; 
    case (typename grpnull); 
    case (typename sideUnknown): { 
     _ownerID = -1; 
    }; 
    case (typeName ""): { 
     _ownerID = -1; 
    }; 
   }; 
   zero_fnc_MP_packet = [1,_params,_functionName,_target,_isPersistent,_isCall,"__SERVER__","__SERVER__"]; 
 
   //--- Send to clients 
   if (_ownerID < 0) then { 
    //--- Everyone 
    publicvariable "zero_fnc_MP_packet"; 
   } else { 
    if (_ownerID != _serverID) then { 
     //--- Client 
     _ownerID publicvariableclient "zero_fnc_MP_packet"; 
    }; 
   }; 
 
   //--- Server execution (for all or server only) 
   if (_ownerID < 0 || _ownerID == _serverID) then { 
    ["zero_fnc_MP_packet",zero_fnc_MP_packet] spawn zero_fnc_handleMPexec; 
   }; 
 
   //--- Persistent call (for all or clients) 
   if (_isPersistent) then { 
    if (typename _target != typename 0) then { 
     private["_logic","_queue"]; 
     _logic = missionnamespace getVariable ["bis_functions_mainscope",objnull]; 
     _queue = _logic getVariable ["BIS_fnc_MP_queue",[]]; 
     _queue set [ 
      count _queue, 
      +zero_fnc_MP_packet 
     ]; 
     _logic setVariable ["BIS_fnc_MP_queue",_queue,true]; 
    } else { 
     ["Persistent execution is not allowed when target is %1. Use %2 or %3 instead.",typename 0,typename objnull,typename false] call bis_fnc_error; 
    }; 
   }; 
  }; 
 }; 
 
} else { 
 //--- Client 
 private["_canExecute"]; 
 _canExecute = switch (typename _target) do { 
  case (typename grpnull): {player in units _target}; 
  case (typename sideUnknown): {playerside == _target;}; 
  case (typeName ""): {if(!isNull player) then {getPlayerUID player == _target;} else {false}}; 
  default {true}; 
 }; 
 
 if (_canExecute) then { 
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
 }; 
}; 
