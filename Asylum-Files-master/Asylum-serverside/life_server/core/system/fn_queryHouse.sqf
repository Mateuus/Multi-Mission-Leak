 
 
 
 
 
 
 
 
private["_id","_unit","_owner","_sale"]; 
 
_id = [_this,0,"0",["0"]] call BIS_fnc_param; 
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_worldspace = [_this,2,[],[[]]] call BIS_fnc_param; 
 
_query = format["SELECT id,oid,owners,sale FROM `asylumlife%1`.`houses` WHERE `oid`='%3' OR `worldspace`='%2'", life_server_instance, _worldspace, _id]; 
_row = [_query,2,true] call DB_fnc_asyncQuery; 
 
_owner = ""; 
_sale = 0; 
if (count _row > 0) then 
{ 
_row = _row select 0; 
_owner = format["%1", _row select 2]; 
_sale = _row select 3; 
}; 
 
[[_id,_owner,_sale],"life_fnc_receiveOwner",_unit,false] spawn life_fnc_MP;