/* 
* Queries data from db 
* 
*/ 
private["_cmd", "_house", "_args", "_player", "_query", "_queryResult","_1"]; 
 
_cmd = _this select 0; 
_house = _this select 1; 
_args = _this select 2; 
_player = _this select 3; 
 
 
 
 
_query =  format["SELECT id,owner,price,home_group,name,marker_spawn,marker_car_spawn,inventory,owned,price_sell,inventory_weight,ownername,inventory_maxweight,upgrade_safe,safe_inventory,trustedpersons,buyable,VIP FROM homes WHERE name='%1' ", _house]; 
 
 
_aa = [[]]; 
 
 
 
 
_1 = [_query,2] call DB_fnc_asyncCall; 
 
_1 = call compile format["%1", _1]; 
 
 
_1 = call compile format["[%1]", _1]; 
 
 
//_queryResult = call compile format["%1", _queryResult]; 
//COMPILE RESULT IN TARGET 
 
//SEND TO MISSION 
// Sending [_cmd, _house, _args, _sql] to houseExec 
[ [_cmd, _house, _args, _1] ,"EMonkeys_fnc_houseExecCommand",_player,false] call EMonkeys_fnc_mp;