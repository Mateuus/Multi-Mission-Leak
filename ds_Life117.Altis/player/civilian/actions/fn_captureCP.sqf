/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Captures police checkpoints
*/
private ["_counter","_cost","_copsNeeded"];

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
	"Before capturing this checkpoint a deposit of $150k must be paid, this will be returned to you upon capture. Continue?",
	"Deposit",
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
{
	if(player distance _x < 1000)then
		{
		[[(_infoArray select 1),"alarm"] ,"DS_fnc_playSound",_x,false] spawn DS_fnc_MP;
		};
}forEach playableUnits;

if((DS_infoArray select 17) == 5)then
	{
	[2] call DS_fnc_questCompleted;
	};

switch(true)do
	{
	case (player distance cp1 < 100) : {[[(position player),2],"HUNT_fnc_globalMarkers",false,false] spawn BIS_fnc_MP;};
	case (player distance cp2 < 100) : {[[(position player),3],"HUNT_fnc_globalMarkers",false,false] spawn BIS_fnc_MP;};
	case (player distance cp3 < 100) : {[[(position player),4],"HUNT_fnc_globalMarkers",false,false] spawn BIS_fnc_MP;};
	};
	
	
hint 'It takes up to 10 minutes of remaining in the area to take over a checkpoint, remain here and fight of the police';
systemchat "It takes up to 10 minutes of remaining in the area to take over a checkpoint, remain here and fight of the police";
sleep 10;
[[0,format["Rebels are taking over Check Point %1!", (_infoArray select 0),true]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
[[1,format["Rebels are taking over Check Point %1!", (_infoArray select 0),true]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
sleep 10;

while{alive player}do
	{
	if(_counter == 0)exitwith	
		{
		systemchat "You have taken control of this check point, continue to guard this area to receive payments!";
		hint 'You have taken control of this check point, continue to guard this area to receive payments!';
		[[0,format["Rebels now own Check Point %1! Civilians are advised to remain clear of the area until further notice", (_infoArray select 0),true]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		[[1,format["Rebels now own Check Point %1! Civilians are advised to remain clear of the area until further notice", (_infoArray select 0),true]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		if((DS_infoArray select 17) == 18)then
			{
			[2] call DS_fnc_questCompleted;
			};
		(_infoArray select 1) setVariable ["taking",false,true];
		(_infoArray select 1) setVariable ["captured",true,true];
		[[12000,"A rebel has claimed a police checkpoint"],"DS_fnc_punishments",west,false] spawn BIS_fnc_MP;
		[[20000,false],"HUNT_fnc_policeBank",false,false] spawn DS_fnc_MP;
		sleep 10;
		hint 'Your $150k has been returned';
		[150000,true,true] call DS_fnc_handleMoney;
		};
	if(player distance (_infoArray select 1) > 130)exitwith{systemchat "You went too far from the checkpoint";hint 'You went too far from the checkpoint';(_infoArray select 1) setVariable ["taking",false,true];};	
	_counter = _counter - 20;
		if(((_counter)%120) == 0)then
			{
			if(_counter != 0) then	
				{
				[[0,format["Rebels will own Check Point %1 in %2 minutes if they are not stopped!", (_infoArray select 0),(_counter/60),true]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				[[1,format["Rebels will own Check Point %1 in %2 minutes if they are not stopped!", (_infoArray select 0),(_counter/60),true]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			};
		systemchat format ["You will own the checkpoint in %1 seconds",_counter+20];
		hint format ['You will own the checkpoint in %1 seconds',_counter+20];
	sleep 20;
	};
(_infoArray select 1) setVariable ["taking",false,true];

[120,false] call DS_fnc_moralAlter;




































