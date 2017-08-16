/* 
 File: fn_locker.sqf 
 Author: Dirk Pitt 
 Zero-One Altis Life 
    primWeapon, secWeapon, handgun, magazine, attachment, uniform, vest, backpack, headgear, glasses, item 
*/ 
private ["_uid","_side","_query","_return","_owner"]; 
_owner = param[0,-1,[0]]; 
_uid = param[1,"",[""]]; 
_side = param[2,sideUnknown,[sideUnknown]]; 
 
if(_owner isEqualTo -1 || _uid isEqualTo "" || _side isEqualTo sideUnknown) exitWith {diag_log format["locker error %1",_this]}; 
 
_query = format["selectLocker:%1:%2",_uid,_side]; 
_return = [_query,2,false] call DB2_fnc_extdbcallHC; 
 
if((typeName _return == "STRING") || (_return isEqualTo []) ||(count _return < 11)) then { 
 _query = format["addLocker:%1:%2:[]:[]:[]:[]:[]:[]:[]:[]:[]:[]:[]",_uid,_side]; 
 [_query,1,false] call DB2_fnc_extdbcallHC; 
 _return = [[],[],[],[],[],[],[],[],[],[],[]]; 
}; 
diag_log format["locker _return: %1",_return]; 
[7,_return] remoteExec ['zero_fnc_yaxyEMy',_owner]; 
