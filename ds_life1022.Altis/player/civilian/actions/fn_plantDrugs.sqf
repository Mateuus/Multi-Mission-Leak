/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Plants drugs
*/
private ["_tempNum","_spareWeight","_sp","_str","_item","_gcu","_seconds","_targets"];

if(DS_mining)exitwith{};
_spareWeight = DS_maxWeight - DS_currentWeight;
if(_spareWeight < 60)exitwith{hint "You need at least 60kg's of space to do this"};
_seconds = 30;
if(player distance (getMarkerPos "weedField") < 200)then{_str = "Weed";_item = "weedu"};
if(player distance (getMarkerPos "cocaineField") < 200)then{_str = "Cocaine";_item = "cocaineu"};
if(player distance (getMarkerPos "heroinField") < 200)then{_str = "Heroin";_item = "heroinu"};

_sp = getPos player;
if(!isNull objectParent player)exitwith{};//Nah brah

//User Actions
	_upp = format ["Planting %1",_str];
	disableSerialization;
	"progressBar" cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	_targets = allPlayers select {(_x distance player) < 100};
	[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExec ["DS_fnc_animSync",_targets];

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

		"progressBar" cutText ["","PLAIN"];
		player playActionNow "stop";

	if(player distance _sp > 5) exitWith {hint "You moved too far while you were planting."; "progressBar" cutText ["","PLAIN"]; DS_mining = false;};

	_seconds = (round(DS_moral/30)+10);
	if((DS_infoArray select 15) > 15)then
		{
		_seconds = (_seconds*0.7);
		};
	hint format ["Your drugs are planted, stay here %1 seconds and then you will automatically begin harvesting",_seconds];
	systemchat format ["Your drugs are planted, stay here %1 seconds and then you will automatically begin harvesting",_seconds];

	sleep _seconds;

	if(player distance _sp > 5) exitWith {hint "You moved too far from your growing point to harvest these drugs";systemchat "You moved too far from your growing point to harvest these drugs";DS_mining = false;};

	_upp = format ["Gathering %1",_str];
	disableSerialization;
	"progressBar" cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	_targets = allPlayers select {(_x distance player) < 100};
	[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExec ["DS_fnc_animSync",_targets];

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

		"progressBar" cutText ["","PLAIN"];
		player playActionNow "stop";

	if(player distance _sp > 5) exitWith {hint "You moved too far while you were harvesting."; "progressBar" cutText ["","PLAIN"]; DS_mining = false;};

	if(_spareWeight < 60)exitwith{DS_mining = false;hint "You don't have enough space to do this"};
	[_item,true,10] call DS_fnc_handleInventory;
	titleText [format ["You have collected 10 %1",_str], "PLAIN"];
	DS_mining = false;
	[5,false] spawn DS_fnc_moralAlter;

if((DS_infoArray select 15) == 15)then {
	_tempNum = (DS_infoArray select 16) + 10;
	if(_tempNum > 499)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};