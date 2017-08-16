/* 
 File: sellHouseDB.sqf 
*/ 
private["_house","_houseID","_ownerID","_housePos","_query"]; 
_house = param[0,ObjNull,[ObjNull]]; 
if(isNull _house) exitWith {}; 
 
_houseID = _house getVariable["SOyeKO",-1]; 
if(_houseID isEqualTo -1) then { 
 _housePos = getPosATL _house; 
 _ownerID = (_house getVariable "onUxX") select 0; 
 if (isnil "_ownerID") exitwith { 
  diag_log format ["_house %1 _houseID %2 _housePos %3 Owner %4",_house,_houseID, _housePos,(_house getVariable "onUxX")]; 
  _house setVariable["SOyeKO",nil,true]; 
  _house setVariable["onUxX",nil,true]; 
  _house setVariable["house_sold",nil,true]; 
 }; 
 _query = format["updateHousesowner:%1:%2",_ownerID,_housePos]; 
} else { 
 _query = format["updateHousesowner2:%1",_houseID]; 
}; 
 
_house setVariable["SOyeKO",nil,true]; 
_house setVariable["onUxX",nil,true]; 
[_query,1] call zero_fnc_asyncCall; 
_house setVariable["house_sold",nil,true]; 
