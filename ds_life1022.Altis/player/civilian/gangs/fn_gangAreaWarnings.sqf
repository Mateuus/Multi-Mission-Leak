/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Warns gang area owners of people in their hideout
*/

if((vehicle player) isKindOf "Air")exitWith{sleep 30;[] spawn DS_fnc_gangAreaWarnings;};

private _hideout = switch(true)do {
	case (player distance gangFlag1 < 300): {gangFlag1};
	case (player distance gangFlag2 < 300): {gangFlag2};
	case (player distance gangFlag3 < 300): {gangFlag3};
	case (player distance gangFlag4 < 300): {gangFlag4};
	default {objNull};
};

if(isNull _hideout)exitWith{};

titleText ["Warning, you are in a Gang Area. These are KOS Zones (including unarmed persons)","PLAIN"];

private _group = _hideout getVariable ["gangOwner",grpNull];
if(isNull _group)exitWith{};
if(_group isEqualTo (group player))exitWith{};

private _isCop = if(playerSide isEqualTo west)then{true}else{false};
private _hideoutNumber = _hideout getVariable ["id","?"];
[_hideoutNumber,_isCop] remoteExec ["DS_civ_gangAreaWarningsGlobal",_group];