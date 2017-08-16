/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Plants drugs
*/
private ["_spareWeight","_sp","_str","_item","_gcu","_seconds"];

if(DS_mining)exitwith{};
_spareWeight = DS_maxWeight - DS_currentWeight;
if(_spareWeight < 60)exitwith{hint "You need at least 60kg's of space to do this"};
_seconds = 30;
if(player distance (getMarkerPos "weedField") < 200)then{_str = "Weed";_item = "weedu"};
if(player distance (getMarkerPos "cocaineField") < 200)then{_str = "Cocaine";_item = "cocaineu"};
if(player distance (getMarkerPos "heroinField") < 200)then{_str = "Heroin";_item = "heroinu"};

_sp = getPos player;
if((vehicle player) != player)exitwith{};//Nah brah

//User Actions
	_upp = format ["Planting %1",_str];
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"DS_fnc_animSync",true,false] spawn DS_fnc_MP;
	DS_mining = true;
	
	while{true} do
		{
		sleep 0.1;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player distance _sp > 5) exitWith {};
		};
		
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	
	if(player distance _sp > 5) exitWith {hint "You moved too far while you were planting."; 5 cutText ["","PLAIN"]; DS_mining = false;};
	
	_seconds = (round(DS_moral/30)+10);
	if((DS_infoArray select 15) > 14)then
		{
		_seconds = (_seconds*0.7);
		};
	/*
	_gcu = (nearestObjects [getpos player, ["O_APC_Wheeled_02_rcws_F"],  30] select 0);
	if((_gcu getVariable ["unpacked",false]))then
		{
		if(!isNil {_gcu})then{_seconds = 7};
		};
	/*	
	if((player_questLog select 2) > 20)then
		{
		_seconds = _seconds*0.7;
		};
	*/
	hint format ["Your drugs are planted, stay here %1 seconds and then you will automatically begin harvesting",_seconds];
	systemchat format ["Your drugs are planted, stay here %1 seconds and then you will automatically begin harvesting",_seconds];
	
	sleep _seconds;
	
	if(player distance _sp > 5) exitWith {hint "You moved too far from your growing point to harvest these drugs";systemchat "You moved too far from your growing point to harvest these drugs";DS_mining = false;};

	_upp = format ["Gathering %1",_str];
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"DS_fnc_animSync",true,false] spawn DS_fnc_MP;
	
	while{true} do
		{
		sleep 0.05;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player distance _sp > 5) exitWith {};
		};
		
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	
	if(player distance _sp > 5) exitWith {hint "You moved too far while you were harvesting."; 5 cutText ["","PLAIN"]; DS_mining = false;};

	if(_spareWeight < 60)exitwith{DS_mining = false;hint "You don't have enough space to do this"};
	[_item,true,10] call DS_fnc_handleInventory;
	titleText [format ["You have collected 10 %1",_str], "PLAIN"];
	DS_mining = false;
if((DS_infoArray select 15) == 14)then
	{
	_tempNum = (DS_infoArray select 16) + 10;
	DS_infoArray set [16,_tempNum];
	if((DS_infoArray select 16) > 199)then
		{
		[1] call DS_fnc_questCompleted;
		};
	};
	[5,false] spawn DS_fnc_moralAlter;

	