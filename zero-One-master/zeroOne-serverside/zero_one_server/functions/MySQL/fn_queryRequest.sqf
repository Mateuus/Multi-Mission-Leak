/* 
 File: fn_queryRequest.sqf 
*/ 
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_old","_owner","_tmp","_time","_profilname","_data","_new"]; 
_uid = param[0,"",[""]]; 
_side = param[1,sideUnknown,[civilian]]; 
_owner = param[2,ObjNull,[ObjNull]]; 
_time = param[3,0,[0]]; 
 
if(isNull _owner) exitWith {}; 
_ownerID = owner _owner; 
_profilname = name _owner; 
 
_query = switch(_side) do { 
 case west: {format["playerWestInfo:%1",_uid];}; 
 case civilian: {format["playerCivInfo:%1",_uid];}; 
 case independent: {format["playerMedInfo:%1",_uid];}; 
 case east: {format["playerRebInfo:%1",_uid];}; 
}; 
 
_queryResult = [_query,2] call zero_fnc_asyncCall; 
if(typeName _queryResult == "STRING") exitWith {[] remoteExecCall ["zero_fnc_eFQYSapu",_ownerID];}; 
if(_queryResult isEqualTo []) exitWith {[] remoteExecCall ["zero_fnc_eFQYSapu",_ownerID];}; 
if(count _queryResult < 8) exitWith {[] remoteExecCall ["zero_fnc_eFQYSapu",_ownerID];}; 
 
/* 
 0 = playerid 
 1 = name 
 2 = cash 
 3 = bankacc 
 4 = adminlevel 
 5 = licenses 
 6 = arrested/cop-Feuerwehr level 
 7 = gear 
 8 = onlinetime // nach auslesen rückt skill auf 8 nach 
 8 = skill med/cop/civ 
 9 = gangid 
 10 = donator 
*/ 
//onlinetime Check mit Spieler Save 
if (_time > (_queryResult select 8)) then { 
 [_uid,_side,_time,6] call zero_fnc_updatePlayerInfoPartial; 
} else { 
 [(_queryResult select 8)] remoteExecCall ["zero_fnc_Tutf",_ownerID]; 
}; 
_queryResult deleteAt 8; 
 
if (!((_queryResult select 1) isEqualTo _profilname ) || ((_queryResult select 1) isEqualTo "" )  ) then { 
 [(_queryResult select 1),_profilname] remoteExec ["zero_fnc_gCQd",_ownerID]; 
}; 
 
_tmp = _queryResult select 2; 
_queryResult set[2,[_tmp] call zero_fnc_numberSafe]; 
_tmp = _queryResult select 3; 
_queryResult set[3,[_tmp] call zero_fnc_numberSafe]; 
 
_old = _queryResult select 5; 
for "_i" from 0 to (count _old)-1 do 
{ 
 _data = _old select _i; 
 _old set[_i,[_data select 0, ([_data select 1,1] call zero_fnc_bool)]]; 
}; 
_queryResult set[5,_old]; 
 
switch (_side) do { 
 case west: { 
  _new = [(_queryResult select 8)] call zero_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[8,_new]; 
 }; 
 
 case independent: { 
  _new = [(_queryResult select 8)] call zero_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[8,_new]; 
 }; 
 
 default { 
  _queryResult set[6,([_queryResult select 6,1] call zero_fnc_bool)]; 
 
  _new = [(_queryResult select 8)] call zero_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[8,_new]; 
 
        if((_queryResult select 9) == "0") then { 
            _gangData = _uid spawn zero_fnc_queryPlayerGang; 
            waitUntil{scriptDone _gangData}; 
            _queryResult set[9,(missionNamespace getVariable[format["gang_%1",_uid],[]])]; 
            missionNamespace setVariable[format["gang_%1",_uid],nil]; 
        }else{ 
            _queryResult set[9,(_queryResult select 9)]; 
        }; 
 
  _houseData = _uid spawn zero_fnc_fetchPlayerHouses; 
  waitUntil {scriptDone _houseData}; 
  _queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]); 
        missionNamespace setVariable[format["houses_%1",_uid],nil]; 
 }; 
}; 
 
_queryResult remoteExecCall ["zero_fnc_QVvUS",_ownerID]; 
 
if (_uid in zero_one_admin) then { 
    _ownerID publicVariableClient "zero_fnc_adminmenu"; 
}; 
