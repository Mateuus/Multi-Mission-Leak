/*----------------------------------------------------------
Author: Shawn "Huntah" Macgillivray
	
Description:
Removes Human Remains (Medic Mission)
-----------------------------------------------------------*/
private ["_vehicle","_true","_tempNum","_payment"];
if(!(player getVariable ["medic",false]))exitwith{};
_payment = 5000;
if(DS_uselessMedic)exitwith{hint "You have been badly wounded and are unable to perform medic functions until you get treated at a hospital"};
_vehicle = (nearestobjects [getpos player, ["Land_HumanSkeleton_F"],  3] select 0);
if(isNull _vehicle)exitwith{};
if(player distance _vehicle < 3)then
	{
	if((DS_infoArray select 10) > 11)then{_payment = (_payment*2);};
	if((DS_infoArray select 10) > 18)then{_payment = (_payment*1.5);};
	if(_vehicle getVariable ["medicMission1",false])then{DS_medicMission = true;};
	DS_doingStuff = true;
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 3;
	detach _vehicle;
	deletevehicle _vehicle;
	waitUntil {(isNull _vehicle)};
	systemchat format ["%1 has been paid into your bank for clearing these remains, return them to a hospital for additional payment",[_payment] call DS_fnc_numberText];
	[_payment,true,true] spawn DS_fnc_handleMoney;
	[5,true] spawn DS_fnc_moralAlter;
	DS_doingStuff = false;	
	["bones",true,1] call DS_fnc_handleInventory;
	
	if(((DS_infoArray select 10) == 0)&&(player distance (getMarkerPos "civ_spawn_1") < 5000))then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	
	if(((DS_infoArray select 10) == 1)&&(player distance (getMarkerPos "civ_spawn_2") < 5000))then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
		
	if(((DS_infoArray select 10) == 7)&&(player distance (getMarkerPos "civ_spawn_3") < 5000))then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
		
	if(((DS_infoArray select 10) == 11)&&(player distance (getMarkerPos "civ_spawn_2") < 5000))then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
		
	if(((DS_infoArray select 10) == 15)&&(player distance (getMarkerPos "gang_area_2") < 500))then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	
	if(((DS_infoArray select 10) == 15)&&(player distance (getMarkerPos "milzone") < 800))then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	
	if(((DS_infoArray select 10) == 21)&&(player distance (getMarkerPos "gang_area_2_1") < 300))then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	
	if(((DS_infoArray select 10) == 25)&&(player distance (getMarkerPos "gang_area_3_1") < 300))then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 9)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	
	if(((DS_infoArray select 10) == 28)&&(player distance (getMarkerPos "asdfsa") < 2500))then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 19)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	
	
	
	};

