/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Repairs what ever it's close to
*/

private["_infoArray","_pos"];

_infoArray = [];
_pos = (position player);

switch (true) do
	{
	case (player distance repairBank1 < 50) : {_infoArray = [0,repairBank1,"closed"]};
	case (player distance repairJail < 50) : {_infoArray = [0,repairJail,"closed"]};
	};

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
	sleep 0.2;
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
if(!isNull objectParent player) exitWith {};
if(player distance _pos > 10)exitwith {hint "You moved too far away"};
switch (true) do
	{
	case (player distance repairBank1 < 50) : {[0] remoteExec ["HUNT_fnc_bank",2];};
	case (player distance repairJail < 50) : {[0] remoteExec ["HUNT_fnc_jail",2];};
	};

[8000,"Repaired a door",name player] remoteExec ["DS_fnc_copRewards",west];