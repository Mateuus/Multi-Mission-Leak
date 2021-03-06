/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens or closes the bank gates
*/

private["_infoArray","_pos","_str","_largeStr","_sleep","_targets"];

_sleep = 0.5;
_infoArray = [];
_pos = (position player);
if((DS_infoArray select 19) > 4)then{_sleep = 0.4};
if((DS_infoArray select 19) > 14)then{_sleep = 0.25};
if((DS_infoArray select 19) > 23)then{_sleep = 0.125};

switch (true) do
	{
	case (player distance repairBank1 < 50) : {_infoArray = [22000,repairBank1,"closed","Repaired the bank door"]};
	case (player distance repairJail < 50) : {_infoArray = [0,repairJail,"closed","Repaired the jail gate"]};
	case (player distance powerStation1 < 50) : {_infoArray = [0,powerStation1,"closed","Repaired the power station"]};
	};

if([repairBank1,5,independent] call DS_fnc_nearbyPlayers) exitWith {hint "A workmate is too nearby to repair this"};
if([repairBank1,10,civilian] call DS_fnc_nearbyPlayers) exitWith {hint "A civilian is too nearby to repair this"};
//if(_infoArray isEqualTo [])exitwith{hint "You are not nearby anything to repair"};
if(!((_infoArray select 1) getVariable [(_infoArray select 2),false]))then{_str = "Closing Doors";_largeStr = "Repaired the bank door";}else{_str = "Opening Doors"};
	DS_doingStuff = true;
	_upp = format ["%1",_str];
	disableSerialization;
	"progressBar" cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

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

DS_doingStuff = false;
if(!alive player) exitWith {};
if(!isNull objectParent player) exitWith {};
if(player distance _pos > 10)exitwith {hint "You moved too far away"};
if(_str == "Closing Doors")then
	{
	switch (true) do
		{
		case (player distance repairBank1 < 50) : {[0] remoteExec ["HUNT_fnc_bank",2];};
		case (player distance repairJail < 50) : {[0] remoteExec ["HUNT_fnc_jail",2];};
		case (player distance powerStation1 < 50) : {[0] remoteExec ["HUNT_fnc_power",2];};
		};
	}
	else
	{
		[1] remoteExec ["HUNT_fnc_bank",2];
		DS_securityOpenedDoors = true;
		publicVariable "DS_securityOpenedDoors";
		_targets = allPlayers select {(_x distance player) < 5000};
		[0,format["A security contractor has opened the bank doors",(_infoArray select 3)],false,0] remoteExecCall ["DS_fnc_globalMessage",_targets];
	};

if((_str == "Closing Doors")&&(!DS_securityOpenedDoors))then
	{
	hint format ["You have been paid a reward of $%1 because you %3",[(_infoArray select 0)] call DS_fnc_numberText,(_infoArray select 3)];
	systemchat format ["You have been paid a reward of $%1 because you %3",[(_infoArray select 0)] call DS_fnc_numberText,(_infoArray select 3)];
	[(_infoArray select 0),false,true] call DS_fnc_handleMoney;
	[0,format["A security contractor has %1",(_infoArray select 3)],false,0] remoteExecCall ["DS_fnc_globalMessage",-2];
	};