/*
    File: fn_bountyRemove.sqf
	Author: !TS JORDAN
	Originally Made for: Underbelly ArmA 

    Description:
    Removes a person from the bounty list.
*/
private _uid = param [0,"",[""]];

if (_uid isEqualTo "") exitWith {}; //Bad data
//diag_log format ["UID: %1", _uid]; 

private _query = format ["DELETE FROM bounty WHERE bountyID ='%1'",_uid];
[_query,2] call DB_fnc_asyncCall;