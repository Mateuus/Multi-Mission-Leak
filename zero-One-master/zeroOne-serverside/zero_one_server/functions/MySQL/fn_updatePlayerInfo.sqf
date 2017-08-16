/* 
 File: fn_updatePlayerInfo.sqf 
*/ 
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread","_arrested","_locker","_skill","_bool"]; 
_uid = param[0,"",[""]]; 
_name = param[1,"",[""]]; 
_side = param[2,sideUnknown,[civilian]]; 
_cash = param[3,0,[0]]; 
_bank = param[4,5000,[0]]; 
_licenses = param[5,[],[[]]]; 
_gear = param[6,[],[[]]]; 
_arrested = param[7,false,[false]]; 
_skill = param[8,[],[[]]]; 
 
if((_uid isEqualTo "") OR (_name isEqualTo "")) exitWith {}; 
 
_name = [_name] call zero_fnc_mresString; 
_gear = [_gear] call zero_fnc_mresArray; 
_cash = [_cash] call zero_fnc_numberSafe; 
_bank = [_bank] call zero_fnc_numberSafe; 
 
for "_i" from 0 to count(_licenses)-1 do { 
 _bool = [(_licenses select _i) select 1] call zero_fnc_bool; 
 _licenses set[_i,[(_licenses select _i) select 0,_bool]]; 
}; 
 
_licenses = [_licenses] call zero_fnc_mresArray; 
_arrested = [_arrested] call zero_fnc_bool; 
_skill = [_skill] call zero_fnc_mresArray; 
 
switch (_side) do { 
 case west: {_query = format["updatePlayerWest:%1:%2:%3:%4:%5:%6",_cash,_bank,_licenses,_gear,_skill,_uid];}; 
 case civilian: {_query = format["updatePlayerCiv:%1:%2:%3:%4:%5:%6:%7",_cash,_bank,_licenses,_gear,_arrested,_skill,_uid];}; 
 case independent: {_query = format["updatePlayerIndep:%1:%2:%3:%4:%5:%6",_cash,_bank,_licenses,_gear,_skill,_uid];}; 
 case east: {_query = format["updatePlayerReb:%1:%2:%3:%4:%5:%6:%7",_cash,_bank,_licenses,_gear,_arrested,_skill,_uid];}; 
}; 
if (isnil "_query") exitWith {diag_log format["Error Update:%1:%2:%3:%4:%5:%6",_cash,_bank,_licenses,_gear,_skill,_uid];}; 
[_query,1] call zero_fnc_asyncCall; 
