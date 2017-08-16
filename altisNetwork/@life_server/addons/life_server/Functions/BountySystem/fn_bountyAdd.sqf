/*
    File: fn_bountyAdd.sqf
    Author: !TS JORDAN
	Originally Made for: Underbelly ArmA 

    Description:
    Adds or appends a unit to the bounty list.
*/
params [
    ["_uid","",[""]],
    ["_name","",[""]],
    ["_amount","",[""]]
];

if (_uid isEqualTo "" || {_name isEqualTo ""}) exitWith {}; //Bad data passed.

private _crimesConfig = getArray(missionConfigFile >> "Life_Settings" >> "bountys");
_amount = call compile format ["%1",_amount];

if (_index isEqualTo -1) exitWith {};
if (_amount isEqualTo -1) exitWith {};

private _query = format ["SELECT bountyID FROM bounty WHERE bountyID='%1'",_uid];
private _queryResult = [_query,2,true] call DB_fnc_asyncCall;
private _val = [_amount] call DB_fnc_numberSafe;
if !(count _queryResult isEqualTo 0) then {
    _bounty = format ["SELECT bounty FROM bounty WHERE bountyID='%1'",_uid];
    _bountyresult = [_bounty,2] call DB_fnc_asyncCall;
    
    _query = format ["UPDATE bounty SET bounty = bounty + '%1' WHERE bountyID='%2'",_val,_uid];
    
    //diag_log format ["NOT ZERO: UID: %1, Name: %2, VALUE: %3", _uid, _name, _val];
    [_query,1] call DB_fnc_asyncCall;
} else {
    _query = format ["INSERT INTO bounty (bountyID, bountyName, bounty) VALUES('%1', '%2', '%3')",_uid,_name,_val];
    //diag_log format ["ZERO: UID: %1, Name: %2, VALUE: %3", _uid, _name, _val];
    [_query,1] call DB_fnc_asyncCall;
};