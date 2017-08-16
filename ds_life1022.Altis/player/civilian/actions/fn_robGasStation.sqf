/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Robs gas stations
*/

private ["_tempNum","_security","_robbed","_station","_copsNeeded","_action","_stationMoney","_MINTAKE","_bonus","_playerPos","_amountToSteal","_amountToStealBonus","_firstLoop","_totalStolen","_busted","_targets"];

_copsNeeded = 2;
_MINTAKE = 300;
_bonus = 0;
_playerPos = (position player);
_amountToSteal = 0;
_amountToStealBonus = 0;
_firstLoop = true;
_totalStolen = 0;
_robbed = false;
_busted = 0;
_security = false;

if(DS_doingStuff)exitwith{};

switch (true) do
	{
	case (player distance gasdesk1 < 50) : {_station = [1,"Kore",gasdesk1]};
	case (player distance gasdesk2 < 50) : {_station = [2,"Chalkeia",gasdesk2]};
	case (player distance gasdesk3 < 50) : {_station = [3,"Zaros",gasdesk3]};
	case (player distance gasdesk4 < 50) : {_station = [4,"Paros",gasdesk4]};
	case (player distance gasdesk5 < 50) : {_station = [5,"Athira",gasdesk5]};
	case (player distance gasdesk6 < 50) : {_station = [6,"Charkia",gasdesk6]};
	case (player distance gasdesk7 < 50) : {_station = [7,"Pyrgos",gasdesk7]};
	case (player distance gasdesk8 < 50) : {_station = [8,"Lakka",gasdesk8]};
	case (player distance gasdesk9 < 50) : {_station = [9,"Panochori",gasdesk9]};
	case (player distance gasdesk10 < 50) : {_station = [10,"Sofia",gasdesk10]};
	case (player distance hosp1 < 50) : {_station = [13,"Sofia",hosp1]};
	case (player distance hosp2 < 50) : {_station = [14,"Telos",hosp2]};
	};

