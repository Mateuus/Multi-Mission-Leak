/* 
 
 Gives Key to player 
  
 f [ player, house_name] 
 
*/ 
 
private["_house","_unit","_dst_uid","_dst_name"]; 
 
_unit = _this select 0; 
_house = _this select 1; 
 
 
 
 
 
_setarr = [ ["trustedpersons","'[]'" ] ]; 
 
["EMonkeys_fnc_houseExecResetKeys", _house, [_house], _unit, _setarr, format["owned='1' AND owner='%1'", getPlayerUID _unit] ] call HOUSE_fnc_writeData;