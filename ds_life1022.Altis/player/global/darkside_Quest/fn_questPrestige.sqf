/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Prestige ones questline
*/

private ["_cost","_type","_noReady","_action"];

if(((DS_infoArray select 13) < 53)&&((DS_infoArray select 15) < 49)&&((DS_infoArray select 17) < 44))exitwith{hint "You have no quest line currently ready to be prestiged"};

if((DS_infoArray select 13) > 52)then
	{
	_cost = ((DS_infoArray select 31)*10000000);
	_cost = _cost + 10000000;
	_action = false;
	_action = [
		format ["Your Civilian quest line is ready to be prestiged, this will restart your civilian quest line and remove any perks you have gained. As a reward you will receive an un-choppable Civilian Command Unit in your garage (Details are on the J menu). To prestige this quest line will also cost $%1",[_cost] call DS_fnc_numberText],
		"IMPORTANT",
		"Prestige this line",
		"Do not presitge this line"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};
	if([_cost,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough funds in your bank to cover the cost"};
	[_cost,true,false] call DS_fnc_handleMoney;
	_tempNum = DS_infoArray select 31;
	_tempNum = _tempNum + 1;
	DS_infoArray set [31,_tempNum];
	DS_infoArray set [13,0];
	DS_infoArray set [14,0];
	if((DS_infoArray select 31) == 1)then
		{
		[(getPlayerUID player),"Civ","Car","O_Truck_03_covered_F",false,false,false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
		hint "Your CCU has been added to your garage and your civilian quest line has been wiped. You may re-do your civilian quest to gain rewards again and prestige multiple times";
		[0,format["%1 has just prestiged their civilian quest line",name player],true,1] remoteExecCall ["DS_fnc_globalMessage",-2];
		}
		else
		{
		if((DS_infoArray select 31) == 2)then
			{
			hint "Your civilian quest line has been prestiged, all vehicles you have the keys to will not act like a CCU (Without the nos)";
			[0,format["%1 has just prestiged their civilian quest line for the second time",name player],true,1] remoteExecCall ["DS_fnc_globalMessage",-2];
			}
			else
			{
			[(getPlayerUID player),"Civ","Car","O_Truck_03_covered_F",false,false,false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
			hint "Your CCU has been added to your garage and your civilian quest line has been wiped. You may re-do your civilian quest to gain rewards again and prestige multiple times";
			[0,format["%1 has just prestiged their civilian quest line for the 3rd or more time(s)",name player],true,1] remoteExecCall ["DS_fnc_globalMessage",-2];
			};
		};
	[] call DS_fnc_compileData;
	};

if((DS_infoArray select 15) > 48)then
	{
	_cost = ((DS_infoArray select 32)*10000000);
	_cost = _cost + 10000000;
	_action = false;
	_action = [
		format ["Your Gang quest line is ready to be prestiged, this will restart your gang quest line and remove any perks you have gained. As a reward you will receive an un-choppable Gang Command Unit in your garage (Details are on the J menu). To prestige this quest line will also cost $%1",[_cost] call DS_fnc_numberText],
		"IMPORTANT",
		"Prestige this line",
		"Do not presitge this line"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};
	if([_cost,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough funds in your bank to cover the cost"};
	[_cost,true,false] call DS_fnc_handleMoney;
	_tempNum = DS_infoArray select 32;
	_tempNum = _tempNum + 1;
	DS_infoArray set [32,_tempNum];
	DS_infoArray set [15,0];
	DS_infoArray set [16,0];
	//B_APC_Wheeled_01_cannon_F
	if((DS_infoArray select 32) == 1)then
		{
		[(getPlayerUID player),"Civ","Car","O_APC_Wheeled_02_rcws_F",false,false,false,false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
		hint "Your GCU has been added to your garage and your gang quest line has been wiped. You may re-do your gang quest to gain rewards again and prestige multiple times";
		[0,format["%1 has just prestiged their gang quest line",name player],true,1] remoteExecCall ["DS_fnc_globalMessage",-2];
		};
	if((DS_infoArray select 32) == 2)then
		{
		[(getPlayerUID player),"Civ","Car","B_APC_Wheeled_01_cannon_F",false,false,false,false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
		hint "Your Advanced GCU has been added to your garage and your gang quest line has been wiped. You may re-do your gang quest to gain rewards again and prestige multiple times";
		[0,format["%1 has just prestiged their gang quest line for a second time",name player],true,1] remoteExecCall ["DS_fnc_globalMessage",-2];
		};
	if((DS_infoArray select 32) > 2)then
		{
		[(getPlayerUID player),"Civ","Car","B_APC_Wheeled_01_cannon_F",false,false,false,false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
		hint "Your Advanced GCU has been added to your garage and your gang quest line has been wiped. You may re-do your gang quest to gain rewards again and prestige multiple times";
		[0,format["%1 has just prestiged their gang quest line for the third or more time",name player],true,1] remoteExecCall ["DS_fnc_globalMessage",-2];
		};
	[] call DS_fnc_compileData;
	};

if((DS_infoArray select 17) > 43)then
	{
	_cost = ((DS_infoArray select 33)*10000000);
	_cost = _cost + 10000000;
	_action = false;
	_action = [
		format ["Your Rebel quest line is ready to be prestiged, this will restart your rebel quest line and remove any perks you have gained. As a reward you will beable to purchase special weapons with rebel tokens from the kos flag and clan base flags (Details are on the J menu). To prestige this quest line will also cost $%1",[_cost] call DS_fnc_numberText],
		"IMPORTANT",
		"Prestige this line",
		"Do not presitge this line"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};
	if([_cost,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough funds in your bank to cover the cost"};
	[_cost,true,false] call DS_fnc_handleMoney;
	_tempNum = DS_infoArray select 33;
	_tempNum = _tempNum + 1;
	DS_infoArray set [33,_tempNum];
	DS_infoArray set [17,0];
	DS_infoArray set [18,0];
	if((DS_infoArray select 33) == 1)then {
		hint "You are now able to purchase special weapons with rebel tokens from clan flags and the rebel kos flag";
		[0,format["%1 has just prestiged their rebel quest line",name player],true,1] remoteExecCall ["DS_fnc_globalMessage",-2];
	};
	if((DS_infoArray select 33) == 2)then {
		hint "You are now able to purchase cheaper special weapons or items with rebel tokens from clan flags and the rebel kos flag";
		[0,format["%1 has just prestiged their rebel quest line for the 2nd time",name player],true,1] remoteExecCall ["DS_fnc_globalMessage",-2];
	};
	if((DS_infoArray select 33) > 2)then {
		hint "Currently no new reward for this prestige, you will have to wait";
		[0,format["%1 has just prestiged their rebel quest line for the 3rd or more time",name player],true,1] remoteExecCall ["DS_fnc_globalMessage",-2];
	};
	[] call DS_fnc_compileData;
	};