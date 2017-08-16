/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Runs on a player when they are revived by a rebel
*/

private["_rebel","_dir","_oldGear","_rand","_tempDead"];
_rebel = [_this,0,"Unknown Rebel",[""]] call BIS_fnc_param;
_oldGear = [DS_deadBody] call DS_fnc_getDeadGear;
[DS_deadBody,_oldGear] spawn DS_fnc_loadDeadGear;
DS_deadBody setVariable["name",nil,true];
_dir = getDir DS_deadBody;
hint format["%1 has revived you",_rebel];
DS_NLR = false;
DS_revived = true;
DS_doingStuff = false;
DS_requestedMedic = false;
// if(DS_rebelAdv_removed) then
	// {
	// DSL_rebelAdv = true;
	// DSL_rebel = true;
	// DS_rebelAdv_removed = false;
	// };
if(playerSide isEqualTo civilian) then {DS_currentWeight = 0;};
closeDialog 0;

player setDir _dir;
player setPosASL (visiblePositionASL DS_deadBody);
DS_deadBody setVariable["revive",false,TRUE];
DS_deadBody setVariable["name",nil,TRUE];
_tempDead = DS_deadBody;
[_tempDead] remoteExec ["DS_fnc_removeDead",0];
hideBody DS_deadBody;

player setVariable["restrained",false,true];
player setVariable["escorted",false,true];

player setVariable["revive",false,TRUE];
DS_deadBody setVariable["name",profileName,true];
player setVariable["reviving",false,TRUE];
if(DS_realMode)then{player setVariable["realModeMan",TRUE,TRUE];};
[] call DS_fnc_updateHud;
_rand = round random 10;
if((_rand > 3)||((!(playerSide isEqualTo west))&&((DS_infoArray select 12) == 1))||((playerSide isEqualTo west)&&((DS_infoArray select 12) == 2)))then
	{
	if(!DS_medicRevived)then
		{
		player setVariable ["DS_sick_infection",true,false];
		[12] call DS_fnc_alterStats;
		};
	};
//[] call DS_fnc_compileData;

player setVariable ["bounty",(DS_wanted_Stats select 0),true];
player setVariable["selections",[],true];
player setVariable["getHit",[],true];
DS_headShot = false;
//DS_headShotChecked = false;

if(playerSide isEqualTo west)then
	{
	[west,player] remoteExec ["HUNT_fnc_setupChat",2];
	[west,player] remoteExec ["HUNT_fnc_setupChat",2];
	}
	else
	{
	if(playerSide isEqualTo civilian)then
		{
		if(DS_adminLevel > 0)then {
			[civilian,player,false,false,true] remoteExec ["HUNT_fnc_setupChat",2];
		} else {
			if(((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2)) > 1200)then {
				[civilian,player] remoteExec ["HUNT_fnc_setupChat",2];
			} else {
				[civilian,player,false,false,true] remoteExec ["HUNT_fnc_setupChat",2];
			};
		};
		}
		else
		{
		if(player getVariable ["security",false])then {
			[west,player] remoteExec ["HUNT_fnc_setupChat",2];
		};
		[civilian,player] remoteExec ["HUNT_fnc_setupChat",2];
		}
	};

if(DS_mechanic)then
	{
	player setVariable ["mechanic",true,true];
	};

if(DS_medic)then
	{
	player setVariable ["medic",true,true];
	};

if(DSL_security)then
	{
	player setVariable ["security",true,true];
	};
[] call DS_fnc_stamina;
[] call DS_fnc_setupPlayerActions;
[] spawn DS_fnc_earPlugs;

if(player getVariable ["security",false])then{[west,player] remoteExec ["HUNT_fnc_setupChat",2];};

if(playerSide isEqualTo west)then
	{
	[] spawn DS_cop_addToSquad;
	};

DS_punishMe = true;

7 enableChannel [true,false];
8 enableChannel [true,false];
9 enableChannel [true,false];