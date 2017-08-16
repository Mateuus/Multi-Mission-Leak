/* 
 LÖSCHEN, IST UNNÖTIG 
*/ 
private["_house"]; 
_house = param[0,ObjNull,[ObjNull]]; 
if(isNull _house) exitWith {}; 
 
_trunkData = _house getVariable["Koffer",[[],0]]; 
_houseID = _house getVariable["SOyeKO",-1]; 
 
if(_houseID == -1) exitWith {}; //Dafuq? 
 
_trunkData = [_trunkData] call zero_fnc_mresArray; 
_query = format["updateHousesinv:%1:%2",_trunkData,_houseID]; 
[_query,1] call zero_fnc_asyncCall; 
