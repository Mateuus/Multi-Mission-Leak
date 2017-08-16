/* 
* Finds nearest house and execs WRITEDATA to it 
* RETURNS RESULT IF COND IS MET 
*/ 
private["_cmd", "_maxrange", "_args", "_player", "_result", "_query","_query_update", "_cond", "_setarr", "_marker", "_house"]; 
 
_cmd = _this select 0; 
_maxrange = _this select 1; 
_args = _this select 2; 
_player = _this select 3; 
_setarr = _this select 4; 
_cond = _this select 5; 
 
 
 
//QUERY All player houses 
_query = format ["SELECT name, marker_spawn FROM homes WHERE owner='%1'", getPlayerUID _player]; 
 
_result = [_query,2,true] call DB_fnc_asyncCall; 
_rows = call compile format["%1",_result]; //compile data 
 
 
 
_result = call compile format["%1", _result]; //compile data 
 
 
_house = ""; 
 
//Search for house in range 
{   
  _marker = _x select 1; 
   
  if( _player distance (getMarkerPos _marker) < _maxrange) exitWith 
  { 
    
   //Send to writeData 
   _house = _x select 0; 
  }; 
} 
foreach (_result); 
 
if(_house == "") then 
{ 
 //SEND TO MISSION 
 // Sending [_cmd, _house, _args, _sql] to houseExec 
 [ [_cmd, _house, _args, false] ,"EMonkeys_fnc_houseExecCommand",_player,false] call EMonkeys_fnc_mp; 
} 
else 
{ 
 [_cmd, _house, _args, _player, _setarr, _cond] call HOUSE_fnc_writeData; 
}; 
 
