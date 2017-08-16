/*
    Darkside Life

	Author: ColinM9991

	Description:
	Spectates the player
*/

private ["_unit","_player","_action","_targets","_eventHandler","_spectatorEH"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};
if((DS_realMode)&&(playerSide isEqualTo civilian))then{DS_realMode = false;sleep 0.2;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};
if(_unit isEqualTo player) exitWith {hint "You can not spectate yourself"};

_player = (name player);
_action = format ["(Spectating %1)",name _unit];
_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
[_player,_action] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];

[] spawn {
	while{dialog}do {
		closeDialog 0;
		sleep 0.01;
	};
};

_unit switchCamera "EXTERNAL";

hint format["You are now spectating %1 \n\n Press F10 to stop spectating",_unit getVariable["name",name _unit]];

_spectatorEH = player getVariable "spectatorEH";
if(!(isNil "_spectatorEH"))then {
	removeMissionEventHandler ["Draw3D",_spectatorEH];
	player setVariable ["spectatorEH", nil];
};

DS_amUnit = _unit;

_eventHandler = addMissionEventHandler ["Draw3D", {
	{
		if(DS_amUnit distance _x < 75)then {
			_textPos = [(visiblePosition _x) select 0,(visiblePosition _x) select 1,((_x modelToWorld (_x selectionPosition "head")) select 2)+0.5];
			drawIcon3D ["",[1,1,1,1],_textPos,0,0,0,name _x,2,0.03,"PuristaMedium"];
		};
	} forEach allPlayers;
}];

player setVariable ["spectatorEH",_eventHandler];

AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown",{
	if((_this select 1) == 68)then {
		(findDisplay 46) displayRemoveEventHandler ["KeyDown",AM_Exit];

		(vehicle player) switchCamera "EXTERNAL";
		hint "You have stopped spectating";
		DS_amUnit = player;

		_spectatorEH = player getVariable "spectatorEH";
		if(!(isNil "_spectatorEH"))then {
			removeMissionEventHandler ["Draw3D",_spectatorEH];
			player setVariable ["spectatorEH", nil];
		};

		if((playerSide isEqualTo civilian)&&((DS_infoArray select 34) == 1))then {
			DS_realMode = true;
			[] spawn {
				DS_realMode = true;
				while{true}do {
					waitUntil {(cameraView == "EXTERNAL")};
					if(!DS_realMode)exitWith{};
					(vehicle player) switchCamera "INTERNAL";
				};
			};
		};
	};
false}];