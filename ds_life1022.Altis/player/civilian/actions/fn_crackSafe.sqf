/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Cracks the safes at Fort Knox
*/

private ["_action","_infoArray","_pos","_copsNeeded"];
_infoArray = [];
if(!(playerSide isEqualTo civilian))exitwith{hint "Get out of here rookie, you can't do this"};

if(!(safe_research getVariable ["closed",false]))exitwith{hint "You can not crack this safe while the Research Facility safe is being/been cracked"};
if(safe_research getVariable ["cracking",false])exitwith{hint "You can not crack this safe while the Research Facility safe is being/been cracked"};

_action = [
		"You are not allowed to bait police with this - You must be performing an actual robbery to use a safe cracker",
		"No Baiting!",
		"Continue",
		"Cancel"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

switch (true) do
	{
	case (player distance knox_safe1 < 7) : {_infoArray = [900,7,0.5,2]};
	case (player distance knox_safe2 < 7) : {_infoArray = [900,7,0.5,5]};
	};

if(_infoArray isEqualTo [])exitWith
	{
	hint "Move closer to use this";
	};

_copScore = [] call DS_fnc_getCopScore;
if(_copScore < 15)then
	{
	_minutes = _infoArray select 0;
	_minutes = _minutes + 600;
	_infoArray set [0,_minutes];
	};
if((_copScore > 14)&&(_copScore < 25))then
	{
	_minutes = _infoArray select 0;
	_minutes = _minutes + 480;
	_infoArray set [0,_minutes];
	};
if((_copScore > 24)&&(_copScore < 35))then
	{
	_minutes = _infoArray select 0;
	_minutes = _minutes + 180;
	_infoArray set [0,_minutes];
	};

if(DS_item_cracker < 1)exitwith{hint "You need a cracking device to do this, buy these at the rebel KOS item shop"};
if((player distance knox_safe1 < 10)&&(!(knox_safe1 getVariable ["closed",false])))exitwith{hint "This safe is already opened"};
if((player distance knox_safe2 < 10)&&(!(knox_safe2 getVariable ["closed",false])))exitwith{hint "This safe is already opened"};
if((player distance knox_safe1 < 10)&&(knox_safe1 getVariable ["cracking",false]))exitwith{hint "This safe is already being cracked"};
if((player distance knox_safe2 < 10)&&(knox_safe2 getVariable ["cracking",false]))exitwith{hint "This safe is already being cracked"};
_pos = (position player);
_copsNeeded = (_InfoArray select 1);

if(!([_copsNeeded] call DS_fnc_countPlayers))exitWith
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not crack this when there is fewer than %1 white-listed cops online!<br/></t>",_copsNeeded];
	hint _str;
	};

if(DS_policeBank < 50000)exitwith{hint "There isn't enough money in the police bank to crack this"};
if(DS_doingStuff)exitwith{};

if(DS_policeBusy)exitwith{hint "Can not begin this at this time, too many other rebel activities are currently active, please try again in 5 minutes"};

DS_doingStuff = true;
_upp = "Cracking Safe...";
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
	{
	sleep (_InfoArray select 2);
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(!isNull objectParent player) exitWith {};
	if(player distance _pos > 10)exitwith {};
	if(DS_tazed)exitwith{};
	};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

DS_doingStuff = false;
if(!alive player) exitWith {};
if(DS_tazed)exitwith{};
if(player distance _pos > 10)exitwith {hint "You moved too far away"};

if(DS_item_safeCrackerAdv > 0)then
	{
	["safeCrackerAdv",false,1] call DS_fnc_handleInventory;
	_minutes = _infoArray select 0;
	_minutes = _minutes - 300;
	_infoArray set [0,_minutes];
	};

hint format ["You have set up your cracking device, this will have the safe cracked in %1 minutes",(round(_infoArray select 0)/60)];
systemchat format ["You have set up your cracking device, this will have the safe cracked in %1 minutes",(round(_infoArray select 0)/60)];
[(_infoArray select 3),(_infoArray select 0)] remoteExec ["HUNT_fnc_knox",2];
DS_doneStuff pushBack [(name player),"used a cracker","Fort Knox",time];
publicVariable "DS_doneStuff";

[50,false] call DS_fnc_moralAlter;