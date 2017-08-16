/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Performs hospital robberies, both for cash and for drug packs
*/

private ["_tempNum","_security","_action","_station","_pos","_totalStolen","_copsNeeded","_amount","_amountToSteal","_busted","_targets"];

_action = false;
_action = [
		"Robbing this Hospital makes this area a K.O.S zone and if caught by police will result in jail, Continue??",
		"Rob Hospital",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

switch (true) do
	{
	case (player distance hosp1 < 50) : {_station = [12,"Sofia",hosp1,"DS_item_hydroPack"]};
	case (player distance hosp2 < 50) : {_station = [13,"Telos",hosp2,"DS_item_sodiumPack"]};
	};

if(isNil "DS_robbing")then{DS_robbing = false;};
if(DS_robbing)exitwith{hint "You have robbed something too recently and must wait";};
DS_robbing = true;

_pos = (position player);
_totalStolen = 0;
_copsNeeded = 3;
_amount = 0;
_amountToSteal = 0;
_busted = false;
_security = 0;

if([player,15,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not rob this when another player is so nearby","PLAIN"];DS_robbing = false;};

{
	if(_x getVariable ["security",false])then
		{
		_security = _security + 1;
		};
}forEach allPlayers;

if((!([_copsNeeded] call DS_fnc_countPlayers))&&(_security < 3))exitWith
	{
	DS_robbing = false;
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not rob a hospital when there is fewer than %1 white-listed cops and fewer then 3 security contractors online!<br/></t>",_copsNeeded];
	hint _str;
	};

if(((primaryWeapon player) isEqualTo "")&&((handgunWeapon player) isEqualTo ""))exitwith
	{
	DS_robbing = false;
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You must be armed to rob this, You notice a camera move to face you... Run...<br/></t>";
	hint _str;
	player switchMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";
	[1,format["%1 has just attempted to rob the %2 Hospital.",name player,(_station select 1)],true,0] remoteExecCall ["DS_fnc_globalMessage",west];
	};

if(DS_doingStuff)exitwith{DS_robbing = false;};
DS_doingStuff = true;

if(_this select 1)then
	{
	if(DS_currentWeight + 20 > DS_maxWeight)exitwith{hint "You need at least 20kg of carry space to steal a chemical pack";DS_doingStuff = false;DS_robbing = false;};

	_targets = allPlayers select {(_x distance player) < 1000};
	[(_station select 2),"alarm",true] remoteExecCall ["DS_fnc_playSounds",_targets];

	[0,format ["The %1 Hospital is being robbed!",(_station select 1)],false,0] remoteExecCall ["DS_fnc_globalMessage",west];

	_targets = allPlayers select {_x getVariable ["security",false]};
	if(!(_targets isEqualTo []))then{[0,format ["The %1 Hospital is being robbed!",(_station select 1),false,0],true] remoteExecCall ["DS_fnc_globalMessage",_targets];};

	_targets = allPlayers select {(!(_x isEqualTo player))&&((side _x) isEqualTo civilian)&&((_x distance player) < 1000)};
	if(!(_targets isEqualTo []))then{[0,format ["The %1 Hospital is being robbed!",(_station select 1),false,0],true] remoteExecCall ["DS_fnc_globalMessage",_targets];};

	_upp = "Searching for supplies";
	disableSerialization;
	"progressBar" cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	[(position player),0] remoteExec ["HUNT_fnc_globalMarkers",2];

	_sleep = 0.5;
	{
	if(((side _x) isEqualTo civilian)&&((_x distance player) < 200))then
		{
		_sleep = _sleep + 0.05;
		};
	} forEach allPlayers;

	while{true} do
		{
		sleep _sleep;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(!isNull objectParent player) exitWith {};
		if(player distance _pos > 10)exitwith {};
		};

	"progressBar" cutText ["","PLAIN"];
	player playActionNow "stop";
	[(_station select 0)] remoteExec ["HUNT_fnc_shopRobbed",2];
	if(!isNull objectParent player) exitWith {sleep 120;DS_robbing = false;};
	if(player distance _pos > 10)exitwith {hint "You moved too far away";DS_doingStuff = false;sleep 120;DS_robbing = false;};
	if((DS_currentWeight + 20) > DS_maxWeight)exitwith{hint "You are going to need 20kgs of free space to get these supplies";DS_doingStuff = false;sleep 120;DS_robbing = false;};
	_totalStolen = _totalStolen + 600;
	_amount = (gasMoneyArray select (_station select 0));
	if(_amount < 500)exitwith{_str = parseText "<t color='#FF0000' size='1.5'><br/>There are no chemicals here to steal<br/></t>";hint _str;systemchat "There are no chemicals left here to steal";DS_doingStuff = false;sleep 120;DS_robbing = false;};
	[(_station select 3),true,1] call DS_fnc_handleInventory;
	_str = parseText "<t color='#01DF01' size='1.5'><br/>You have stolen a chemical Pack, use it to open its contents<br/></t>";
	hint _str;
	_amount = _amount - 500;
	gasMoneyArray set [(_station select 0),_amount];
	publicVariable "gasMoneyArray";
	if((DS_infoArray select 15) == 17)then { [1] call DS_fnc_questCompleted };
	}
	else
	{
	[(position player),0] remoteExec ["HUNT_fnc_globalMarkers",2];

	_amount = (gasMoneyArray select (_station select 0));
	if(_amount < 100)exitwith{_str = parseText "<t color='#FF0000' size='1.5'><br/>There is not enough money here to steal<br/></t>";hint _str;systemchat "There is not enough money here to steal";DS_doingStuff = false;sleep 120;DS_robbing = false;};

	_targets = allPlayers select {(_x distance player) < 1000};
	[(_station select 2),"alarm",true] remoteExecCall ["DS_fnc_playSounds",_targets];

	[0,format ["The %1 Hospital is being robbed!",(_station select 1)],false,0] remoteExecCall ["DS_fnc_globalMessage",west];

	_targets = allPlayers select {_x getVariable ["security",false]};
	if(!(_targets isEqualTo []))then{[0,format ["The %1 Hospital is being robbed!",(_station select 1),false,0],true] remoteExecCall ["DS_fnc_globalMessage",_targets];};

	_targets = allPlayers select {(!(_x isEqualTo player))&&((side _x) isEqualTo civilian)&&((_x distance player) < 1000)};
	if(!(_targets isEqualTo []))then{[0,format ["The %1 Hospital is being robbed!",(_station select 1),false,0],true] remoteExecCall ["DS_fnc_globalMessage",_targets];};

	sleep 5;
	hint "Stay near the counter to continue taking money until it is all gone";
	systemchat "Stay near the counter to continue taking money until it is all gone";

	_sleep = 25;
	{
	if(((side _x) isEqualTo civilian)&&((_x distance player) < 200))then
		{
		_sleep = _sleep + 5;
		};
	}forEach allPlayers;

	while{((player distance _pos < 5)&&(_amount > 100))}do
		{
		sleep _sleep;
		_amountToSteal = round random _amount;
		_amount = _amount - _amountToSteal;
		if((DS_infoArray select 15) > 45)then
			{
			_amountToSteal = (_amountToSteal*2);
			};
		[_amountToSteal,false,true] call DS_fnc_handleMoney;
		_totalStolen = _totalStolen + _amountToSteal;
		_str = parseText format ["<t color='#01DF01' size='1.5'><br/>You have taken $%1, stay close to take more<br/></t>",(_amountToSteal)];
		hint _str;
		systemchat format ["You have taken $%1, stay close to take more",_amountToSteal];
		};

	if(_amount < 101)then
		{
		_str = parseText "<t color='#FF0000' size='1.5'><br/>There is no money left in the till to steal<br/></t>";
		hint _str;
		systemchat "There is no money here left to steal";
		}
		else
		{
		_str = parseText "<t color='#FF0000' size='1.5'><br/>You moved too far away from the counter<br/></t>";
		hint _str;
		systemchat "You moved too far away from the counter";
		};
	gasMoneyArray set [(_station select 0),_amount];
	publicVariable "gasMoneyArray";
	if((DS_infoArray select 15) == 8)then { [1] call DS_fnc_questCompleted };
	if((DS_infoArray select 15) == 32)then {
		_tempNum = (DS_infoArray select 16) + _totalStolen;
		if(_tempNum > 99999)then {
			[1] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [16,_tempNum];
		};
	};
	};
if(!DS_doingStuff)exitwith{sleep 120;DS_robbing = false;};
DS_doingStuff = false;
[(_station select 0)] remoteExec ["HUNT_fnc_shopRobbed",2];
_busted = round random 100;
sleep 5;

if((DS_realMode)&&((headgear player) in ["H_RacingHelmet_1_orange_F","H_Shemag_khk","H_ShemagOpen_tan","H_Shemag_olive","H_ShemagOpen_tan","H_RacingHelmet_1_black_F","H_RacingHelmet_1_red_F","H_RacingHelmet_1_white_F","H_RacingHelmet_1_blue_F",
"H_RacingHelmet_1_yellow_F","H_RacingHelmet_1_green_F","H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_RacingHelmet_3_F","H_RacingHelmet_4_F"]))then{_busted = _busted + 50;};

if(_busted < 75) then
	{
	[0,format["The robber of %1 Hospital has been identified as %2.",(_station select 1),name player],true,0] remoteExecCall ["DS_fnc_globalMessage",west];
	["518"] spawn DS_fnc_addCharge;
	};

[] spawn
	{
	_pos = position player;
	DS_houseBlock = true;
	_counter = 0;
	while{true}do
		{
		if(_counter > 60)exitwith{};
		if((position player) distance _pos > 3000)exitwith{};
		DS_houseBlock = true;
		sleep 10;
		_counter = _counter + 1;
		};
	DS_houseBlock = false;
	};

[25,false] spawn DS_fnc_moralAlter;
DS_illegalMoney = DS_illegalMoney + (_totalStolen/2);
sleep 120;DS_robbing = false;
_time = time + 2000;
waitUntil {((time > _time)||(!alive player))};
if(!alive player)exitwith{DS_illegalMoney = 0;};

if(DS_illegalMoney >= (_totalStolen/2))then
	{
	DS_illegalMoney = DS_illegalMoney - (_totalStolen/2);
	};