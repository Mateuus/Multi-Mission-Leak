/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Work off some of that bail money in jail doing woodwork
*/

private ["_maxCounter","_effort","_chance","_counter"];
_effort = _this select 3;
_chance = round random 5;
_counter = 0;
_maxCounter = 10;
if(DS_realMode)then{_maxCounter = 5};
if(!DS_canWork)exitwith{systemchat "You are not allowed to work here any more";};
if(DS_doingStuff)exitwith{systemchat "Already doing this"};
DS_doingStuff = true;
if(_effort)then
	{
	systemchat "Time to do some work, might try and sabotage something...";
	[5,false] spawn DS_fnc_moralAlter;
	}
	else
	{
	systemchat "Time to do some work, going to put in a good effort like a good boy!...";
	[5,true] spawn DS_fnc_moralAlter;
	};

//Sound, Animation
while{true}do
	{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		_targets = allPlayers select {(_x distance player) < 100};
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["DS_fnc_animSync",_targets];
		
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 3;
	player forceWalk true;
	_counter = _counter + 1;
	if(_counter > _maxCounter)exitwith{};
	if(!DS_jailed)exitwith{};
	};

if(!DS_jailed)exitwith{DS_doingStuff = false;player forceWalk false;};

if(_effort)then
	{
	switch(_chance)do
		{
		case 0:
			{
			systemchat  "Your attempts at sabotaging the work failed, you managed to get nothing made";
			player say3D "fail";
			};
		case 1:
			{
			if(DS_moral < 200)exitwith
				{
				systemchat  "You managed to sabotage a small piece of furniture and not get caught. You got 1 minute off your jail time and a bail credit";
				player say3D "success";
				DS_jail_info set [3,true];
				DS_bailValue = DS_bailValue - 6000;
				[500,false] remoteExec ["HUNT_fnc_policeBank",2];
				};
			systemchat  "You were spotted attempted to sabotage the work, you have been punished with an extra 2 minutes in jail and extra bail price!";
			player say3D "fail";
			DS_jail_info set [0,true];
			DS_bailValue = DS_bailValue + 10000;
			[2500,true] remoteExec ["HUNT_fnc_policeBank",2];
			DS_canWork = false;
			};
		case 2:
			{
			systemchat "You were spotted slacking off, you have been punished with an extra 1 minute in jail and extra bail price!";
			player say3D "fail";
			DS_jail_info set [1,true];
			DS_bailValue = DS_bailValue + 5000;
			[1200,true] remoteExec ["HUNT_fnc_policeBank",2];
			};
		case 3:
			{
			if(DS_moral < 200)exitwith
				{
				systemchat  "You managed to sabotage a small piece of furniture and not get caught. You got 1 minute off your jail time and a bail credit";
				player say3D "success";
				DS_jail_info set [3,true];
				DS_bailValue = DS_bailValue - 15000;
				[1000,false] remoteExec ["HUNT_fnc_policeBank",2];
				};
			systemchat  "You were spotted attempted to sabotage the work, you have been punished with an extra 2 minutes in jail and extra bail price!";
			player say3D "fail";
			DS_jail_info set [0,true];
			DS_bailValue = DS_bailValue + 20000;
			[1200,true] remoteExec ["HUNT_fnc_policeBank",2];
			DS_canWork = false;
			};
		case 4:
			{
			systemchat  "You managed to sabotage a small piece of furniture and not get caught. You got 1 minute off your jail time and a bail credit";
			player say3D "success";
			DS_jail_info set [3,true];
			DS_bailValue = DS_bailValue - 6000;
			[1500,false] remoteExec ["HUNT_fnc_policeBank",2];
			};
		case 5:
			{
			if(DS_moral < 200)exitwith
				{
				systemchat  "You managed to sabotage a small piece of furniture and not get caught. You got 1 minute off your jail time and a bail credit";
				player say3D "success";
				DS_jail_info set [3,true];
				DS_bailValue = DS_bailValue - 8000;
				[800,false] remoteExec ["HUNT_fnc_policeBank",2];
				};
			systemchat  "You managed to sabotage a very large piece of furniture and not get caught. You got 2 minute off your jail time and a bail credit";
			player say3D "success";
			DS_jail_info set [4,true];
			DS_bailValue = DS_bailValue - 10000;
			[800,false] remoteExec ["HUNT_fnc_policeBank",2];
			};
		};
	}
	else
	{
	switch(_chance)do
		{
		case 0:
			{
			if((DS_moral > 700)||((DS_infoArray select 17) > 15))exitwith
				{
				systemchat  "You have received a 30 second time discount and a bail credit for finishing some furniture";
				player say3D "success";
				DS_jail_info set [2,true];
				DS_bailValue = DS_bailValue - 5500;
				[2500,true] remoteExec ["HUNT_fnc_policeBank",2];
				};
			systemchat  "You stuffed up, you managed to get nothing made";
			player say3D "fail";
			};
		case 1:
			{
			systemchat  "You have received a 30 second time discount and a bail credit for finishing some furniture";
			player say3D "success";
			DS_jail_info set [2,true];
			DS_bailValue = DS_bailValue -4500;
			[2500,true] remoteExec ["HUNT_fnc_policeBank",2];
			};
		case 2:
			{
			if((DS_moral > 700)||((DS_infoArray select 17) > 15))exitwith
				{
				systemchat  "You have received a 30 second time discount and a bail credit for finishing some furniture";
				player say3D "success";
				DS_jail_info set [2,true];
				DS_bailValue = DS_bailValue - 4500;
				[2500,true] remoteExec ["HUNT_fnc_policeBank",2];
				};
			systemchat  "You stuffed up, you managed to get nothing made";
			player say3D "fail";
			};
		case 3:
			{
			systemchat  "You have received a large bail credit for finishing some high quality furniture";
			player say3D "success";
			DS_bailValue = DS_bailValue - 15000;
			[7500,true] remoteExec ["HUNT_fnc_policeBank",2];
			};
		case 4:
			{
			systemchat  "You have received one minute off you jail sentence for good behaviour";
			player say3D "success";
			DS_jail_info set [3,true];
			};
		case 5:
			{
			if((DS_moral > 700)||((DS_infoArray select 17) > 15))exitwith
				{
				systemchat  "You have received a 30 second time discount and a bail credit for finishing some furniture";
				player say3D "success";
				DS_jail_info set [2,true];
				DS_bailValue = DS_bailValue - 5500;
				[2500,true] remoteExec ["HUNT_fnc_policeBank",2];
				};
			systemchat  "You stuffed up, you managed to get nothing made";
			player say3D "fail";
			};
		};
	};

if(DS_bailValue < 500)then{DS_bailValue = 666;};
DS_doingStuff = false;
if(DS_jailed)then{player forceWalk true;};