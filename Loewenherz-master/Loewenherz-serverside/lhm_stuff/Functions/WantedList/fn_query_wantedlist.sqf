#define DEBUG 
/* 
 File: fn_query_wantedlist.sqf 
 Author: Leo 
 
 Description: 
 Queries the MySQL Wanted data. 
*/ 
private["_uid","_side","_sql","_query","_old","_ret","_index"]; 
_uid = param [0,"",[""]]; 
_side = param [1,civilian,[civilian]]; 
_ret = []; 
 
//Error checks 
if(_uid == "") exitWith {"Invalid UID"}; 
_query =  switch (_side) do { 
 case west:    {""}; 
 case civilian:  {format["SELECT pname, crims, bounty FROM lhm_wantedlist WHERE lhm_wantedlist.puid = '%1'",_uid];}; 
 case independent: {""}; 
 case east: {""}; 
}; 
if (_query == "") exitWith { 
 _ret 
}; 
 
_sql = [_query,2] call DB_fnc_asyncCall; 
 
if (isNil "_sql") then { 
 _sql = "ERROR"; 
}; 
 
if ((typename _sql) == "ARRAY") then { 
 switch(_side) do 
 { 
  case west: 
  { 
  }; 
 
  case east: 
  { 
  }; 
 
  case independent: 
  { 
  }; 
 
  case civilian: 
  { 
   //["TREiBER",["Manslaughter"],8500] 
   //["[DEV]Leo",["Manslaughter"],8500] 
   if ((count _sql) > 2) then { 
    if (!((_sql select 0) == "") && ((count (_sql select 1)) > 0) && ((_sql select 2) > 0)) then { 
     _index = [_uid,lhm_wanted_list] call TON_fnc_index; 
     if(!(_index == -1)) then { 
      lhm_wanted_list set[_index,-1]; 
      lhm_wanted_list = lhm_wanted_list - [-1]; 
     }; 
     lhm_wanted_list pushBack [(_sql select 0),_uid,(_sql select 1),(_sql select 2)]; 
     #ifdef DEBUG 
     //diag_log format ["Query lhm_wanted_list[%2] = %1",lhm_wanted_list,count lhm_wanted_list]; 
     #endif 
 
    }; 
   }; 
  }; 
 }; 
 
 
 
}; 
 
