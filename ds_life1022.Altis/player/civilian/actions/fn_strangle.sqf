/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Strangle someones downed body to fully kill them
*/

private ["_tempNum","_victim","_sleep","_targets"];
_victim = DS_cursorTarget;
if(isNull _victim)exitwith{};
if(!(_victim getVariable ["revive",false]))exitwith{hint "You can not use this on this player"};
_sleep = 0.15;
if((DS_infoArray select 15) > 42)then {
	_sleep = 0.06;
};

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

_upp = format ["Strangling %1",_victim getVariable ["name","Random guy"]];
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

if((random 6) > 2)then {
	_targets = allPlayers select {(_x distance player) < 50};
	[player,"strangle"] remoteExecCall ["DS_fnc_playSounds",_targets];
}  else {
	player say3D "strangle";
};

while{true} do {
	sleep _sleep;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(!isNull objectParent player) exitWith {};
	if(player distance _victim > 10)exitwith {};
};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
DS_doingStuff = false;
if(!alive player) exitWith {};
if(!isNull objectParent player) exitWith {};
if(player distance _victim > 10)exitwith {};
titleText [format["Success, %1 wont be getting up from that...",_victim getVariable ["name","This random guy"]],"PLAIN"];
_victim setVariable ["revive",false,true];

[50,false] call DS_fnc_moralAlter;

if(DS_tokenMission == 19)then {
	DS_tokenMission = -1;
	[50,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
};

if((DS_infoArray select 15) == 13)then { [1] call DS_fnc_questCompleted };

if(((DS_infoArray select 15) == 34)&&((player distance gangflag1 < 300)||(player distance gangflag2 < 300)||(player distance gangflag3 < 300)||(player distance gangflag4 < 300)))then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 2)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if((DS_infoArray select 15) == 42)then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 2)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};