/* 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Takes partial data of a player and updates it, this is meant to be 
 less network intensive towards data flowing through it for updates. 
*/ 
private["_uid","_side","_value","_mode","_query"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param; 
_mode = [_this,3,-1,[0]] call BIS_fnc_param; 
 
if(_uid == "" OR _side == sideUnknown) exitWith {}; //Bad. 
_query = ""; 
 
switch (_mode) do { 
 case 0: { 
  _value = [_this,2,0,[0]] call BIS_fnc_param; 
  _value = [_value] call DB_fnc_numberSafe; 
 
        switch (_side) do { 
            case civilian: {_query = format["playerCivilianUpdateCash:%1:%2",_value,_uid];}; 
            case west: {_query = format["playerWestUpdateCash:%1:%2",_value,_uid];}; 
            case independent: {_query = format["playerIndependentUpdateCash:%1:%2",_value,_uid];}; 
            case east: {_query = format["playerEastUpdateCash:%1:%2",_value,_uid];}; 
        }; 
 }; 
 
 case 1: { 
  _value = [_this,2,0,[0]] call BIS_fnc_param; 
  _value = [_value] call DB_fnc_numberSafe; 
 
        switch (_side) do { 
            case civilian: {_query = format["playerCivilianUpdateBank:%1:%2",_value,_uid];}; 
            case west: {_query = format["playerWestUpdateBank:%1:%2",_value,_uid];}; 
            case independent: {_query = format["playerIndependentUpdateBank:%1:%2",_value,_uid];}; 
            case east: {_query = format["playerEastUpdateBank:%1:%2",_value,_uid];}; 
        }; 
 }; 
 
 case 2: { 
  _value = [_this,2,[],[[]]] call BIS_fnc_param; 
  //Does something license related but I can't remember I only know it's important? 
  for "_i" from 0 to count(_value)-1 do { 
   _bool = [(_value select _i) select 1] call DB_fnc_bool; 
   _value set[_i,[(_value select _i) select 0,_bool]]; 
  }; 
  switch(_side) do { 
            case civilian: {_query = format["playerCivilianUpdateLicense:%1:%2",_value,_uid];}; 
   case west: {_query = format["playerWestUpdateLicense:%1:%2",_value,_uid];}; 
   case independent: {_query = format["playerIndependentUpdateLicense:%1:%2",_value,_uid];}; 
            case east: {_query = format["playerEastUpdateLicense:%1:%2",_value,_uid];}; 
  }; 
 }; 
 
 case 3: { 
  _value = [_this,2,[],[[]]] call BIS_fnc_param; 
  switch(_side) do { 
            case civilian: {_query = format["playerCivilianUpdateGear:%1:%2",_value,_uid];}; 
   case west: {_query = format["playerWestUpdateGear:%1:%2",_value,_uid];}; 
   case independent: {_query = format["playerIndependentUpdateGear:%1:%2",_value,_uid];}; 
            case east: {_query = format["playerEastUpdateGear:%1:%2",_value,_uid];}; 
  }; 
 }; 
 
 case 4: { 
  _value = [_this,2,false,[true]] call BIS_fnc_param; 
  _value = [_value] call DB_fnc_bool; 
  _query = format["playerUpdateAlive:%1:%2",_value,_uid]; 
 }; 
 
 case 5: { 
  _value = [_this,2,false,[true]] call BIS_fnc_param; 
 
  if (_value) then { 
   _value = [_value] call DB_fnc_bool; 
   _query = format["playerUpdateArrested:%1:%2",_value,_uid]; 
  } else { 
   _value = [_value] call DB_fnc_bool; 
   _query = format["playerUpdateArrested+JailTime:%1:%2:%3",_value,0,_uid]; 
  }; 
 }; 
 
 case 6: { 
  _value1 = [_this,2,0,[0]] call BIS_fnc_param; 
  _value2 = [_this,4,0,[0]] call BIS_fnc_param; 
  _value1 = [_value1] call DB_fnc_numberSafe; 
  _value2 = [_value2] call DB_fnc_numberSafe; 
 
        switch (_side) do { 
            case civilian: {_query = format["playerCivilianUpdateBank+Cash:%1:%2:%3",_value1,_value2,_uid];}; 
            case west: {_query = format["playerWestUpdateBank+Cash:%1:%2:%3",_value1,_value2,_uid];}; 
            case independent: {_query = format["playerIndependentUpdateBank+Cash:%1:%2:%3",_value1,_value2,_uid];}; 
            case east: {_query = format["playerEastUpdateBank+Cash:%1:%2:%3",_value1,_value2,_uid];}; 
        }; 
 }; 
 
 case 7: { 
  _array = [_this,2,[],[[]]] call BIS_fnc_param; 
  [_uid,_side,_array,0] call TON_fnc_keyManagement; 
 }; 
 
    case 8: { 
        // mobile provider 
        _value1 = [_this,2,"",[""]] call BIS_fnc_param; 
 
        // cash 
        _value2 = [_this,4,0,[0]] call BIS_fnc_param; 
        _value2 = [_value2] call DB_fnc_numberSafe; 
 
 
        switch(_side) do { 
            case civilian: {_query = format["playerCivilianUpdateCash+MobileProvider:%1:%2:%3", _value2, _value1, _uid];}; 
            case east: {_query = format["playerEastUpdateCash+MobileProvider:%1:%2:%3", _value2, _value1, _uid];}; 
        }; 
    }; 
  
 case 9: { 
  // aliases 
  _value1 = [_this, 2, [], [[]]] call BIS_fnc_param; 
  _query = format["playerAliasesUpdate:%1:%2", _value1, _uid]; 
 } 
}; 
 
if(_query == "") exitWith {}; 
waitUntil {!DB_Async_Active}; 
[_query,1] call DB_fnc_asyncCall;