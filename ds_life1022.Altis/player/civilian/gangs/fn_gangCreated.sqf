/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Informs a player that their gang has been created
*/

params [
    ["_player",objNull,[objNull]],
    ["_group",grpNull,[grpNull]]
];

if((isNull _player)||(isNull _group))exitWith{};
if(!(player isEqualTo _player))exitWith{};

DS_doingStuff = false;

hint format ["Your gang %1 has been created. Open the gang dialog to manage your gang",(_group getVariable "gangName")];

[] spawn DS_civ_menuGangMain;

if((DS_infoArray select 15) == 0)then{[1] call DS_fnc_questCompleted};

//Is this clan meant to own rebel KOS?
if(((group player) getVariable ["gangName",""]) isEqualTo format["%1",DS_kosOwner])then {
	[false,false,false,false,false,true] call DS_fnc_captureRebelKosAlert;
	shawn1 setVariable["gangOwner",(group player),true];
};