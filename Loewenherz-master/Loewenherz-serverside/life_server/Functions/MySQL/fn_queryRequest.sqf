 
/* 
 File: fn_queryRequest.sqf 
 Author: Bryan "Tonic" Boardwine, Loewenherz 
 
 Description: 
 Handles the incoming request and sends an asynchronous query 
 request to the database. 
 
 Return: 
 ARRAY - If array has 0 elements it should be handled as an error in client-side files. 
 STRING - The request had invalid handles or an unknown error and is logged to the RPT. 
*/ 
 
private ["_side","_query","_return","_queryResult","_qResult","_wanted","_handler","_thread","_tickTime","_loops","_returnCount","_ownerID","_tmp","_old","_data","_pos","_dir","_houseData","_gangData","_keyArr"]; 
_uid = param [0,"",[""]]; 
_side = param [1,sideUnknown,[civilian]]; 
_ownerID = param [2,ObjNull,[ObjNull]]; 
 
if(isNull _ownerID) exitWith {}; 
_ownerID = owner _ownerID; 
 
/* 
 _returnCount is the count of entries we are expecting back from the async call. 
 The other part is well the SQL statement. 
 
/* 
_query = switch(_side) do { 
 case west: { 
 _returnCount = 12; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, cop_prof, blacklist, cop_survival FROM players WHERE playerid='%1'",_uid];}; 
 case civilian: {_returnCount = 11; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, civ_prof, civ_survival FROM players WHERE playerid='%1'",_uid];}; 
 case independent: {_returnCount = 11; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel, med_gear, med_prof, med_survival FROM players WHERE playerid='%1'",_uid];}; 
 case east: {_returnCount = 11; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, sec_licenses, seclevel, sec_gear, sec_prof, sec_survival FROM players WHERE playerid='%1'",_uid];}; 
}; 
*/ 
 
_query = format["INSERT INTO `lhm_savepos` (`lhm_savepos`.`PID`) SELECT * FROM (SELECT '%1') AS temp WHERE NOT EXISTS (SELECT * FROM `lhm_savepos` WHERE `lhm_savepos`.`PID` = '%1')", _uid]; 
 
[_query,1] call DB_fnc_asyncCall; 
 
