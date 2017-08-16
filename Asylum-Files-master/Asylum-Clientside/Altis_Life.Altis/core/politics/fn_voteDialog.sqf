/*
	File: fn_voteDialog.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Display the vote governor dialog.
*/

life_candidates = nil;
if (!isNil "life_last_vote") exitWith { hint "You have already voted and cannot vote again until the next election."; };

[[player],"ASY_fnc_getVote",false,false] spawn life_fnc_MP;

waitUntil { !isNil "life_last_vote" };

if (life_last_vote != "") exitWith { life_last_vote = nil; hint "You have already voted and cannot vote again until the next election."; };
life_last_vote = nil;

disableSerialization;
createDialog "life_vote_menu";
ctrlEnable [6905, false];

_display = findDisplay 6900;
_text = _display displayCtrl 6903;
_text ctrlSetStructuredText parseText format["<t size='0.8'>To the left you are presented with a list of all currently running candidates for Governor, sorted with the highest investment on top.  You may only cast your vote once so choose wisely!<br/><br/>The governor may affect your life on %1 in many ways, so it's important to vote for the right candidate.  Your governor controls taxes, laws and has other special powers.<br/><br/>To run for office, visit the government office location.</t>", worldName];

[[player],"ASY_fnc_getCandidates",false,false] spawn life_fnc_MP;

waitUntil { !isNil "life_candidates" };

_list = _display displayCtrl 6902;

lbClear _list;
{
	_list lbAdd (_x select 0);
	_list lbSetdata [(lbSize _list)-1,(_x select 1)];
} forEach life_candidates;

life_candidates = nil;