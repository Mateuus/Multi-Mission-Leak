private["_newname","_query","_player","_queryResult","_send","_mode","_exit","_pn","_playerside","_player2"]; 
_mode =  param [0,-1,[0]]; 
_newname = param [1,"",["",[]]]; 
_player = param [2,objNull,[objNull,""]]; 
_playerside = param [3,civilian,[civilian]]; 
_player2 = param [4,objNull,[objNull]]; 
_exit = false; 
if ((_mode isequalto -1) ||  (_newname isequalto "") || (_player isequalto objNull)) exitwith {diag_log "raus";}; 
 
switch (_mode) do { 
 case 1 : { 
  switch (_playerside) do { 
   case west :{_newname = [_newname] call zero_fnc_mresString; _query = format["playernamecheckcop:%1",_newname];}; 
   case east :{_newname = [_newname] call zero_fnc_mresString; _query = format["playernamecheckreb:%1",_newname];}; 
   case independent : {_newname = [_newname] call zero_fnc_mresString; _query = format["playernamecheckmed:%1",_newname];}; 
   default {_newname = [_newname] call zero_fnc_mresString; _query = format["playernamecheck:%1",_newname];}; 
  }; 
 }; //namenscheck erstanmeldung 
 case 2 : { 
  _pn = [_newname select 0] call zero_fnc_mresString; 
  _newname = [_newname] call zero_fnc_mresArray; 
  switch (_playerside) do { 
   case west : {_query = format["playernameupdatecop:%1:%2:%3",_pn,_newname,[_player] call zero_fnc_mresString];}; 
   case east : {_query = format["playernameupdatereb:%1:%2:%3",_pn,_newname,[_player] call zero_fnc_mresString];}; 
   case independent : {_query = format["playernameupdatemed:%1:%2:%3",_pn,_newname,[_player] call zero_fnc_mresString];}; 
   default {_query = format["playernameupdate:%1:%2:%3",_pn,_newname,[_player] call zero_fnc_mresString];}; 
  }; 
 }; //Name + Passdaten eintragen 
 case 3 : { 
  _newname = [_newname] call zero_fnc_mresString; 
  _query = format["gangnamecheck:%1",_newname]; 
 }; //gang namen Checken 
 case 4 : { 
  _pn = [_newname select 1] call zero_fnc_mresString; //gangID 
  _newname = [_newname select 0] call zero_fnc_mresString; //gangname 
  _query = format["gangcreate:%1:%2:%3",_newname,[_player] call zero_fnc_mresString,[[_pn]]call zero_fnc_mresArray]; 
 }; //gang erstellen und Owner eintragen 
 case 5 : { 
  _newname = [_newname] call zero_fnc_mresString; //gangID 
  _player = [_player] call zero_fnc_mresString; //playerid 
  _query = format["gangcreate:%1:%2:%3",_newname,_player]; //senden selecht ob beides zutrift wenn ja true zurück und löschen. 
 }; //gang löschen 
 
}; 
if (_mode in [2,4] ) then { 
 _queryResult = [_query,1] call zero_fnc_asyncCall; 
} else { 
 _queryResult = [_query,2] call zero_fnc_asyncCall; 
 if(count _queryResult > 0) then  { 
  _send = true; 
 } else { 
  _send = false; 
 }; 
 
 CvfECdE = _send; 
 (owner _player) publicvariableclient "CvfECdE"; 
 CvfECdE = nil; 
}; 
