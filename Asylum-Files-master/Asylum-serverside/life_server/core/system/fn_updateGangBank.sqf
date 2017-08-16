 
 
 
 
 
 
 
private ["_id","_modifier","_amount","_cash"]; 
 
_id = [_this,0,"0",["0"]] call BIS_fnc_param; 
_amount = [_this,1,0,[0]] call BIS_fnc_param; 
_modifier = [_this,2,"set",["set"]] call BIS_fnc_param; 
_unit = [_this,3,objNull,[objNull]] call BIS_fnc_param; 
 
_gang = []; 
{ if (_id == (_x select 0)) then { _gang = _x; }; } foreach life_server_gangs; 
if (count _gang < 1) exitWith {}; 
_cash = _gang select 5; 
_memberCount = _gang select 6; 
_cap = _memberCount * life_gangbank_cap; 
if (_cap > 2500000) then { _cap = 2500000; }; 
if (_modifier in ["add","set"] && (_cash + _amount) > _cap) exitWith 
{ 
[[1,format["Your gang bank can not hold more than $%1, which scales by gang size. Deposit aborted.", [_cap] call life_fnc_numberText]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; 
}; 
 
switch (_modifier) do 
{ 
case "add": { _cash = _cash + _amount; [["cash","take",_amount],"life_fnc_uC",_unit,false] spawn life_fnc_MP;[[996, _unit, format["Deposited $%1 in gang (%2) bank. Server: %3", _amount,_id,life_server_instance]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;}; 
case "take": { _cash = _cash - _amount; [["cash","add",_amount],"life_fnc_uC",_unit,false] spawn life_fnc_MP;[[997, _unit, format["Withdrew $%1 from the gang (%2) bank. Server: %3", _amount,_id,life_server_instance]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;}; 
case "set": { _cash = _amount; }; 
}; 
 
_index = -1; 
{ if (_id == (_x select 0)) then { _index = _forEachIndex; }; } foreach life_server_gangs; 
if (_index < 0) exitWith {}; 
 
_gang set[5, _cash]; 
life_server_gangs set [_index, _gang]; 
 
[_id, 0, 0, _cash] spawn DB_fnc_updateGang;