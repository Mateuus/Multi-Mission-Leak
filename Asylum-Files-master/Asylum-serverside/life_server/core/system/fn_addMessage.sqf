 
 
 
 
 
 
 
 
private["_uid","_unit","_message","_money","_query","_player"]; 
 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_message = [_this,2,"No message",[""]] call BIS_fnc_param; 
_money = [_this,3,0,[0]] call BIS_fnc_param; 
 
_player = objNull; 
{ 
if (getPlayerUID _x == _uid) then { _player = _x; }; 
} forEach allPlayers; 
 
if (isNull _player) then 
{ 
_query = format["INSERT INTO `arma3life`.`messages` (playerid,sender,sendname,message,money) VALUES ('%1', '%2', '%3', '%4')", _uid, getPlayerUID _unit, name _unit, _money]; 
[_query,2] call DB_fnc_asyncQuery; 
} 
else 
{ 
[[[0,1],_message],"life_fnc_broadcast",_player,false] spawn life_fnc_MP; 
if (_money > 0) then 
{ 
[["atm","add",_money],"life_fnc_uC",_player,false] spawn life_fnc_MP; 
}; 
};