_query = switch(_side) do { 
 case west: { 
  //_returnCount = 14; format["SELECT A.playerid, A.name, A.cash, A.bankacc, A.adminlevel, A.donatorlvl, A.cop_licenses, A.coplevel, A.cop_gear, A.cop_prof, A.blacklist, A.cop_survival, B.CopPos, B.AliveCop FROM players AS A INNER JOIN lhm_savepos AS B ON B.PID = '%1' WHERE A.playerid = '%1'",_uid]; 
  _returnCount = 14; format["select 
         `players`.`playerid` AS `playerid`, `players`.`name` AS `name`, `players`.`cash` AS `cash`, `players`.`bankacc` AS `bankacc`, `players`.`adminlevel` AS `adminlevel`, `players`.`donatorlvl` AS `donatorlvl`, 
         `players`.`cop_licenses` AS `cop_licenses`, 
         `players`.`coplevel` AS `coplevel`, 
         `players`.`cop_gear` AS `cop_gear`, 
         `players`.`cop_prof` AS `cop_prof`, 
         `players`.`blacklist` AS `blacklist`, 
         `players`.`cop_survival` AS `cop_survival`, 
         `lhm_savepos`.`CopPos` AS `CopPos`, 
         `lhm_savepos`.`AliveCop` AS `AliveCop` 
        from (`players` join `lhm_savepos` on((`players`.`playerid` = `lhm_savepos`.`PID`))) 
        where (`players`.`playerid` = '%1') 
        UNION ALL 
        select `players`.`playerid` AS `playerid`, `players`.`name` AS `name`, `players`.`cash` AS `cash`, `players`.`bankacc` AS `bankacc`, `players`.`adminlevel` AS `adminlevel`, `players`.`donatorlvl` AS `donatorlvl`, 
         `players`.`cop_licenses` AS `cop_licenses`, 
         `players`.`coplevel` AS `coplevel`, 
         `players`.`cop_gear` AS `cop_gear`, 
         `players`.`cop_prof` AS `cop_prof`, 
         `players`.`blacklist` AS `blacklist`, 
         `players`.`cop_survival` AS `cop_survival`, 
         '[]' AS `CopPos`, 
         1 AS `AliveCop` 
        from `players` where (`players`.`playerid` = '%1') 
        AND NOT EXISTS ( 
         select 
          `lhm_savepos`.`SecPos` AS `SecPos`, 
          `lhm_savepos`.`AliveSec` AS `AliveSec` 
         from `lhm_savepos` 
         where `lhm_savepos`.`PID` = '%1')", _uid]; 
 }; 
 
 case civilian: { 
  //_returnCount = 13; format["SELECT A.playerid, A.name, A.cash, A.bankacc, A.adminlevel, A.donatorlvl, A.civ_licenses, A.arrested, A.civ_gear, A.civ_prof, A.civ_survival, B.CivPos, B.AliveCiv FROM players AS A INNER JOIN lhm_savepos AS B ON B.PID = '%1' WHERE A.playerid = '%1'",_uid]; 
  _returnCount = 13; format["select 
          `players`.`playerid` AS `playerid`, `players`.`name` AS `name`, `players`.`cash` AS `cash`, `players`.`bankacc` AS `bankacc`, `players`.`adminlevel` AS `adminlevel`, `players`.`donatorlvl` AS `donatorlvl`, 
          `players`.`civ_licenses` AS `civ_licenses`, 
          `players`.`arrested` AS `arrested`, 
          `players`.`civ_gear` AS `civ_gear`, 
          `players`.`civ_prof` AS `civ_prof`, 
          `players`.`civ_survival` AS `civ_survival`, 
          `lhm_savepos`.`CivPos` AS `CivPos`, 
          `lhm_savepos`.`AliveCiv` AS `AliveCiv` 
         from (`players` join `lhm_savepos` on((`players`.`playerid` = `lhm_savepos`.`PID`))) 
         where (`players`.`playerid` = '%1') 
         UNION ALL 
         select 
          `players`.`playerid` AS `playerid`, 
          `players`.`name` AS `name`, 
          `players`.`cash` AS `cash`, 
          `players`.`bankacc` AS `bankacc`, 
          `players`.`adminlevel` AS `adminlevel`, 
          `players`.`donatorlvl` AS `donatorlvl`, 
          `players`.`civ_licenses` AS `civ_licenses`, 
          `players`.`arrested` AS `arrested`, 
          `players`.`civ_gear` AS `civ_gear`, 
          `players`.`civ_prof` AS `civ_prof`, 
          `players`.`civ_survival` AS `civ_survival`, 
          '[]' AS `CivPos`, 
          1 AS `AliveCiv` 
         from `players` where (`players`.`playerid` = '%1') 
         AND NOT EXISTS ( 
         select 
          `lhm_savepos`.`SecPos` AS `SecPos`, 
          `lhm_savepos`.`AliveSec` AS `AliveSec` 
         from `lhm_savepos` 
         where `lhm_savepos`.`PID` = '%1') 
         ", _uid]; 
 }; 
 
 case independent: { 
  //_returnCount = 13; format["SELECT A.playerid, A.name, A.cash, A.bankacc, A.adminlevel, A.donatorlvl, A.med_licenses, A.mediclevel, A.med_gear, A.med_prof, A.med_survival, B.MedPos, B.AliveMed FROM players AS A INNER JOIN lhm_savepos AS B ON B.PID = '%1' WHERE A.playerid = '%1'",_uid]; 
  _returnCount = 13; format["select 
          `players`.`playerid` AS `playerid`, 
          `players`.`name` AS `name`, 
          `players`.`cash` AS `cash`, 
          `players`.`bankacc` AS `bankacc`, 
          `players`.`adminlevel` AS `adminlevel`, 
          `players`.`donatorlvl` AS `donatorlvl`, 
          `players`.`med_licenses` AS `med_licenses`, 
          `players`.`mediclevel` AS `mediclevel`, 
          `players`.`med_gear` AS `med_gear`, 
          `players`.`med_prof` AS `med_prof`, 
          `players`.`med_survival` AS `med_survival`, 
          `lhm_savepos`.`MedPos` AS `MedPos`, 
          `lhm_savepos`.`AliveMed` AS `AliveMed` 
         from (`players` join `lhm_savepos` on((`players`.`playerid` = `lhm_savepos`.`PID`))) 
         where (`players`.`playerid` = '%1') 
         UNION ALL 
         select 
          `players`.`playerid` AS `playerid`, 
          `players`.`name` AS `name`, 
          `players`.`cash` AS `cash`, 
          `players`.`bankacc` AS `bankacc`, 
          `players`.`adminlevel` AS `adminlevel`, 
          `players`.`donatorlvl` AS `donatorlvl`, 
          `players`.`med_licenses` AS `med_licenses`, 
          `players`.`mediclevel` AS `mediclevel`, 
          `players`.`med_gear` AS `med_gear`, 
          `players`.`med_prof` AS `med_prof`, 
          `players`.`med_survival` AS `med_survival`, 
          '[]' AS `MedPos`, 
          1 AS `AliveMed` 
         from `players` where (`players`.`playerid` = '%1') 
         AND NOT EXISTS ( 
         select 
          `lhm_savepos`.`SecPos` AS `SecPos`, 
          `lhm_savepos`.`AliveSec` AS `AliveSec` 
         from `lhm_savepos` 
         where `lhm_savepos`.`PID` = '%1')",_uid]; 
 }; 
 
 case east: { 
  //_returnCount = 13; format["SELECT A.playerid, A.name, A.cash, A.bankacc, A.adminlevel, A.donatorlvl, A.sec_licenses, A.seclevel, A.sec_gear, A.sec_prof, A.sec_survival, B.SecPos, B.AliveSec FROM players AS A INNER JOIN lhm_savepos AS B ON B.PID = '%1' WHERE A.playerid = '%1'",_uid]; 
  _returnCount = 13; format["select 
          `players`.`playerid` AS `playerid`, `players`.`name` AS `name`, `players`.`cash` AS `cash`, `players`.`bankacc` AS `bankacc`, `players`.`adminlevel` AS `adminlevel`, `players`.`donatorlvl` AS `donatorlvl`, 
          `players`.`sec_licenses` AS `sec_licenses`, 
          `players`.`seclevel` AS `seclevel`, 
          `players`.`sec_gear` AS `sec_gear`, 
          `players`.`sec_prof` AS `sec_prof`, 
          `players`.`sec_survival` AS `sec_survival`, 
          `lhm_savepos`.`SecPos` AS `SecPos`, 
          `lhm_savepos`.`AliveSec` AS `AliveSec` 
         from (`players` join `lhm_savepos` on((`players`.`playerid` = `lhm_savepos`.`PID`))) 
         where (`players`.`playerid` = '%1') 
         UNION ALL 
         select 
          `players`.`playerid` AS `playerid`, 
          `players`.`name` AS `name`, 
          `players`.`cash` AS `cash`, 
          `players`.`bankacc` AS `bankacc`, 
          `players`.`adminlevel` AS `adminlevel`, 
          `players`.`donatorlvl` AS `donatorlvl`, 
          `players`.`sec_licenses` AS `sec_licenses`, 
          `players`.`seclevel` AS `seclevel`, 
          `players`.`sec_gear` AS `sec_gear`, 
          `players`.`sec_prof` AS `sec_prof`, 
          `players`.`sec_survival` AS `sec_survival`, 
          '[]' AS `SecPos`, 
          1 AS `AliveSec` 
         from `players` where (`players`.`playerid` = '%1') 
         AND NOT EXISTS ( 
         select 
          `lhm_savepos`.`SecPos` AS `SecPos`, 
          `lhm_savepos`.`AliveSec` AS `AliveSec` 
         from `lhm_savepos` 
         where `lhm_savepos`.`PID` = '%1')",_uid]; 
 }; 
}; 
 
_tickTime = diag_tickTime; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
waitUntil {!isNil "_queryResult"}; 
diag_log "------------- Client Query Request -------------"; 
diag_log format["QUERY: %1",_query]; 
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)]; 
diag_log format["Result: %1",_queryResult]; 
diag_log "------------------------------------------------"; 
 
if(typeName _queryResult == "STRING") exitWith { 
 [[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] call lhm_fnc_mp; 
}; 
 
if(count _queryResult == 0) exitWith { 
 [[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] call lhm_fnc_mp; 
}; 
 
//Blah conversion thing from a2net->extdb 
private["_tmp"]; 
_tmp = _queryResult select 2; 
_queryResult set[2,[_tmp] call DB_fnc_numberSafe]; 
_tmp = _queryResult select 3; 
_queryResult set[3,[_tmp] call DB_fnc_numberSafe]; 
 
//Parse licenses (Always index 6) 
_new = [(_queryResult select 6)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[6,_new]; 
 
//Convert tinyint to boolean 
_old = _queryResult select 6; 
for "_i" from 0 to (count _old)-1 do 
{ 
 _data = _old select _i; 
 _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
 
_queryResult set[6,_old]; 
 
_new = [(_queryResult select 8)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[8,_new]; 
// papabears-persistent-proficiency-system // 
//PROFICENCYS 
//Parse licenses (Always index 9) 
_new = [(_queryResult select 9)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[9,_new]; 
 
//Convert string to number 
_old = _queryResult select 9; 
for "_i" from 0 to (count _old)-1 do 
{ 
 _data = _old select _i; 
 _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_numberSafe),([_data select 2,1] call DB_fnc_numberSafe) ]]; 
}; 
 
_queryResult set[9,_old]; 
// papabears-persistent-proficiency-system // 
 
//Parse data for specific side. 
switch (_side) do { 
 case west: { 
  _queryResult set[10,([_queryResult select 10,1] call DB_fnc_bool)]; 
  _new = [(_queryResult select 11)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[11,_new]; 
  _new = [(_queryResult select 12)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[12,_new]; 
 
  // Process player position 
  if((_queryResult select 13) == 1 && count(_queryResult select 12) == 2) then { 
   _pos = ((_queryResult select 12)); 
   _dir = _pos select 0; 
   _pos = _pos select 1; 
   // if player is in air or underwater 
   if (_pos select 2 > 25 || _pos select 2 < -1) then { 
    _pos = [_pos select 0,_pos select 1,0]; 
   }; 
    _queryResult set[12,[_dir,_pos]]; 
  } else { 
   _queryResult set[12,[]]; 
   [_ownerID,_side,true] call lhm_fnc_setAlivePos; 
  }; 
 
 }; 
 
 case civilian: { 
  _new = [(_queryResult select 10)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[10,_new]; 
  _new = [(_queryResult select 11)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[11,_new]; 
  // Process player position 
  if((_queryResult select 12) == 1 && count(_queryResult select 11) == 2) then { 
   _pos = ((_queryResult select 11)); 
   _dir = _pos select 0; 
   _pos = _pos select 1; 
   // if player is in air or underwater 
   if (_pos select 2 > 25 || _pos select 2 < -1) then { 
    _pos = [_pos select 0,_pos select 1,0]; 
   }; 
    _queryResult set[11,[_dir,_pos]]; 
  } else { 
   _queryResult set[11,[]]; 
   [_ownerID,_side,true] call lhm_fnc_setAlivePos; 
  }; 
 
 
  _queryResult set[7,([_queryResult select 7] call DB_fnc_numberSafe)]; 
  _houseData = _uid spawn TON_fnc_fetchPlayerHouses; 
  waitUntil {scriptDone _houseData}; 
  _queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]); // 11 
  _gangData = _uid spawn TON_fnc_queryPlayerGang; 
  waitUntil{scriptDone _gangData}; 
  _queryResult pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]); // 12 
 }; 
 
 case east: 
 { 
  _new = [(_queryResult select 10)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[10,_new]; 
  _new = [(_queryResult select 11)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[11,_new]; 
 
  // Process player position 
  if((_queryResult select 12) == 1 && count(_queryResult select 11) == 2) then { 
   _pos = ((_queryResult select 11)); 
   _dir = _pos select 0; 
   _pos = _pos select 1; 
   // if player is in air or underwater 
   if (_pos select 2 > 25 || _pos select 2 < -1) then { 
    _pos = [_pos select 0,_pos select 1,0]; 
   }; 
    _queryResult set[11,[_dir,_pos]]; 
  } else { 
   _queryResult set[11,[]]; 
   [_ownerID,_side,true] call lhm_fnc_setAlivePos; 
  }; 
 
 }; 
 
 case independent: 
 { 
  _new = [(_queryResult select 10)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[10,_new]; 
  _new = [(_queryResult select 11)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[11,_new]; 
 
  // Process player position 
  if((_queryResult select 12) == 1 && count(_queryResult select 11) == 2) then { 
   _pos = ((_queryResult select 11)); 
   _dir = _pos select 0; 
   _pos = _pos select 1; 
   // if player is in air or underwater 
   if (_pos select 2 > 25 || _pos select 2 < -1) then { 
    _pos = [_pos select 0,_pos select 1,0]; 
   }; 
    _queryResult set[11,[_dir,_pos]]; 
  } else { 
   _queryResult set[11,[]]; 
   [_ownerID,_side,true] call lhm_fnc_setAlivePos; 
  }; 
 }; 
}; 
 
_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]]; 
_queryResult set[15,_keyArr]; 
 
//diag_log format ["queryResult formatted: %1",_queryResult]; 
 
// Query Wanted List... 
_wanted = [_uid,_side] spawn lhm_fnc_query_wantedlist; 
waitUntil {ScriptDone _wanted}; 
 
[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] call lhm_fnc_mp;