/*
	File: fn_puhuqust.sqf
	Author: John "Paratus" VanderZwet
	Governor system modified for compatibility and optimization by Kevin

	Description:
	Send candidacy to server for review.
*/
private["_invest","_policy"];
_invest = parseNumber(ctrlText 6802);
_policy = ctrlText 6804;
if(!([str(_invest)] call life_fnc_isnumber)) exitWith {hintSilent "Your investment isn't in an actual number format.";};
if(_policy isEqualTo "") exitWith {hintSilent "You must include a Candidate Policy with your application!";};
if(_invest < 0) exitWith {};
if(_invest > 999999) exitWith {hintSilent "You can't invest more then $999,999!";};
if(_invest < 50000) exitWith {hintSilent "You must invest at least $50,000 to run for office.";};
_len = [_policy] call KRON_StrLen;
if(_len > 200) exitWith {hintSilent "The maximum character limit for a policy is 200."};
if(_invest > an_bank) exitWith {hintSilent "You don't have that much in your bank account!";};
[_invest,1,1] call life_fnc_sewawruk;
[player,(getPlayerUID player),name player,_invest * -1,_policy] remoteExecCall ["life_fnc_submitCandidate",2];
closeDialog 0;
hintSilent format ["Your candidacy has been received and you are now running for office with an investment of $%1!",[_invest] call life_fnc_rupadudejat];
