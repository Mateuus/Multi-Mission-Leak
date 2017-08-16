/* 
 File: fn_wantedRemove.sqf 
*/ 
private["_uid","_index","_name"]; 
_uid = param[0,"",[""]]; 
_name = param[1,"",[""]]; 
if(_uid isEqualTo "") exitWith {}; 
_index = [_name,tFHiSiX] call zero_fnc_oKzQhZKu; 
if(_uid in jailedUnits) then { 
        jailedUnits = jailedUnits - [_uid]; 
}; 
if(_index isEqualTo -1) exitWith {}; 
tFHiSiX deleteAt _index; 
