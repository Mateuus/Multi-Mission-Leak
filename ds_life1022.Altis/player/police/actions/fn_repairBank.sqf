/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Repairs what ever it's close to
*/

private["_infoArray","_pos","_sleep"];

_infoArray = [];
_pos = (position player);

if(player getVariable ["security",false])exitwith{hint "This option is for police only to use, use the close door option instead"};
if(!(playerSide isEqualTo west))exitwith{};
if((player getVariable ["policeSquad",""]) == "Rapid Response")then
		{
		_sleep = 0.1;
		}
		else
		{
		_sleep = 0.2;
		};

switch (true) do
	{
	case (player distance repairBank1 < 50) : {_infoArray = [0,repairBank1,"closed","Repaired the bank door"]};
	case (player distance repairJail < 50) : {_infoArray = [0,repairJail,"closed","Repaired the jail gate"]};
	case (player distance powerStation1 < 50) : {_infoArray = [0,powerStation1,"closed","Repaired the power station"]};
	};

//if([repairBank1,15,civilian] call DS_fnc_nearbyPlayers) exitWith {hint "A civilian is too nearby to repair this"};
if(_infoArray isEqualTo [])exitwith{hint "You are not nearby anything to defuse"};
if((_infoArray select 1) getVariable [(_infoArray select 2),false])exitwith{hint "There is nothing here to repair"};
DS_doingStuff = true;
_upp = "Repairing";
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
switch (true) do
	{
	case (player distance repairBank1 < 50) : {[0] remoteExec ["HUNT_fnc_bank",2];};
	case (player distance repairJail < 50) : {[0] remoteExec ["HUNT_fnc_jail",2];};
	case (player distance powerStation1 < 50) : {[0] remoteExec ["HUNT_fnc_power",2];};
	};

[8000,(_infoArray select 3),name player] remoteExec ["DS_fnc_copRewards",west];

[40000,true] remoteExec ["HUNT_fnc_policeBank",2];