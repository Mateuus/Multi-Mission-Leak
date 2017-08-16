/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Defuses nearby placed C4
*/

private["_infoArray","_pos","_sleep"];

_infoArray = [];
_pos = (position player);
if(!isNull objectParent player)exitwith{hint "Yeah right lazy shit get out of your vehicle first"};
_sleep = 0.2;
if((DS_infoArray select 21) > 8)then{_sleep = _sleep*0.5;};
if((DS_infoArray select 21) > 28)then{_sleep = _sleep*0.5;};

switch (true) do
	{
	case (player distance repairBank1 < 50) : {_infoArray = [0,repairBank1,"bombPlaced",10]};
	case (player distance repairJail < 50) : {_infoArray = [0,repairJail,"bombPlaced",6]};
	case (player distance powerStation1 < 50) : {_infoArray = [0,powerStation1,"bombPlaced",12]};
	};

if([player,6,west] call DS_fnc_nearbyPlayers) exitWith {titleText["A work mate is too nearby to defuse this","PLAIN"];};

if(DS_doingStuff)exitwith{};

if(_infoArray isEqualTo [])exitwith{hint "You are not nearby anything to defuse"};
if(!((_infoArray select 1) getVariable [(_infoArray select 2),false]))exitwith{hint "There is nothing here to defuse"};
DS_doingStuff = true;
_upp = "Defusing C4";
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
	if(player distance _pos > (_infoArray select 3))exitwith {};
	};

	"progressBar" cutText ["","PLAIN"];
	player playActionNow "stop";

DS_doingStuff = false;
if(!isNull objectParent player) exitWith {};
if(!alive player) exitWith {};
if(player distance _pos > (_infoArray select 3))exitwith {hint "You moved too far away"};
(_infoArray select 1) setVariable [(_infoArray select 2),false,true];
[18000,"Defused C4",name player] remoteExec ["DS_fnc_copRewards",west];
[60000,true] remoteExec ["HUNT_fnc_policeBank",2];
if((DS_infoArray select 21) == 8)then { [3] call DS_fnc_questCompleted };
if((DS_infoArray select 21) == 28)then { [3] call DS_fnc_questCompleted };