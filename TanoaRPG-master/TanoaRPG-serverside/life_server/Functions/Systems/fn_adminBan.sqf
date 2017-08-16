/* 
 File: fn_adminBan.sqf 
 Author: CooliMC "Marc" 
  
 Description: 
 Ban online/offline player and get player guids 
 YOU ARE NOT ALLOWED TO STEEL THIS SCRIPT OR USE/MODIFY IT !!! 
*/ 
 
private["_author","_mode","_varibales","_query"]; 
 
_author = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_mode = [_this,1,-1] call BIS_fnc_param; 
_varibales = [_this,2,"",[""]] call BIS_fnc_param; 
_query = ""; 
 
if(isNull _author) exitWith {}; 
if(_mode == -1) exitWith {}; 
 
 
switch(_mode) do 
{ 
 //Search GUIDs from ALL Online Players and sends it back to the Client 
 case 0: 
 { 
  ["CALL addGUID", 1] call DB_fnc_asyncCall; 
  _query = "SELECT playerid,guid FROM players WHERE playerid = '00000'"; 
   
  { 
   _query = format["%1 %2%3%4", _query, "|| playerid = '", getPlayerUID _x, "'"]; 
  } foreach allPlayers; 
   
  if(_query != "") then 
  { 
   _query = ([_query, 2, true] call DB_fnc_asyncCall); 
   [_query, {life_onlineListGUIDs = _this; life_waitforGUIDs = false;}] remoteExec ["BIS_FNC_SPAWN", _author]; 
   [_author, objNull, 1, "[ADMIN-Menu]", "Hat sich die GUIDs aller verbundenen Spieler anzeigen lassen"] remoteExec ["TEX_FNC_LOGIT", 2]; 
  }; 
 }; 
  
 //Search Parts of PlayerID and send it back to Client with (Name, Playerid, GUID) 
 case 1: 
 { 
  if(_varibales != "") then 
  { 
   ["CALL addGUID", 1] call DB_fnc_asyncCall; 
   _query = format["SELECT name,playerid,guid FROM players WHERE playerid LIKE '%1%2%1'", "%", _varibales]; 
    
   if(_query != "") then 
   { 
    _query = ([_query, 2, true] call DB_fnc_asyncCall); 
    [_query, {life_searchGUIDs = _this; life_waitforGUIDs = false;}] remoteExec ["BIS_FNC_SPAWN", _author]; 
    [_author, objNull, 1, "[ADMIN-Menu]", format["Hat nach folgender Playerid (oder Teilen) gesucht: %1", _varibales]] remoteExec ["TEX_FNC_LOGIT", 2]; 
   }; 
  }; 
 }; 
  
 //Ban GUID 
 case 2: 
 { 
  if(_varibales != "") then 
  { 
   "ArmaLeakTeam" serverCommand format["#beserver addBan %1", _varibales]; 
   "ArmaLeakTeam" serverCommand "#beserver loadBans"; 
   [_author, objNull, 1, "[ADMIN-Menu]", format["Hat folgenden Ban ausgesprochen [GUID|MINUTEN|GRUND]: %1", _varibales]] remoteExec ["TEX_FNC_LOGIT", 2]; 
  }; 
 }; 
  
 //Search GUID or Parts of it 
 case 3: 
 { 
  if(_varibales != "") then 
  { 
   ["CALL addGUID", 1] call DB_fnc_asyncCall; 
   _query = format["SELECT name,playerid,guid FROM players WHERE guid LIKE '%1%2%1'", "%", _varibales]; 
    
   if(_query != "") then 
   { 
    _query = ([_query, 2, true] call DB_fnc_asyncCall); 
    [_query, {life_searchGUIDs = _this; life_waitforGUIDs = false;}] remoteExec ["BIS_FNC_SPAWN", _author]; 
    [_author, objNull, 1, "[ADMIN-Menu]", format["Hat nach folgender GUID (oder Teilen) gesucht: %1", _varibales]] remoteExec ["TEX_FNC_LOGIT", 2]; 
   }; 
  }; 
 }; 
  
 //Search Name or Parts of it 
 case 4: 
 { 
  if(_varibales != "") then 
  { 
   ["CALL addGUID", 1] call DB_fnc_asyncCall; 
   _query = format["SELECT name,playerid,guid FROM players WHERE name LIKE '%1%2%1'", "%", _varibales]; 
 
   if(_query != "") then 
   { 
    _query = ([_query, 2, true] call DB_fnc_asyncCall); 
    [_query, {life_searchGUIDs = _this; life_waitforGUIDs = false;}] remoteExec ["BIS_FNC_SPAWN", _author]; 
    [_author, objNull, 1, "[ADMIN-Menu]", format["Hat nach folgendem Namen (oder Teilen) gesucht: %1", _varibales]] remoteExec ["TEX_FNC_LOGIT", 2]; 
   }; 
  }; 
 }; 
}; 
 
 
