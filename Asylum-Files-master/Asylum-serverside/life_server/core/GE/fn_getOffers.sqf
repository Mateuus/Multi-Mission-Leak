 
 
 
 
 
 
 
 
 
private["_pid","_side","_type","_unit","_ret","_tickTime","_queryResult"]; 
_pid = param [0,"",[""]]; 
_unit = param [1,ObjNull,[ObjNull]]; 
_toCheck = param [2,false,[false]]; 
 
 
_query = ""; 
if(_toCheck) then { 
_buyorsell = param [3,0,[0]]; 
_uid = param [4,"",[""]]; 
if(_buyorsell > 1) then { 
_buyorsell = _buyorsell - 2; 
_query = format["SELECT ID, ClassName, Price, isVirtual, isWeapon, isVehicle, Amount, BuyorSell, VehicleID, name FROM Exchange WHERE active='1' AND BuyorSell='%2' AND NOT pid='%1'",_uid,_buyorsell]; 
} else { 
_query = format["SELECT ID, ClassName, Price, isVirtual, isWeapon, isVehicle, Amount, BuyorSell, VehicleID, name FROM Exchange WHERE ClassName LIKE '%2%1%2' AND active='1' AND BuyorSell='%3' AND NOT pid='%4'",_pid,"%",_buyorsell,_uid]; 
}; 
} else { 
_query = format["SELECT ID, ClassName, Price, isVirtual, isWeapon, isVehicle, Amount, BuyorSell, VehicleID, name FROM Exchange WHERE pid='%1' AND active='1'",_pid]; 
}; 
_queryResult = [_query,2,true] call DB_fnc_asyncQuery;  
 
 
if(typeName _queryResult == "STRING") exitWith { 
[[]] remoteExec ["life_fnc_GEMenu",_unit,false]; 
}; 
 
[_queryResult] remoteExec ["KBW_fnc_GEMenu",_unit,false];