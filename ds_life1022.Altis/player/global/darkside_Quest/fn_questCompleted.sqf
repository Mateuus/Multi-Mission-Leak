/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Alerts the player when they complete a quest, increases their quest level and gives them their reward
*/

private ["_focus","_curQuest","_resetIndex","_reward","_index","_nxtQuest"];

_focus = _this select 0;
switch(_focus)do
	{
	case 0:
		{
		_curQuest = (DS_infoArray select 13);
		_index = 13;
		_resetIndex = 14;
		};
	case 1:
		{
		_curQuest = (DS_infoArray select 15);
		_index = 15;
		_resetIndex = 16;
		};
	case 2:
		{
		_curQuest = (DS_infoArray select 17);
		_index = 17;
		_resetIndex = 18;
		};
	case 3:
		{
		if(playerSide isEqualTo west)then
			{
			_curQuest = (DS_infoArray select 21);
			_index = 21;
			_resetIndex = 22;
			};
		if(player getVariable ["security",false])then
			{
			_curQuest = (DS_infoArray select 19);
			_index = 19;
			_resetIndex = 20;
			};
		if(player getVariable ["mechanic",false])then
			{
			_curQuest = (DS_infoArray select 23);
			_index = 23;
			_resetIndex = 24;
			};
		if(player getVariable ["medic",false])then
			{
			_curQuest = (DS_infoArray select 10);
			_index = 10;
			_resetIndex = 11;
			};
		};
	};
_reward = [_focus] call DS_fnc_questReward;
player say3D "success";
if((_reward select 1) == 0)then
	{
	hint format ["Congratulations, you have completed the %1 quest\n\n$%2 has been deposited into your bank account as a reward\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	[(_reward select 2),true,true] call DS_fnc_handleMoney;
	};

if((_reward select 1) == 1)then
	{
	hint format ["Congratulations, you have completed the %1 quest\n\nYour reward is '%2'\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	};

if((_reward select 1) == 2)then
	{
	DS_vehicleGarage = [];
	hint format ["Congratulations, you have completed the %1 quest\n\nYour new vehicle has been added to your garage\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	[(getPlayerUID player),civilian,"Car",(_reward select 2)] remoteExec ["HUNT_fnc_vehicleRewards",2];
	};

if((_reward select 1) == 3)then
	{
	DS_vehicleGarage = [];
	hint format ["Congratulations, you have completed the %1 quest\n\nYour new vehicle has been added to your garage\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	[(getPlayerUID player),civilian,"Air",(_reward select 2),false,false,false] remoteExec ["HUNT_fnc_vehicleRewards",2];
	};
//House upgrade - Will most likely change this section later
if((_reward select 1) == 4)then
	{
	hint format ["Congratulations, you have completed the %1 quest\n\nYour reward has been added to your inventory",_reward select 0];
	DS_item_houseItemUpgrade = DS_item_houseItemUpgrade + 1;
	};
//Police Bulletproof SUV
if((_reward select 1) == 5)then
	{
	DS_vehicleGarage = [];
	hint format ["Congratulations, you have completed the %1 quest\n\nYour new vehicle has been added to your garage\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	[(getPlayerUID player),"Cop","Car",(_reward select 2),true] remoteExec ["HUNT_fnc_vehicleRewards",2];
	};
if((_reward select 1) == 6)then
	{
	DS_vehicleGarage = [];
	hint format ["Congratulations, you have completed the %1 quest\n\nYour new vehicle has been added to your garage\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	[(getPlayerUID player),civilian,"Car",(_reward select 2),false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
	};

if((_reward select 1) == 7)then
	{
	DS_vehicleGarage = [];
	hint format ["Congratulations, you have completed the %1 quest\n\nYour new vehicle has been added to your garage\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	[(getPlayerUID player),civilian,"Air",(_reward select 2),false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
	};

if((_reward select 1) == 8)then
	{
	DS_vehicleGarage = [];
	hint format ["Congratulations, you have completed the %1 quest\n\nYour new vehicle has been added to your garage\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	[(getPlayerUID player),civilian,"Air",(_reward select 2),false,false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
	};
if((_reward select 1) == 9)then
	{
	DS_vehicleGarage = [];
	hint format ["Congratulations, you have completed the %1 quest\n\nYour new vehicle has been added to your garage\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	[(getPlayerUID player),"MED","Car","C_SUV_01_F",true] remoteExec ["HUNT_fnc_vehicleRewards",2];
	};
//Police Bulletproof SUV with super security
if((_reward select 1) == 10)then
	{
	DS_vehicleGarage = [];
	hint format ["Congratulations, you have completed the %1 quest\n\nYour new vehicle has been added to your garage\n\n\nYour next quest is now available",_reward select 0,_reward select 2];
	[(getPlayerUID player),"Cop","Car","suvSecurity",true] remoteExec ["HUNT_fnc_vehicleRewards",2];
	};
_nxtQuest = _curQuest + 1;
//systemchat format ["index = %1 || next = %2",_index,_nxtQuest];
DS_infoArray set [_index,_nxtQuest];
DS_infoArray set [_resetIndex,0];
[] call DS_fnc_compileData;