/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Uses C4
*/

private ["_minutes","_copScore","_infoArray","_pos","_copsNeeded"];
_infoArray = [];
_location = 0;

if(DS_jailed)exitwith{};

switch (true) do
	{
	case (player distance repairBank1 < 10) : {_infoArray = [600,5,0.5,repairBank1];_location = 1;};
	case (player distance repairJail < 10) : {_infoArray = [360,3,0.5,repairJail];_location = 2;};
	case (player distance powerStation1 < 20) : {_infoArray = [360,4,0.5,powerStation1];_location = 3;};
	};

_action = [
		"You are not allowed to bait police with this - You must be intending to destroy this to continue",
		"No Baiting!",
		"Continue",
		"Cancel"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(_infoArray isEqualTo [])exitWith
	{
	hint "You can not use this item here";
	};

_copScore = [] call DS_fnc_getCopScore;
if(_copScore < 15)then
	{
	_minutes = _infoArray select 0;
	_minutes = _minutes + 300;
	_infoArray set [0,_minutes];
	};
if((_copScore > 14)&&(_copScore < 25))then
	{
	_minutes = _infoArray select 0;
	_minutes = _minutes + 240;
	_infoArray set [0,_minutes];
	};
if((_copScore > 24)&&(_copScore < 35))then
	{
	_minutes = _infoArray select 0;
	_minutes = _minutes + 180;
	_infoArray set [0,_minutes];
	};

sleep (random 3);
if(DS_policeBusy)exitwith{hint "Can not plant this at this time, too many other rebel activities are currently active, please try again in 5 minutes"};

if([player,5,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another civilian is too nearby","PLAIN"];};

if((DS_infoArray select 17) > 20)then{_infoArray set [2,0.35];};
if((DS_infoArray select 17) > 32)then{_infoArray set [2,0.25];};

if((player distance repairBank1 < 50)&&(!(repairBank1 getVariable ["closed",false])))exitwith{hint "These doors are already destroyed"};
if((player distance repairBank1 < 50)&&(repairBank1 getVariable ["bombPlaced",false]))exitwith{hint "There is already a bomb planted here"};
if((player distance repairJail < 50)&&(!(repairJail getVariable ["closed",false])))exitwith{hint "These doors are already destroyed"};
if((player distance repairJail < 50)&&(repairJail getVariable ["bombPlaced",false]))exitwith{hint "There is already a bomb planted here"};
if((player distance powerStation1 < 50)&&(!(powerStation1 getVariable ["closed",false])))exitwith{hint "This station is already destroyed"};
if((player distance powerStation1 < 50)&&(powerStation1 getVariable ["bombPlaced",false]))exitwith{hint "There is already a bomb planted here"};
_pos = (position player);
_copsNeeded = (_InfoArray select 1);
if(!(miscInfoArray select 7))then
	{
	_copsNeeded = _copsNeeded - 1;
	};

	//Testing
	if((getPlayerUID player) in DS_adminlist5)then
		{
		_copsNeeded = 0;
		};

if(!([_copsNeeded] call DS_fnc_countPlayers))exitWith
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not destroy this when there is fewer than %1 white-listed cops online!<br/></t>",_copsNeeded];
	hint _str;
	};



if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
["c4",false,1] call DS_fnc_handleInventory;
_upp = "Planting Explosive";
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
if(DS_tazed)exitwith{};
if(!alive player) exitWith {};
if(!isNull objectParent player) exitWith {["c4",true,1] call DS_fnc_handleInventory;};
if(player distance _pos > 10)exitwith {hint "You moved too far away";["c4",true,1] call DS_fnc_handleInventory;};
(_infoArray select 3) setVariable ["bombPlaced",true,true];
hint format ["The bomb has been planted, you have %1 minutes until it explodes, find cover and defend the area",(round(_infoArray select 0)/60)];
systemchat format ["The bomb has been planted, you have %1 minutes until it explodes, find cover and defend the area",(round(_infoArray select 0)/60)];
switch (true) do
	{
	case (player distance repairBank1 < 50) : {[2,(_infoArray select 0)] remoteExec ["HUNT_fnc_bank",2];[(position player),1] remoteExec ["HUNT_fnc_globalMarkers",2];DS_doneStuff pushBack [(name player),"used C4","Bank",time];publicVariable "DS_doneStuff";};
	case (player distance repairJail < 50) : {[2,(_infoArray select 0)] remoteExec ["HUNT_fnc_jail",2];DS_doneStuff pushBack [(name player),"used C4","Jail",time];publicVariable "DS_doneStuff";};
	case (player distance powerStation1 < 50) : {[2,(_infoArray select 0)] remoteExec ["HUNT_fnc_power",2];DS_doneStuff pushBack [(name player),"used C4","Power Station",time];publicVariable "DS_doneStuff";};
	};

sleep 10;

if((DS_infoArray select 17) == 3)then { [2] call DS_fnc_questCompleted };

if(((DS_infoArray select 17) == 9)&&(_location == 3))then
	{
	while{true}do
		{
		if(!alive player)exitwith{};
		if(DS_jailed)exitwith{};
		if(!(powerStation1 getVariable ["closed",false]))exitWith
			{
			[2] call DS_fnc_questCompleted;
			};
		if(!(powerStation1 getVariable ["bombPlaced",false]))exitwith{};
		sleep 5;
		};
	};

if(((DS_infoArray select 17) == 20)&&(_location == 1))then
	{
	while{true}do
		{
		if(!alive player)exitwith{};
		if(DS_jailed)exitwith{};
		if(!(repairBank1 getVariable ["closed",false]))exitWith
			{
			[2] call DS_fnc_questCompleted;
			};
		if(!(repairBank1 getVariable ["bombPlaced",false]))exitwith{};
		sleep 5;
		};
	};

if(((DS_infoArray select 17) == 32)&&(_location == 2))then
	{
	while{true}do
		{
		if(!alive player)exitwith{};
		if(DS_jailed)exitwith{};
		if(!(repairJail getVariable ["closed",false]))exitWith
			{
			[2] call DS_fnc_questCompleted;
			};
		if(!(repairJail getVariable ["bombPlaced",false]))exitwith{};
		sleep 5;
		};
	};

if(((DS_infoArray select 17) == 20)&&(_location == 1))then
	{
	while{true}do
		{
		if(!alive player)exitwith{};
		if(DS_jailed)exitwith{};
		if(!(repairBank1 getVariable ["closed",false]))exitWith
			{
			//example for quest
			};
		if(!(repairBank1 getVariable ["bombPlaced",false]))exitwith{};
		sleep 5;
		};
	};

if((DS_tokenMission == 4)&&(_location == 2))then
	{
	while{true}do
		{
		if(!(repairJail getVariable ["closed",false]))exitWith
			{
			DS_tokenMission = -1;
			[120,name player,false] spawn DS_civ_payTokens;
			DS_rebelMissionToken = false;
			};
		if(!(repairJail getVariable ["bombPlaced",false]))exitwith{};
		sleep 5;
		};
	};