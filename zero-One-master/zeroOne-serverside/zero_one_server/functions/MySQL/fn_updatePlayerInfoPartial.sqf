/* 
 File: updatePlayerInfoPartial.sqf 
*/ 
private["_uid","_side","_value","_mode","_query","_bool","_playerGear","_locker"]; 
_uid = param[0,"",[""]]; 
_side = param[1,sideUnknown,[civilian]]; 
_mode = param[3,-1,[0]]; 
 
if(_uid isEqualTo "" OR _side isEqualTo sideUnknown) exitWith {}; 
_query = ""; 
 
switch(_mode) do { 
 case 1: { 
  _value = param[2,[],[[]]]; 
  switch(_side) do { 
   case west: {_query = format["updatePlayerCopMoney:%1:%2:%3",[_value select 0] call zero_fnc_numberSafe,[_value select 1] call zero_fnc_numberSafe,_uid];}; 
   case civilian: {_query = format["updatePlayerMoney:%1:%2:%3",[_value select 0] call zero_fnc_numberSafe,[_value select 1] call zero_fnc_numberSafe,_uid];}; 
   case independent: {_query = format["updatePlayerMedMoney:%1:%2:%3",[_value select 0] call zero_fnc_numberSafe,[_value select 1] call zero_fnc_numberSafe,_uid];}; 
   case east: {_query = format["updatePlayerMoney:%1:%2:%3",[_value select 0] call zero_fnc_numberSafe,[_value select 1] call zero_fnc_numberSafe,_uid];}; 
  }; 
 }; 
 
 case 2: { 
  _value = param[2,[],[[]]]; 
  for "_i" from 0 to count(_value)-1 do { 
   _bool = [(_value select _i) select 1] call zero_fnc_bool; 
   _value set[_i,[(_value select _i) select 0,_bool]]; 
  }; 
  _value = [_value] call zero_fnc_mresArray; 
  switch(_side) do { 
   case west: {_query = format["updatePlayerLizCop:%1:%2",_value,_uid];}; 
   case civilian: {_query = format["updatePlayerLizCiv:%1:%2",_value,_uid];}; 
   case independent: {_query = format["updatePlayerLizMed:%1:%2",_value,_uid];}; 
   case east: {_query = format["updatePlayerLizCiv:%1:%2",_value,_uid];}; 
  }; 
 }; 
 
 case 3: { 
  _playerGear = param[2,[],[[]]]; 
  _playerGear = [_playerGear] call zero_fnc_mresArray; 
  switch(_side) do { 
   case civilian: {_query = format["updatePlayerGearCiv:%1:%2",_playerGear,_uid];}; 
   case east: {_query = format["updatePlayerGearReb:%1:%2",_playerGear,_uid];}; 
  }; 
 }; 
 
 case 4: { 
  _value = param[2,false,[true]]; 
  _value = [_value] call zero_fnc_bool; 
  _query = format["updatePlayerJail:%1:%2",_value,_uid]; 
 }; 
 
 case 5: { 
  _value = param[2,false,[true]]; 
  _value = [_value] call zero_fnc_bool; 
  _query = format["updatePlayerArrest:%1:%2",_value,_uid]; 
 }; 
 case 6: { 
  _value = param[2,0,[0]]; 
  _value = [_value] call zero_fnc_numberSafe; 
  switch(_side) do { 
   case west: {_query = format["updatePlayerCopOnline:%1:%2",_value,_uid];}; 
   case civilian: {_query = format["updatePlayerOnline:%1:%2",_value,_uid];}; 
   case independent: {_query = format["updatePlayerMedOnline:%1:%2",_value,_uid];}; 
   case east: {_query = format["updatePlayerOnline:%1:%2",_value,_uid];}; 
  }; 
 }; 
}; 
if(_query isEqualTo "") exitWith {}; 
[_query,1] call zero_fnc_asyncCall; 
