/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Joins the currently selected gang
*/

if(player getVariable ["restrained",false])exitWith{hint "You can not join a gang while restrained"};

disableSerialization;

private _dialog = findDisplay 666672;
private _gangList = _dialog displayCtrl 1500;
private _index = lbCurSel _gangList;
private _gangName = _gangList lbData _index;

private _group = [_gangName] call DS_civ_gangGetGroup;
if(isNull _group)exitWith{};
if((group player) isEqualTo _group)exitWith{};

private _lockedState = _group getVariable ["gangLocked",true];
private _leader = leader _group;
private _myClan = false;
if(isPlayer _leader)then{_myClan = ((getPlayerUID player) in ([_leader] call DS_fnc_getPlayerBaseList));};
if((!_myClan)&&(_lockedState))exitWith{hint "You can not join this gang because it is currently locked"};
if((count (units _group)) > 14)exitWith{hint "A gang can only have 15 members in it. This gang is full"};

hint format ["Joining the %1 gang...",_gangName];

[_group,player] remoteExecCall ["HUNT_fnc_addPlayer",2];
[_group] call DS_fnc_joinGroup;