if([player,15,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not rob this when another player is so nearby","PLAIN"];};

_action = [
		"Robbing this station makes this area a K.O.S zone and if caught by police will result in jail, Continue??",
		"Rob Station",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

{
	if(_x getVariable ["security",false])exitwith
		{
		_security = true;
		};
}forEach allPlayers;

if((!([_copsNeeded] call DS_fnc_countPlayers))&&(!_security))exitWith
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not rob a Gas Station when there is fewer than %1 white-listed cops and no security contractors online!<br/></t>",_copsNeeded];
	hint _str;
	};

_stationMoney = (gasMoneyArray select (_station select 0));
if(_stationMoney < _MINTAKE)exitwith{hint "There is not enough money here to steal"};

if(((primaryWeapon player) isEqualTo "")&&((handgunWeapon player) isEqualTo ""))exitwith
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You must be armed to rob this, You notice a camera move to face you... Run...<br/></t>";
	hint _str;
	player switchMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";
	[1,format["%1 has just attempted to rob the %2 Gas Station.",name player,(_station select 1)],true] remoteExecCall ["DS_fnc_globalMessage",west];
	};

[(position player),0] remoteExec ["HUNT_fnc_globalMarkers",2];
DS_doingStuff = true;

_targets = allPlayers select {(_x distance player) < 300};
[(_station select 2),"alarm"] remoteExec ["DS_fnc_playSounds",_targets];

_str = parseText "<t color='#01DF01' size='1.5'><br/>Remain close to the attendant to be given money<br/></t>";
hint _str;
systemchat "Remain close to the attendant to be given money";

sleep 5;

if(((gasMoneyArray select 11) > 100)||(DS_moral < 200)) then
	{
	_bonus = round _stationMoney * 3;
	}
	else
	{
	if(((gasMoneyArray select 11) > 70)||(DS_moral < 500)) then
		{
		_bonus = round _stationMoney * 2;
		}
		else
		{
		if((gasMoneyArray select 11) > 40) then
			{
			_bonus = _stationMoney;
			};
		};
	};

while{((player distance _playerPos < 6)&&(_stationMoney > _MINTAKE))}do
	{
	_amountToSteal = round random _stationMoney/2;
	_stationMoney = _stationMoney - _amountToSteal;

	_amountToStealBonus = round random _bonus/2;
	_bonus = _bonus - _amountToStealBonus;

	[(_amountToSteal + _amountToStealBonus),false,true] call DS_fnc_handleMoney;
	_robbed = true;

	if(_firstLoop) then
		{
		[0,format ["The %1 Gas Station is being robbed!",(_station select 1)],true,0] remoteExecCall ["DS_fnc_globalMessage",west];

		_targets = allPlayers select {_x getVariable ["security",false]};
		if(!(_targets isEqualTo []))then{[0,format ["The %1 Gas Station is being robbed!",(_station select 1)],true,0] remoteExecCall ["DS_fnc_globalMessage",_targets];};

		_targets = allPlayers select {(!(_x isEqualTo player))&&((side _x) isEqualTo civilian)&&((_x distance player) < 1000)};
		if(!(_targets isEqualTo []))then{[0,format ["The %1 Gas Station is being robbed!",(_station select 1)],true,0] remoteExecCall ["DS_fnc_globalMessage",_targets];};

		_firstLoop = false;
		};
	sleep 1;
	_totalStolen = _totalStolen + (round(_amountToSteal + _amountToStealBonus));
	_str = parseText format ["<t color='#01DF01' size='1.5'><br/>You have taken $%1, stay close to take more<br/></t>",(round(_amountToSteal + _amountToStealBonus))];
	hint _str;
	systemchat format ["You have taken $%1, stay close to take more",(round(_amountToSteal + _amountToStealBonus))];
	sleep 10;
	};
[(_station select 0)] remoteExec ["HUNT_fnc_shopRobbed",2];

if(((gasMoneyArray select 11) < 150)&&(_robbed)) then
	{
	gasMoneyArray set[0,2];
	_newVal = (DS_sellArray select 50) + (15 + (round random 20));
	DS_sellArray set[50,_newVal];
	publicVariable "DS_sellArray";
	};

gasMoneyArray set[(_station select 0),_stationMoney];
publicVariable "gasMoneyArray";
DS_doingStuff = false;

if(_stationMoney <= _MINTAKE) then
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>There is no money left in the till to steal<br/></t>";
	hint _str;
	systemchat "There is no money here left to steal";
	}
	else
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You moved too far away from the attendant<br/></t>";
	hint _str;
	systemchat "You moved too far away from the attendant";
	};

if(DS_moral > 750)then
	{
	_busted = round random 100;
	}
	else
	{
	_busted = round random 50;
	};
sleep 5;

if((DS_realMode)&&((headgear player) in ["H_RacingHelmet_1_orange_F","H_Shemag_khk","H_ShemagOpen_tan","H_Shemag_olive","H_ShemagOpen_tan","H_RacingHelmet_1_black_F","H_RacingHelmet_1_red_F","H_RacingHelmet_1_white_F","H_RacingHelmet_1_blue_F",
"H_RacingHelmet_1_yellow_F","H_RacingHelmet_1_green_F","H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_RacingHelmet_3_F","H_RacingHelmet_4_F"]))then{_busted = round random 30;};

if(_busted > 25) then
	{
	[1,format["The robber of the %1 Gas Station has been identified as %2.",(_station select 1),name player],true,0] remoteExecCall ["DS_fnc_globalMessage",west];
	["214"] spawn DS_fnc_addCharge;
	};

if((DS_infoArray select 15) == 1)then { [1] call DS_fnc_questCompleted };

if((DS_infoArray select 15) == 20)then {
	_tempNum = (DS_infoArray select 16) + _totalStolen;
	if(_tempNum > 99999)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

[25,false] call DS_fnc_moralAlter;
DS_illegalMoney = DS_illegalMoney + (_totalStolen/2);
_time = time + 2200;
waitUntil {((time > _time)||(!alive player))};
if(!alive player)exitwith{DS_illegalMoney = 0;};

if(DS_illegalMoney >= (_totalStolen/2))then
	{
	DS_illegalMoney = DS_illegalMoney - (_totalStolen/2);
	};