/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Runs on a player when they are revived by a Medic
*/

private["_rebel","_dir","_oldGear","_payment"];
_rebel = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_payment = [_this,1,10000,[0]] call BIS_fnc_param;
_medic = _this select 2;
_oldGear = [DS_deadBody] call DS_fnc_getDeadGear;
[DS_deadBody,_oldGear] spawn DS_fnc_loadDeadGear;
DS_deadBody setVariable["name",nil,true];
[DS_deadBody] remoteExec ["DS_fnc_removeDead",0];
_dir = getDir DS_deadBody;
hint format["Medic %1 has revived you",_rebel];
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
[DS_deadBody] remoteExec ["DS_fnc_removeDead",0];
hideBody DS_deadBody;

player setVariable["restrained",false,true];
player setVariable["escorted",false,true];

player setVariable["revive",false,TRUE];
DS_deadBody setVariable["name",profileName,true];
player setVariable["reviving",false,TRUE];
if(DS_realMode)then{player setVariable["realModeMan",TRUE,TRUE];};
[] call DS_fnc_updateHud;

if(!(playerSide isEqualTo west))then
	{
	systemchat format ["For his services you have paid this medic $%1",_payment];
	hint format ["For his services you have paid this medic $%1",_payment];
	[_payment,true,false] call DS_fnc_handleMoney;
	};

[] call DS_fnc_compileData;
[] call DS_fnc_setupPlayerActions;
player setVariable ["bounty",(DS_wanted_Stats select 0),true];
player setVariable["selections",[],true];
player setVariable["getHit",[],true];
DS_headShot = false;
//DS_headShotChecked = false;

if(playerSide isEqualTo west)then
	{
	[west,player] remoteExec ["HUNT_fnc_setupChat",2];
	[west,player] remoteExec ["HUNT_fnc_setupChat",2];
	7 enableChannel [true, false];
	}
	else
	{
	if(playerSide isEqualTo civilian)then
		{
		6 enableChannel [true, false];
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
			7 enableChannel [true, false];
			6 enableChannel [true, false];
			[civilian,player] remoteExec ["HUNT_fnc_setupChat",2];
		};
		};
	};

if(DS_mechanic)then
	{
	player setVariable ["mechanic",true,true];
	};

if(DSL_security)then
	{
	player setVariable ["security",true,true];
	};

if(DS_medic)then
	{
	player setVariable ["medic",true,true];
	};

if(player getVariable ["security",false])then{[west,player] remoteExec ["HUNT_fnc_setupChat",2];};

DS_armour = 15;
DS_medicRevived = true;
[] call DS_fnc_stamina;
[] spawn DS_fnc_earPlugs;
[] spawn
	{
	_time = time + 3600;
	waitUntil{(time > _time)};
	DS_medicRevived = false;
	};

if(playerSide isEqualTo west)then
	{
	[] spawn DS_cop_addToSquad;
	};

DS_punishMe = true;
7 enableChannel [true,false];
8 enableChannel [true,false];
9 enableChannel [true,false];

_myBase = [] call DS_fnc_getPlayerBase;
if(!isNil "_myBase")then {
	_hisBase = [] call DS_fnc_getPlayerBaseList;
	if(_myBase isEqualTo _hisBase)then {
		[_medic,player,10] remoteExec ["HUNT_fnc_dupePrevention",2];
	};
};