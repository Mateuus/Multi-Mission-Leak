/* 
    File: fn_updateLocker 
    Author: Dirk Pitt 
    Zero-One Altis Life 
    primWeapon, secWeapon, handgun, magazine, attachment, uniform, vest, backpack, headgear, glasses, item 
*/ 
private ["_uid","_data","_primWeapon","_secWeapon","_handgun","_magazine","_attachment","_uniform","_vest","_backpack","_headgear","_glasses","_item","_query","_side"]; 
_uid = param[0,"",[""]]; 
_side = param[1,sideUnknown,[sideUnknown]]; 
_data = param[2,[],[[]]]; 
 
if(_uid isEqualTo "" || _side isEqualTo sideUnknown || _data isEqualTo [] || (count _data) < 11) then {diag_log format["updateLocker error %1",_this]}; 
 
diag_log format["updateLocker _data: %1",_data]; 
 
_primWeapon = _data select 0; 
_secWeapon = _data select 1; 
_handgun = _data select 2; 
_magazine = _data select 3; 
_attachment = _data select 4; 
_uniform = _data select 5; 
_vest = _data select 6; 
_backpack = _data select 7; 
_headgear = _data select 8; 
_glasses = _data select 9; 
_item = _data select 10; 
 
_query = format["updateLocker:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13",_primWeapon,_secWeapon,_handgun,_magazine,_attachment,_uniform,_vest,_backpack,_headgear,_glasses,_item,_uid,_side]; 
[_query,1,false] call DB2_fnc_extdbcallHC; 
