/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Warns players of talking in sidechat
*/

private ["_action","_message","_targets"];

if(!((getPlayerUID player) in DS_adminList1))exitWith{};

_action = [
	"Global Helpchat/TS Warning?",
	"Important",
	"Continue",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(isNull DS_amUnit)then{DS_amUnit = player;};

if(miscInfoArray select 5)exitWith{hint "This tool has been used too recently. Try again soon";};
miscInfoArray set [5,true];
publicVariable "miscInfoArray";

_message = "No meta-gaming, abuse, complaints or voice in sidechat. For all GAME issues come speak with an admin on our TeamSpeak @ ts.thedarksidegames.com:10004";
[_message] remoteExecCall ["DS_fnc_DarkSide_Warnings",civilian];

sleep 30;

miscInfoArray set [5,false];
publicVariable "miscInfoArray";