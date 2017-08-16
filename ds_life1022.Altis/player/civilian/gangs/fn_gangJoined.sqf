/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Informs a player that they have joined a gang
*/

params [["_gangName","",[""]]];

if(_gangName isEqualTo "")exitWith{};

hint format ["You have joined the %1 gang",_gangName];
[] spawn DS_civ_menuGangMain;

[0,format ["%1 has joined your gang",name player],false,0] remoteExecCall ["DS_fnc_globalMessage",(group player)];