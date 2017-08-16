/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Joins the currently selected gang
*/

disableSerialization;
private["_gangInfo","_members","_dialog","_gangList","_textBox","_playerlist","_gangName","_index","_armaGroup"];

_dialog = findDisplay 666672;
_gangList = _dialog displayCtrl 1500;

_index = lbCurSel _gangList;
_gangName = _gangList lbData _index;

if(player getVariable ["cuffed",false])exitwith{hint "You can not join a gang while restrained"};


_group = [_gangName] call DS_civ_getGroup;
if(isNull _group)exitwith{};//?? How??

_lockedState = _group getVariable "gangLocked";
if(_lockedState)exitwith{hint "You can not join this gang because it is currently locked"};
hint format ["Joining the %1 gang..........",_gangName];
[[_group,player],"HUNT_fnc_addPlayer",false,false] spawn DS_fnc_MP;
[player] joinSilent _group;