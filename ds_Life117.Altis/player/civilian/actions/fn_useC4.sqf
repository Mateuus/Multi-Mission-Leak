/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Uses C4
*/

private ["_infoArray","_pos","_copsNeeded"];
_infoArray = [];
switch (true) do
	{
	case (player distance repairBank1 < 50) : {_infoArray = [480,5,0.5,repairBank1]};
	case (player distance repairJail < 50) : {_infoArray = [240,3,0.5,repairJail]};
	case (player distance powerStation1 < 50) : {_infoArray = [240,4,0.5,powerStation1]};//Was 4
	};

if([getPos player,30,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another civilian is too nearby","PLAIN"];};	
	
if((DS_infoArray select 17) > 20)then{_infoArray set [2,0.35];};
if((DS_infoArray select 17) > 32)then{_infoArray set [2,0.25];};
	
if(_infoArray isEqualTo [])exitWith
	{
	hint "You can not use this item here";
	};

if((player distance repairBank1 < 50)&&(!(repairBank1 getVariable ["closed",false])))exitwith{hint "These doors are already destroyed"};
if((player distance repairBank1 < 50)&&(repairBank1 getVariable ["bombPlaced",false]))exitwith{hint "There is already a bomb planted here"};
if((player distance repairJail < 50)&&(!(repairJail getVariable ["closed",false])))exitwith{hint "These doors are already destroyed"};
if((player distance repairJail < 50)&&(repairJail getVariable ["bombPlaced",false]))exitwith{hint "There is already a bomb planted here"};
if((player distance powerStation1 < 50)&&(!(powerStation1 getVariable ["closed",false])))exitwith{hint "This station is already destroyed"};
if((player distance powerStation1 < 50)&&(powerStation1 getVariable ["bombPlaced",false]))exitwith{hint "There is already a bomb planted here"};
_pos = (position player);
_copsNeeded = (_InfoArray select 1);
if(!(miscInfoArray select 7))then
	{
	_copsNeeded = _copsNeeded - 1;
	};


if(!([_copsNeeded] call DS_fnc_countPlayers))exitWith	
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not destroy this when there is fewer than %1 white-listed cops online!<br/></t>",_copsNeeded];
	hint _str;	
	};

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
["c4",false,1] call DS_fnc_handleInventory;
	_upp = "Planting Explosive";
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
	if(DS_tazed)exitwith{};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {["c4",true,1] call DS_fnc_handleInventory;};	
	if(player distance _pos > 10)exitwith {hint "You moved too far away";["c4",true,1] call DS_fnc_handleInventory;};
(_infoArray select 3) setVariable ["bombPlaced",true,true];	
hint format ["The bomb has been planted, you have %1 minutes until it explodes, find cover and defend the area",(round(_infoArray select 0)/60)];
systemchat format ["The bomb has been planted, you have %1 minutes until it explodes, find cover and defend the area",(round(_infoArray select 0)/60)];
switch (true) do
	{
	case (player distance repairBank1 < 50) : {[[2,(_infoArray select 0)],"HUNT_fnc_bank",false,false] spawn BIS_fnc_MP;[[(position player),1],"HUNT_fnc_globalMarkers",false,false] spawn BIS_fnc_MP;};
	case (player distance repairJail < 50) : {[[2,(_infoArray select 0)],"HUNT_fnc_jail",false,false] spawn BIS_fnc_MP};
	case (player distance powerStation1 < 50) : {[[2,(_infoArray select 0)],"HUNT_fnc_power",false,false] spawn BIS_fnc_MP};
	};
	
if((DS_infoArray select 17) == 3)then
	{
	[2] call DS_fnc_questCompleted;
	};
	
sleep 10;
	
if((DS_infoArray select 17) == 9)then
	{
	while{true}do
		{
		if(!alive player)exitwith{};
		if(DS_jailed)exitwith{};
		if(!(powerStation1 getVariable ["closed",false]))exitWith
			{
			[2] call DS_fnc_questCompleted;
			};
		if(!(powerStation1 getVariable ["bombPlaced",false]))exitwith{};
		sleep 5;
		};
	};
if((DS_infoArray select 17) == 20)then
	{
	while{true}do
		{
		if(!alive player)exitwith{};
		if(DS_jailed)exitwith{};
		if(!(repairBank1 getVariable ["closed",false]))exitWith
			{
			[2] call DS_fnc_questCompleted;
			};
		if(!(repairBank1 getVariable ["bombPlaced",false]))exitwith{};
		sleep 5;
		};
	};
if((DS_infoArray select 17) == 32)then
	{
	while{true}do
		{
		if(!alive player)exitwith{};
		if(DS_jailed)exitwith{};
		if(!(repairJail getVariable ["closed",false]))exitWith
			{
			[2] call DS_fnc_questCompleted;
			};
		if(!(repairJail getVariable ["bombPlaced",false]))exitwith{};
		sleep 5;
		};
	};