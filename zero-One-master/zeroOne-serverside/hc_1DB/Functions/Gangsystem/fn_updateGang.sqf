private["_mode","_data","_owner","_gangID","_gangName","_gangKonto","_gangMember","_query","_queryResult","_leader","_maxmember","_house","_gangTag"]; 
_owner = param[0,-1,[-1]]; 
_mode = param[1,-1,[-1]]; 
_data = param[2,[],[[]]]; 
 
if(_owner isEqualTo -1) exitWith {diag_log format ["updateGang _owner %1", _this]}; 
if(_data isEqualTo [] || _mode isEqualTo -1 ) exitWith {diag_log format ["updateGang _this %1", _this];}; 
 
_gangID = _data select 0; 
if(isNil "_gangID") exitWith {diag_log format ["updateGang _gangID %1",_this]}; 
_query = ""; 
switch (_mode) do 
{ 
 case 0: //update member 
 { 
  _gangMember = _data select 1; 
  if(_gangMember isEqualTo []) exitWith { diag_log format ["updateGang _gangMember %1", _this]}; 
  _query = format ["updateMember:%1:%2",_gangMember,_gangID]; 
 }; 
 
 case 1: //update bank 
 { 
  _gangKonto = _data select 1; 
  if !((typeName _gangKonto) isEqualTo (typeName 0)) exitWith { diag_log format ["updateGang _gangKonto %1", _this]}; 
  _gangKonto = [_gangKonto] call DB2_fnc_numberSafe; 
  _query = format ["updateGangBank:%1:%2",_gangKonto,_gangID]; 
 }; 
 
 case 2: //update name 
 { 
  _gangName = _data select 1; 
  _gangKonto = _data select 2; 
  if (_gangName isEqualTo "") exitWith { diag_log format ["updateGang _gangName %1", _gangName]}; 
  if !((typeName _gangKonto) isEqualTo (typeName 0)) exitWith { diag_log format ["updateGang _gangKonto %1", _this]}; 
  _gangKonto = [_gangKonto] call DB2_fnc_numberSafe; 
  _query = format ["updateGangName:%1:%2:%3",_gangName,_gangKonto,_gangID]; 
 }; 
 
 case 3: //update leader 
 { 
  _leader = _data select 1; 
  if (_leader isEqualTo "") exitWith { diag_log format ["updateGang _leader %1", _this]}; 
  _query = format ["updateGangLeader:%1:%2",_leader,_gangID]; 
 }; 
 
 case 4: //update maxmember 
 { 
  _maxmember = _data select 1; 
  _gangKonto = _data select 2; 
  if !((typeName _maxmember) isEqualTo (typeName 0)) exitWith { diag_log format ["updateGang _maxmember %1", _this]}; 
  if !((typeName _gangKonto) isEqualTo (typeName 0)) exitWith { diag_log format ["updateGang _maxmember %1", _this]}; 
  _maxmember = [_maxmember] call DB2_fnc_numberSafe; 
  _gangKonto = [_gangKonto] call DB2_fnc_numberSafe; 
  _query = format ["updateGangMaxMember:%1:%2:%3",_maxmember,_gangKonto,_gangID]; 
 }; 
 
 case 5: //update house 
 { 
  _house = _data select 1; 
  _gangKonto = _data select 2; 
  if(_house isEqualTo [] || {(_house select 0) isEqualTo []}) exitWith { diag_log format ["updateGang _house %1", _this]}; 
  if !((typeName _gangKonto) isEqualTo (typeName 0)) exitWith { diag_log format ["updateGang _house %1", _this]}; 
  _gangKonto = [_gangKonto] call DB2_fnc_numberSafe; 
  _query = format ["updateGangHouse:%1:%2:%3",_house,_gangKonto,_gangID]; 
 }; 
 
 case 6: //remove house 
 { 
  _query = format ["removeGangHouse:%1",_gangID]; 
 }; 
 
 case 7: //update tag 
 { 
  _gangTag = _data select 1; 
  _gangKonto = _data select 2; 
  if (_gangTag isEqualTo "") exitWith { diag_log format ["updateGang _gangTag %1", _this]}; 
  if !((typeName _gangKonto) isEqualTo (typeName 0)) exitWith { diag_log format ["updateGang _gangTag %1", _this]}; 
  _gangKonto = [_gangKonto] call DB2_fnc_numberSafe; 
  _query = format ["updateGangTag:%1:%2:%3",_gangTag,_gangKonto,_gangID]; 
 }; 
 
 case 8: //update player gangid 
 { 
  _uid = _data select 1; 
  _side = _data select 2; 
  if(_side isEqualTo civilian) then { 
      _query = format ["updatePlayerGangIDCiv:%1:%2",_gangID,_uid]; 
  }else{ 
      _query = format ["updatePlayerGangIDReb:%1:%2",_gangID,_uid]; 
  }; 
 }; 
 
 case 9: //update player gangid 
 { 
  _uid = _data select 1; 
  if(count _data > 2) then { 
      _query = format ["resetPlayerGangIDCiv:%1:%2",_gangID,_uid]; 
  }else{ 
      _data pushBack 1; 
      [_owner,9,_data] spawn hc_fnc_updateGang; 
      _query = format ["resetPlayerGangIDReb:%1:%2",_gangID,_uid]; 
  }; 
 }; 
 
 default 
 { 
  _query = ""; 
 }; 
}; 
if(_query isEqualTo "") exitWith { diag_log format ["updateGang _mode %1 query leer", _mode]}; 
[_query,1] call DB2_fnc_extdbcallHC; 
