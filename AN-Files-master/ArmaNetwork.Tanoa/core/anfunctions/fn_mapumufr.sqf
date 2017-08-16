/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
params [
	["_group",grpNull,[grpNull]],
	["_name","",[""]],
	["_id",0,[0]]
];

if (isNull _group) exitWith {};

[(getNumber (missionConfigFile >> "CfgGangs" >> "life_gang_price")),1,1] call life_fnc_sewawruk;

[player] joinSilent _group;
_group selectLeader player;
player setRank "COLONEL";

[format ["Your Gang %1 was successfully created", _name], true, [0,1,0,1]] call life_fnc_notificationHandler;

life_gangData set [0,_id];