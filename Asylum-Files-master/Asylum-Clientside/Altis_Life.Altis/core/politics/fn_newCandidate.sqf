/*
	File: fn_newCandidate.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Send candidacy to server for review.
*/

private["_invest","_policy"];
_invest = parseNumber(ctrlText 6802);
_policy = ctrlText 6804;
if(!([str(_invest)] call life_fnc_isnumber)) exitWith {hint "Your investment isn't in an actual number format."};
if(_invest < 0) exitWith {};
if(_invest > 999999) exitWith {hint "You can't invest more then $999,999!";};
if(_invest < 2500) exitWith {hint "You must invest at least $2,500 to run for office.";};
_len = [_policy] call KRON_StrLen;
if(_len > 300) exitWith {hint "The maximum character limit for a policy is 300."};

if(_invest > life_atmmoney) exitWith {hint "You don't have that much in your bank account!"};
["atm","take",_invest] call life_fnc_uC;

_policy = [_policy, ",", "|"] call KRON_Replace;
[[player, _invest, _policy], "ASY_fnc_submitCandidate", false, false] spawn life_fnc_MP;

closeDialog 0;
hint format ["Your candidacy has been received and you are now running for office with an investment of $%1!",[_invest] call life_fnc_numberText];