private _uid = param [0,"",[""]];
private _side = param [1,"",[""]];
private _mode = param [3,-1,[0]];

if (_uid isEqualTo "" OR {_side isEqualTo ""}) exitWith {};
if !(_side in ["WEST","CIV","GUER"]) exitWith {};

private _query = "";
private _exit = false;

switch _mode do 
{
case 0: 
{
private _value = param [2,0,[0]];
_value = [_value] call DB_fnc_numberSafe;
_query = format["player%1UpdateCash:%2:%3",_side,_value,_uid];
};

case 1: 
{
private _value = param [2,0,[0]];
_value = [_value] call DB_fnc_numberSafe;
_query = format["player%1UpdateBank:%2:%3",_side,_value,_uid];
};

case 2: 
{
if !(_side isEqualTo "CIV") exitWith 
{
_exit = true;
};
private _value = param [2,[],[[]]];
_value = [_value] call DB_fnc_mresArray;
_query = format["playerUpdateLicense:%1:%2",_value,_uid];
};

case 3: 
{
private _value = param [2,[],[[]]];
_value = [_value] call DB_fnc_mresArray;
_query = format["player%1UpdateLoadout:%2:%3",_side,_value,_uid];
};

case 6: 
{
private _value1 = param [2,0,[0]];
private _value2 = param [4,0,[0]];
_value1 = [_value1] call DB_fnc_numberSafe;
_value2 = [_value2] call DB_fnc_numberSafe;
_query = format["player%1UpdateBank+Cash:%2:%3:%4",_side,_value1,_value2,_uid];
};

case 7: {
_array = param [2,[],[[]]];
[_uid,_side,_array,0] call TON_fnc_keyManagement;
};

case 8: {
if !(_side isEqualTo "CIV") exitWith 
{
_exit = true;
};
private _value = param [2,false,[true]];
_value = [_value] call DB_fnc_bool;
_query = format["playerUpdatePlayerStatus:%1:%2",_value,_uid];
};
case 9: {
private _value = param [2,[],[[]]];
private _value2 = param[4,0,[0]];
_value = [_value] call DB_fnc_mresArray;
_value2 = [_value2] call DB_fnc_numberSafe;
_query = format["playerUpdateNewSkill:%1:%2:%3",_value,_value2,_uid];
};
case 10: {
private _value = param [2,0,[0]];
private _value2 = param [4,0,[0]];
private _value3 = param [5,0,[0]];
_value = [_value] call DB_fnc_numberSafe;
_value2 = [_value2] call DB_fnc_numberSafe;
_value3 = [_value3] call DB_fnc_numberSafe;
_query = format["playerUpdateNewLevel:%1:%2:%3:%4",_value,_value2,_value3,_uid];
};
case 11: {
private _value = param [2,0,[0]];
_query = format["playerUpdateJailTime:%1:%2",_value,_uid];
};
case 12: {
private _value = param [2,0,[0]];
private _value2 = param [4,[],[[]]];
_value2 = [_value2] call DB_fnc_mresArray;
_query = format["playerUpdateFullJail:%1:%2:%3",_value,_value2,_uid];
};
default {};
};

if (_exit) exitWith {};
if (_query isEqualTo "") exitWith {};
"extDB2" callExtension format ["%1:%2:%3",1,DatabaseSessionId,_query];
