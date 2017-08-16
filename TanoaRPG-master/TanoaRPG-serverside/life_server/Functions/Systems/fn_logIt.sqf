/* 
 
 file: fn_logIt.sqf 
 Author: CooliMC 
 
*/  
if(!isNull life_hc_inUse) exitWith {_this remoteExec ["TEX_fnc_logIt", life_hc_inUse]}; 
 
private["_player","_target","_type","_msg1","_msg2","_msg3","_query","_vonID","_vonName","_zuID","_zuName"]; 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_target = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_type = [_this,2,-1] call BIS_fnc_param; 
_msg1 = [_this,3,"",[""]] call BIS_fnc_param; 
_msg2 = [_this,4,"",[""]] call BIS_fnc_param; 
_msg3 = [_this,5,"",[""]] call BIS_fnc_param; 
_query = ""; 
 
if(_type != -1) then 
{ 
 switch(_type) do 
 { 
  //Playerid with multiple messages 
  case 0: 
  { 
   if(isNULL _player) exitWith {}; 
   if(_msg1 == "") exitWith {}; 
    
   _vonID = getPlayerUid _player; 
    
   if(_msg2 != "") then 
   { 
    if(_msg3 != "") then 
    { 
     _query = format["INSERT INTO ServerLog (VonID, Msg1, Msg2, Msg3)  
      VALUES('%1', '%2', '%3', '%4')", _vonID, _msg1, _msg2, _msg3]; 
    } 
    else 
    { 
     _query = format["INSERT INTO ServerLog (VonID, Msg1, Msg2)  
      VALUES('%1', '%2', '%3')", _vonID, _msg1, _msg2]; 
    }; 
   } 
   else 
   { 
    _query = format["INSERT INTO ServerLog (VonID, Msg1)  
     VALUES('%1', '%2')", _vonID, _msg1]; 
   }; 
  }; 
  //Name Playerid and multiple messages 
  case 1: 
  { 
   if(isNULL _player) exitWith {}; 
   if(_msg1 == "") exitWith {}; 
    
   _vonID = getPlayerUid _player; 
   _vonName = name _player; 
    
   if(_msg2 != "") then 
   { 
    if(_msg3 != "") then 
    { 
     _query = format["INSERT INTO ServerLog (VonID, VonName, Msg1, Msg2, Msg3)  
      VALUES('%1', '%2', '%3', '%4', '%5')", _vonID, _vonName, _msg1, _msg2, _msg3]; 
    } 
    else 
    { 
     _query = format["INSERT INTO ServerLog (VonID, VonName, Msg1, Msg2)  
      VALUES('%1', '%2', '%3', '%4')", _vonID, _vonName, _msg1, _msg2]; 
    }; 
   } 
   else 
   { 
    _query = format["INSERT INTO ServerLog (VonID, VonName, Msg1)  
     VALUES('%1', '%2', '%3')", _vonID, _vonName, _msg1]; 
   }; 
  }; 
  //Log Playerid1 Playerid2 and multiple messages 
  case 2: 
  {  
   if(isNULL _player) exitWith {}; 
   if(isNULL _target) exitWith {}; 
   if(_msg1 == "") exitWith {}; 
    
   _vonID = getPlayerUid _player; 
   _zuID = getPlayerUid _target; 
    
   if(_msg2 != "") then 
   { 
    if(_msg3 != "") then 
    { 
     _query = format["INSERT INTO ServerLog (VonID, ZuID, Msg1, Msg2, Msg3)  
      VALUES('%1', '%2', '%3', '%4', '%5')", _vonID, _zuID, _msg1, _msg2, _msg3]; 
    } 
    else 
    { 
     _query = format["INSERT INTO ServerLog (VonID, ZuID, Msg1, Msg2)  
      VALUES('%1', '%2', '%3', '%4')", _vonID, _zuID, _msg1, _msg2]; 
    }; 
   } 
   else 
   { 
    _query = format["INSERT INTO ServerLog (VonID, ZuID, Msg1)  
     VALUES('%1', '%2', '%3')", _vonID, _zuID, _msg1]; 
   }; 
  }; 
  //Log Playerid1 Playerid2 Playername1 Playername 2 and multiple messages 
  case 3: 
  { 
   if(isNULL _player) exitWith {}; 
   if(isNULL _target) exitWith {}; 
   if(_msg1 == "") exitWith {}; 
    
   _vonID = getPlayerUid _player; 
   _zuID = getPlayerUid _target; 
   _vonName = name _player; 
   _zuName = name _target; 
 
   if(_msg2 != "") then 
   { 
    if(_msg3 != "") then 
    { 
     _query = format["INSERT INTO ServerLog (VonID, ZuID, VonName, ZuName, Msg1, Msg2, Msg3)  
      VALUES('%1', '%2', '%3', '%4', '%5', '%6', '%7')", _vonID, _zuID, _vonName, _zuName, _msg1, _msg2, _msg3]; 
    } 
    else 
    { 
     _query = format["INSERT INTO ServerLog (VonID, ZuID, VonName, ZuName, Msg1, Msg2)  
      VALUES('%1', '%2', '%3', '%4', '%5', '%6')", _vonID, _zuID, _vonName, _zuName, _msg1, _msg2]; 
    }; 
   } 
   else 
   { 
    _query = format["INSERT INTO ServerLog (VonID, ZuID, VonName, ZuName, Msg1)  
     VALUES('%1', '%2', '%3', '%4', '%5')", _vonID, _zuID, _vonName, _zuName, _msg1]; 
   }; 
  }; 
   
  //Log Playerid1 Playerid2 Playername1 Playername 2 and multiple messages 
  case 4: 
  { 
   _vonID = ((_this select 0) select 0); 
   _zuID = ((_this select 1) select 0); 
   _vonName = ((_this select 0) select 1); 
   _zuName = ((_this select 1) select 1); 
 
   if(_vonName == "")  exitWith {}; 
   if(_msg1 == "") exitWith {}; 
    
   if(_msg2 != "") then 
   { 
    if(_msg3 != "") then 
    { 
     _query = format["INSERT INTO ServerLog (VonID, ZuID, VonName, ZuName, Msg1, Msg2, Msg3)  
      VALUES('%1', '%2', '%3', '%4', '%5', '%6', '%7')", _vonID, _zuID, _vonName, _zuName, _msg1, _msg2, _msg3]; 
    } 
    else 
    { 
     _query = format["INSERT INTO ServerLog (VonID, ZuID, VonName, ZuName, Msg1, Msg2)  
      VALUES('%1', '%2', '%3', '%4', '%5', '%6')", _vonID, _zuID, _vonName, _zuName, _msg1, _msg2]; 
    }; 
   } 
   else 
   { 
    _query = format["INSERT INTO ServerLog (VonID, ZuID, VonName, ZuName, Msg1)  
     VALUES('%1', '%2', '%3', '%4', '%5')", _vonID, _zuID, _vonName, _zuName, _msg1]; 
   }; 
  }; 
 }; 
  
 if(_query != "") then 
 { 
  [_query,1] call DB_fnc_asyncCall; 
 } 
 else 
 { 
  diag_log "DB/SCRIPT ERROR in fn_logIt.sqf"; 
 }; 
} 
else 
{ 
 diag_log format["Unformated LOG: %1", _this]; 
}; 
 
