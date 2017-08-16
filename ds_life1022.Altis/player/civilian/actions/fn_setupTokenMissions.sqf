/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Actives token missions
*/

private["_randomNum","_action","_group","_timer","_playerPos","_missionIndex","_cost","_time","_bang","_counter","_endPoint","_counterPos","_dead","_pass","_vehType","_className","_reward"];
_counterPos = 0;
if(isNil "DS_rebelMissionToken")then{DS_rebelMissionToken = false};
if(DS_rebelMissionToken)exitwith{hint "You already have a rebel or token mission active"};
if((!DSL_rebel)&&(!DSL_rebelAdv))exitwith{hint "You must have Rebel training to begin this mission"};
if((count allPlayers) < 20)exitwith{hint "You can not begin these missions with fewer than 20 players online"};
_playerPos = (position player);

_group = shawn1 getVariable ["gangOwner",grpNull];
if(isNull _group)exitwith{hint "You must own the rebel KOS zone to begin token missions"};
if((group player) != _group)exitwith{hint "You must own the rebel KOS zone to begin token missions"};

_action = [
	"A token mission will send you on a random task somewhere, these task are normally very risky. As a reward for completing the task you will be paid a certain number of tokens depending on the risk involved in the job. Some of the task will require a certain number of cops to be online (If you complete the mission in a different gang than you are currently in, the reward will be split between both gangs)",
	"Token Missions",
	"Continue",
	"No Thanks"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

DS_rebelMissionToken = true;
_randomNum = round random 23;

switch(_randomNum)do
	{
	case 0:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to complete a land weapons convoy for a reward of 80 tokens per gang member";
		DS_currentTask1 = "Token Mission - Land Weapons Convoy";
		DS_currentTask2 = "You must begin a land weapons convoy and complete it to receive 80 rebel tokens per gang member";
		};
	case 1:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to take a bag of money from the bank for a reward of 150 tokens per gang member";
		DS_currentTask1 = "Token Mission - Bag of money";
		DS_currentTask2 = "You must steal a bag of money to receive 150 rebel tokens per gang member";
		};
	case 2:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to capture Checkpoint 2 for a reward of 120 tokens per gang member";
		DS_currentTask1 = "Token Mission - Capture Checkpoint 2";
		DS_currentTask2 = "You must capture Checkpoint 2 to receive 120 rebel tokens per gang member";
		};
	case 3:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to complete a fake ID convoy for a reward of 70 tokens per gang member";
		DS_currentTask1 = "Token Mission - Fake ID Convoy";
		DS_currentTask2 = "You must complete a fake ID convoy to receive 70 rebel tokens per gang member";
		};
	case 4:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to blow open the jail for a reward of 120 tokens per gang member";
		DS_currentTask1 = "Token Mission - Blow open the Jail";
		DS_currentTask2 = "You must blow open the jail to receive 120 rebel tokens per gang member";
		};
	case 5:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to complete a carbomb mission for a reward of 60 tokens per gang member";
		DS_currentTask1 = "Token Mission - Car Bomb";
		DS_currentTask2 = "You must complete a carbomb mission to receive 60 rebel tokens per gang member";
		};
	case 6:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to complete a rebel convoy missions for a reward of 300 tokens per gang member";
		DS_currentTask1 = "Token Mission - Rebel Convoy";
		DS_currentTask2 = "You must complete a rebel convoy mission to receive 300 rebel tokens per gang member";
		};
	case 7:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is steal money from Fort Knox for a reward of 250 tokens per gang member";
		DS_currentTask1 = "Token Mission - Fort Knox Money";
		DS_currentTask2 = "You must steal money from Fort Knox to receive 250 rebel tokens per gang member";
		};
	case 8:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to complete a token convoy for a reward of 90 tokens per gang member";
		DS_currentTask1 = "Token Mission - Token convoy";
		DS_currentTask2 = "You must complete a token convoy to receive 90 rebel tokens per gang member";
		};
	case 9:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to complete a terrorist mission for a reward of 500 tokens per gang member";
		DS_currentTask1 = "Token Mission - Terrorist Mission";
		DS_currentTask2 = "You must complete a terrorist to receive 500 rebel tokens per gang member";
		};
	case 10:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to complete a land drugs convoy for a reward of 80 tokens per gang member";
		DS_currentTask1 = "Token Mission - Land Drugs Convoy";
		DS_currentTask2 = "You must begin a land drugs convoy and complete it to receive 80 rebel tokens per gang member";
		};
	case 11:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to chop the MCU for 500 tokens";
		DS_currentTask1 = "Token Mission - Chop The MCU";
		DS_currentTask2 = "You must take the MCU to the chopshop and chop it";
		};
	case 12:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to chop an armoured police vehicle for 100 tokens";
		DS_currentTask1 = "Token Mission - Chop An Armoured Police Vehicle";
		DS_currentTask2 = "You must take an armoured police vehicle to the chopshop and chop it";
		};
	case 13:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to capture Checkpoint 3 for a reward of 120 tokens per gang member";
		DS_currentTask1 = "Token Mission - Capture Checkpoint 3";
		DS_currentTask2 = "You must capture Checkpoint 3 to receive 120 rebel tokens per gang member";
		};
	case 14:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to capture Checkpoint 1 for a reward of 120 tokens per gang member";
		DS_currentTask1 = "Token Mission - Capture Checkpoint 1";
		DS_currentTask2 = "You must capture Checkpoint 1 to receive 120 rebel tokens per gang member";
		};
	case 15:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to lighter a cop car for a reward of 40 tokens per gang member";
		DS_currentTask1 = "Token Mission - Lighter a cop car";
		DS_currentTask2 = "You must lighter a cop car to receive 40 rebel tokens per gang member";
		};
	case 16:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to kill a cop at Fort Knox for a reward of 140 tokens per gang member";
		DS_currentTask1 = "Token Mission - Kill a cop at Fort Knox";
		DS_currentTask2 = "You must kill a cop at Fort Knox to receive 140 rebel tokens per gang member";
		};
	case 17:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to kill a cop at the bank for a reward of 110 tokens per gang member";
		DS_currentTask1 = "Token Mission - Kill a cop at The Bank";
		DS_currentTask2 = "You must kill a cop at the bank to receive 110 rebel tokens per gang member";
		};
	case 18:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to process Meth for a reward of 100 tokens per gang member";
		DS_currentTask1 = "Token Mission - Process Meth";
		DS_currentTask2 = "You must process Meth to receive 100 rebel tokens per gang member";
		};
	case 19:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to strangle someone for a reward of 50 tokens per gang member";
		DS_currentTask1 = "Token Mission - Strangle Someone";
		DS_currentTask2 = "You must strangle someone to receive 50 rebel tokens per gang member";
		};
	case 20:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is kill a cop at the Research Facility";
		DS_currentTask1 = "Token Mission - Research Facility";
		DS_currentTask2 = "You must kill a cop at the research facility to receive 130 rebel tokens per gang member";
		};
	case 21:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to steal an item from the research facility for a reward of 250 tokens per gang member";
		DS_currentTask1 = "Token Mission - Research Facility";
		DS_currentTask2 = "You must steal an item from the research facility to receive 250 rebel tokens per gang member";
		};
	case 22:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is kill a cop at the Research Facility";
		DS_currentTask1 = "Token Mission - Research Facility";
		DS_currentTask2 = "You must kill a cop at the research facility to receive 130 rebel tokens per gang member";
		};
	case 23:
		{
		DS_tokenMission = _randomNum;
		hint "Your mission is to steal an item from the research facility for a reward of 250 tokens per gang member";
		DS_currentTask1 = "Token Mission - Research Facility";
		DS_currentTask2 = "You must steal an item from the research facility to receive 250 rebel tokens per gang member";
		};
	};
	
DS_tokenGroup = [(group player),(group player) getVariable ["gangName",""]];
sleep 10;
hint "If you complete this mission while in a different gang, your reward will be split with members of your current gang also";