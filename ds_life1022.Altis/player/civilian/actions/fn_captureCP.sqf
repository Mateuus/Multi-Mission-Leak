/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Captures police checkpoints
*/

private ["_counter","_cost","_copsNeeded","_targets"];

_cost = 150000;
_counter = 600;
_infoArray = [];
_copsNeeded = 3;

switch(true)do
	{
	case (player distance cp1 < 100) : {_infoArray = [1,cp1]};
	case (player distance cp2 < 100) : {_infoArray = [2,cp2]};
	case (player distance cp3 < 100) : {_infoArray = [3,cp3]};
	default {_infoArray = []};
	};

if(!([_copsNeeded] call DS_fnc_countPlayers))exitWith
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not claim a checkpoint when there is fewer than %1 white-listed cops online!<br/></t>",_copsNeeded];
	hint _str;
	};

_action = [
	"Before capturing this checkpoint a deposit of $150k must be paid, this will be returned to you upon capture. (You must stay - Leaving is considered as baiting police) Continue?",
	"IMPORTANT",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if((_infoArray select 1) getVariable ["taking",false])exitwith{hint "This checkpoint is already being captured"};
if((_infoArray select 1) getVariable ["captured",false])exitwith{hint "This checkpoint has already been captured"};

if((!DSL_rebel)&&(!DSL_rebelAdv))exitwith{hint "You need rebel training to do this"};
if([_cost,true] call DS_fnc_checkMoney)exitwith{hint "You need $150k in your bank to do this, it will be deducted as a deposit and returned once you capture the area"};
[_cost,true,false] call DS_fnc_handleMoney;
(_infoArray select 1) setVariable ["taking",true,true];

_targets = allPlayers select {(_x distance player) < 500};
[(_infoArray select 1),"alarm",true] remoteExecCall ["DS_fnc_playSounds",_targets];


switch(true)do
	{
	case (player distance cp1 < 100) : {[(position player),2] remoteExec ["HUNT_fnc_globalMarkers",2];};
	case (player distance cp2 < 100) : {[(position player),3] remoteExec ["HUNT_fnc_globalMarkers",2];};
	case (player distance cp3 < 100) : {[(position player),4] remoteExec ["HUNT_fnc_globalMarkers",2];};
	};

hint 'It takes up to 10 minutes of remaining in the area to take over a checkpoint, remain here and fight of the police';
systemchat "It takes up to 10 minutes of remaining in the area to take over a checkpoint, remain here and fight of the police";
sleep 10;
[0,format["Rebels are taking over Checkpoint %1!",(_infoArray select 0),true,0]] remoteExecCall ["DS_fnc_globalMessage",west];
sleep 10;

if((DS_infoArray select 17) == 5)then { [2] call DS_fnc_questCompleted };

while{alive player}do
	{
	if(_counter == 0)exitwith
		{
		systemchat "You have taken control of this checkpoint, continue to guard this area to receive payments!";
		hint 'You have taken control of this checkpoint, continue to guard this area to receive payments!';
		[0,format["Rebels now own Checkpoint %1! Civilians are advised to remain clear of the area until further notice",(_infoArray select 0),true,0]] remoteExecCall ["DS_fnc_globalMessage",west];
		(_infoArray select 1) setVariable ["taking",false,true];
		(_infoArray select 1) setVariable ["captured",true,true];
		[12000,"A rebel has claimed a police checkpoint"] remoteExec ["DS_fnc_punishments",west];
		[20000,false] remoteExec ["HUNT_fnc_policeBank",2];
		sleep 10;
		hint 'Your $150k has been returned';
		[150000,true,true] call DS_fnc_handleMoney;
		if((DS_infoArray select 17) == 18)then { [2] call DS_fnc_questCompleted };
		};
	if(player distance (_infoArray select 1) > 130)exitwith{systemchat "You went too far from the checkpoint";hint 'You went too far from the checkpoint';(_infoArray select 1) setVariable ["taking",false,true];};
	if(!alive player)exitwith{(_infoArray select 1) setVariable ["taking",false,true];};
	_counter = _counter - 20;
		if(((_counter)%120) == 0)then
			{
			if(_counter != 0) then
				{
				[0,format["Rebels will own Checkpoint %1 in %2 minutes if they are not stopped!", (_infoArray select 0),(_counter/60),true],false,0] remoteExecCall ["DS_fnc_globalMessage",west];
				};
			};
		systemchat format ["You will own the checkpoint in %1 seconds",_counter+20];
		hint format ['You will own the checkpoint in %1 seconds',_counter+20];
	sleep 20;
	};
(_infoArray select 1) setVariable ["taking",false,true];

[120,false] call DS_fnc_moralAlter;

if((DS_tokenMission == 2)&&(player distance cp2 < 200))then
	{
	DS_tokenMission = -1;
	[120,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};

if((DS_tokenMission == 13)&&(player distance cp3 < 200))then
	{
	DS_tokenMission = -1;
	[120,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};

if((DS_tokenMission == 14)&&(player distance cp1 < 200))then
	{
	DS_tokenMission = -1;
	[120,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};