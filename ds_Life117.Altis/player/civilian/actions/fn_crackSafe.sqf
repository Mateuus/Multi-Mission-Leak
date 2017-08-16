/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Cracks the safes at fortknox
*/


private ["_infoArray","_pos","_copsNeeded"];
_infoArray = [];
if(playerside != civilian)exitwith{hint "Get out of here rookie, you can't do this"};
switch (true) do
	{
	case (player distance knox_safe1 < 7) : {_infoArray = [900,7,0.5,2]};
	case (player distance knox_safe2 < 7) : {_infoArray = [900,7,0.5,5]};
	};
	
if(_infoArray isEqualTo [])exitWith
	{
	hint "Move closer to use this";
	};
if(DS_item_cracker < 1)exitwith{hint "You need a cracking device to do this, buy these at the rebel KOS item shop"};
if((player distance knox_safe1 < 10)&&(!(knox_safe1 getVariable ["closed",false])))exitwith{hint "This safe is already opened"};
if((player distance knox_safe2 < 10)&&(!(knox_safe2 getVariable ["closed",false])))exitwith{hint "This safe is already opened"};
if((player distance knox_safe1 < 10)&&(knox_safe1 getVariable ["cracking",false]))exitwith{hint "This safe is already being cracked"};
if((player distance knox_safe2 < 10)&&(knox_safe2 getVariable ["cracking",false]))exitwith{hint "This safe is already being cracked"};
_pos = (position player);
_copsNeeded = (_InfoArray select 1);
if(!(miscInfoArray select 7))then
	{
	_copsNeeded = _copsNeeded - 1;
	};

if(!([_copsNeeded] call DS_fnc_countPlayers))exitWith	
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not destory this when there is fewer than %1 white-listed cops online!<br/></t>",_copsNeeded];
	hint _str;	
	};

if(DS_policeBank < 50000)exitwith{hint "There isn't enough money in the police bank to crack this"};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
	_upp = "Cracking Safe....";
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
			
	while{true} do
		{
		sleep (_InfoArray select 2);
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(player distance _pos > 10)exitwith {};
		if(DS_tazed)exitwith{};
		};
		
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	
	DS_doingStuff = false;
	if(!alive player) exitWith {};
	if(DS_tazed)exitwith{};
	if(player distance _pos > 10)exitwith {hint "You moved too far away"};
if((DS_infoArray select 17) == 12)then
	{
	[2] call DS_fnc_questCompleted;
	};
if(DS_item_safeCrackerAdv > 0)then
	{
	["safeCrackerAdv",false,1] call DS_fnc_handleInventory;
	_infoArray set [0,600];
	};
	
hint format ["You have set up your cracking device, this will have the safe cracked in %1 minutes",(round(_infoArray select 0)/60)];
systemchat format ["You have set up your cracking device, this will have the safe cracked in %1 minutes",(round(_infoArray select 0)/60)];
[[(_infoArray select 3),(_infoArray select 0)],"HUNT_fnc_knox",false,false] spawn BIS_fnc_MP;	

[50,false] call DS_fnc_moralAlter;