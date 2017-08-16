/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Requests a player to join our TeamSpeak server
*/

private ["_unit","_message"];

if((DS_adminLevel != 1)&&(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

{
    _message = "An admin is requesting that you join the 'Waiting Room' channel on our TeamSpeak server @ ts.thedarksidegames.com:10004. Failure to do may result in being kicked";
    player say3D "AdminWarning";
    _str = parseText format ["<t color='#e4d727' size='1.5'><br/>-=! Warning !=-</t><br/><br/>%1<br/><br/>",_message];
    hint _str;
    systemChat format ["%1",_message];
    titleText [format ["%1", _message],"PLAIN DOWN"];
} remoteExec ["BIS_fnc_call",_unit];

hint format ["You have sent %1 a request to join our TeamSpeak server",(name _unit)];

_alert = format ["%1 has requested that %2 joins our TeamSpeak server",(name player),(name _unit)];
_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
[0,_alert] remoteExecCall ["DS_fnc_globalMessage",_targets];