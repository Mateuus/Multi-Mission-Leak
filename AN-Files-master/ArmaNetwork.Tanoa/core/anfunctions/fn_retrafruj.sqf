/*
	File: fn_voteDialog.sqf
	Author: John "Paratus" VanderZwet
	Governor system modified for compatibility and optimization by Kevin

	Description:
	Display the vote governor dialog.
*/
if !(playerSide isEqualTo civilian) exitWith 
{
	hintSilent "You need to be a civilian to vote!";
};

if (life_voted) exitWith 
{ 
	hintSilent "You have already voted and cannot vote again until the next election."; 
};

disableSerialization;
createDialog "angovvote_menu";
ctrlEnable [6905, false];

_display = findDisplay 6900;
_text = _display displayCtrl 6903;
_text ctrlSetStructuredText parseText "<t size='1'>To the left you are presented with a list of all currently running candidates for President, sorted with the highest investment on top.  You may only cast your vote once so choose wisely!<br/><br/>The President may affect your life on Tanoa in many ways, so it's important to vote for the right candidate.  Your President controls taxes, laws and has other special powers.<br/><br/>To run for office, visit the Government HQ.</t>";

_list = _display displayCtrl 6902;

lbClear _list;
{
	_list lbAdd (_x select 1);
	_list lbSetdata [(lbSize _list)-1,str[_x select 3,_x select 1,_x select 0]];
} forEach life_run_data;
