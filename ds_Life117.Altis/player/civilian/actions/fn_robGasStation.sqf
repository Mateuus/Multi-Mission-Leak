/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Robs gas stations
*/
private ["_security","_robbed","_station","_copsNeeded","_action","_stationMoney","_MINTAKE","_bonus","_playerPos","_amountToSteal","_amountToStealBonus","_firstLoop","_totalStolen","_busted"];

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
	case (player distance gasdesk2 < 50) : {_station = [2,"Lakka",gasdesk2]};
	case (player distance gasdesk3 < 50) : {_station = [3,"Zaros",gasdesk3]};
	case (player distance gasdesk4 < 50) : {_station = [4,"Neochori",gasdesk4]};
	case (player distance gasdesk5 < 50) : {_station = [5,"Athira",gasdesk5]};
	case (player distance gasdesk6 < 50) : {_station = [6,"Gravia",gasdesk6]};
	case (player distance gasdesk7 < 50) : {_station = [7,"Pyrgos",gasdesk7]};
	case (player distance gasdesk8 < 50) : {_station = [8,"Chalkia",gasdesk8]};
	case (player distance gasdesk9 < 50) : {_station = [9,"Paros",gasdesk9]};
	case (player distance gasdesk10 < 50) : {_station = [10,"Sofia",gasdesk10]};
	};

if(!(miscInfoArray select 7))then
	{
	_copsNeeded = 1;
	};
if([getPos player,15,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not rob this when another player is so nearby","PLAIN"];};

_action = [
		"Robbing this station makes this area a K.O.S zone and if caught by police will result in jail, Continue??",
		"Rob Station",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

{
	if(_x getVariable ["security",false])then
		{
		_security = true;
		};
}forEach playableUnits;

if((!([_copsNeeded] call DS_fnc_countPlayers))&&(!_security))exitWith	
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not rob a Gas Station when there is fewer than %1 white-listed cops and no security contractors online!<br/></t>",_copsNeeded];
	hint _str;	
	};

_stationMoney = (gasMoneyArray select (_station select 0));
if(_stationMoney < _MINTAKE)exitwith{hint "There is not enough money here to steal"};

if(((primaryWeapon player) isEqualTo "")&&((handgunWeapon player) isEqualTo ""))exitwith
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You must be armed to rob this, You notice a camera move to face you... Run....<br/></t>";
	hint _str;
	player SwitchMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";
	[[1,format["%1 has just attempted to rob the %2 gas station.",name player,(_station select 1)],true],"DS_fnc_globalMessage",west,false] spawn DS_fnc_MP;
	};

[[(position player),0],"HUNT_fnc_globalMarkers",false,false] spawn BIS_fnc_MP;	
DS_doingStuff = true;
{
	if(player distance _x < 1000)then
		{
		[[(_station select 2),"alarm"] ,"DS_fnc_playSound",_x,false] spawn DS_fnc_MP;
		};
}forEach playableUnits;
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
			[[0,format["The %1 gas station is being robbed!.",(_station select 1)],true],"DS_fnc_globalMessage",true,false] spawn DS_fnc_MP;
			[[1,format["The %1 gas station is being robbed!.",(_station select 1)],true],"DS_fnc_globalMessage",true,false] spawn DS_fnc_MP;
			_firstLoop = false;
			};
		sleep 1;
		_totalStolen = _totalStolen + (round(_amountToSteal + _amountToStealBonus));
		_str = parseText format ["<t color='#01DF01' size='1.5'><br/>You have taken $%1, stay close to take more<br/></t>",(round(_amountToSteal + _amountToStealBonus))];
		hint _str;
		systemchat format ["You have taken $%1, stay close to take more",(round(_amountToSteal + _amountToStealBonus))];
		/*
		if((player_questLog select 2) == 18)then
			{
			_tempNum = (player_questLog select 3) + _totalAmountToSteal;
			player_questLog set [3,_tempNum];
			if((player_questLog select 3) > 49999) then
				{
				[0,0,1] spawn life_fnc_questCompleted;
				};
			};
		*/
		sleep 10;
		};
[[(_station select 0)],"HUNT_fnc_shopRobbed",false,false] spawn BIS_fnc_MP;
/*
if((player_questLog select 2) == 3)then
	{
	[0,0,1] spawn life_fnc_questCompleted;
	};
*/
if(((gasMoneyArray select 11) < 150)&&(_robbed)) then
	{
	gasMoneyArray set[0,2];
	_newVal = (DS_sellArray select 50) + (15 + (round random 20));
	DS_sellArray set[50,_newVal];
	publicVariable "DS_sellArray";
	};
/*		
if((player_questLog select 2) == 28)then
	{
	_tempNum = (player_questLog select 3) + _totalStolen;
	player_questLog set [3,_tempNum];
	if((player_questLog select 3) > 299999) then
		{
		[0,0,1] spawn life_fnc_questCompleted;
		};
	};
*/
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

if(_busted < 25) then
	{
	[[1,format["The robber of %1 gas was unable to be Identified.",(_station select 1)],true],"DS_fnc_globalMessage",west,false] spawn DS_fnc_MP;
	[[0,format["The robber of %1 gas was unable to be Identified.",(_station select 1)],true],"DS_fnc_globalMessage",west,false] spawn DS_fnc_MP;
	}
	else
	{
	[[1,format["The robber of %1 gas has been Identified as %2.",(_station select 1),name player,true]],"DS_fnc_globalMessage",west,false] spawn DS_fnc_MP;
	[[0,format["The robber of %1 gas has been Identified as %2.",(_station select 1),name player,true]],"DS_fnc_globalMessage",west,false] spawn DS_fnc_MP;
	["214"] spawn DS_fnc_addCharge;
	};
	
[25,false] call DS_fnc_moralAlter;
if((DS_infoArray select 15) == 1)then
	{
	[1] call DS_fnc_questCompleted;
	};
if((DS_infoArray select 15) == 18)then
	{
	_tempNum = (DS_infoArray select 16) + _totalStolen;
	DS_infoArray set [16,_tempNum];
	if((DS_infoArray select 16) > 99999)then
		{
		[1] call DS_fnc_questCompleted;
		};
	};
DS_illegalMoney = DS_illegalMoney + (_totalStolen/2);
_time = time + 2200;
waitUntil {((time > _time)||(!alive player))};
if(!alive player)exitwith{DS_illegalMoney = 0;};

if(DS_illegalMoney >= (_totalStolen/2))then
	{
	DS_illegalMoney = DS_illegalMoney - (_totalStolen/2);
	};
	
