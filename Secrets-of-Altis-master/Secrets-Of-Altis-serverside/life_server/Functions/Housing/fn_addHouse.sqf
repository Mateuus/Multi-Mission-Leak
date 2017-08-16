 
 
 
 
 
 
private["_house","_uid","_housePos","_query"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_scriptname = _this select 2; 
if(isNull _house OR _uid == "") exitWith {}; 
if(_uid == "99999999999999999999999999") exitWith {}; 
if(_scriptname != "houseadd") exitWith {}; 
 
_housePos = getPosATL _house; 
_query = format["INSERT INTO houses (pid, pos, inventory, containers, owned) VALUES('%1', '%2', '""[[],0]""', '""[]""', '1')",_uid,_housePos]; 
[_query,1] call DB_fnc_asyncCall; 
sleep 0.3; 
_query = format["SELECT id FROM houses WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid]; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
_house setVariable["house_id",(_queryResult select 0),true];