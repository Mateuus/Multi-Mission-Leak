 
 
 
 
 
 
 
 
private["_vid","_sp","_pid","_query","_sql","_type"]; 
_vid = [_this,0,-1,[0]] call BIS_fnc_param; 
_pid = [_this,1,"",[""]] call BIS_fnc_param; 
_sp = [_this,2,2500,[0]] call BIS_fnc_param; 
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param; 
_type = [_this,4,"",[""]] call BIS_fnc_param; 
 
if(_vid == -1 OR _pid == "" OR _sp == 0 OR isNull _unit OR _type == "") exitWith {}; 
 
_query = format["DELETE FROM %3 WHERE id='%1' AND pid='%2'",_vid,_pid,srv_table_vehicles]; 
[_query] call DB_fnc_asyncQuery; 
 
 
 
_qty = _type call life_fnc_getQuantity; 
_sp = [_type,_sp,_qty,false] call life_fnc_calcPrice; 
 
[[[_sp,_type],{["atm","add",(_this select 0)] call life_fnc_uC; hint format["You sold that vehicle for $%1",[(_this select 0)] call life_fnc_numberText];}],"BIS_fnc_call",_unit,false] spawn life_fnc_MP; 
 
[139, _unit, format["%1 sold %2 for %3", name _unit, _type, [_sp] call life_fnc_numberText]] spawn ASY_fnc_logIt;