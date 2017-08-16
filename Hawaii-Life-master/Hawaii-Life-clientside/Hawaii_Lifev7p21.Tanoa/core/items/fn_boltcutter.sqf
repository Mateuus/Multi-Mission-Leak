#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_securityLvl","_blocked","_uid","_houseOK","_fail","_dice","_person"];
_building = param [0,ObjNull,[ObjNull]];
_blocked = false;
_houseOK = false;
_person = ObjNull;

if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};

if(isNil {(_building GVAR "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"; _blocked = true;};
_uid = (_building GVAR "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"; _blocked = true;};
_securityLvl = _building GVAR "house_security";
_houseOK = true;

[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
{
	if(getPlayerUid _x isEqualTo _uid) exitWith {_person = _x;};
}forEach playableUnits;

if(_securityLvl in [3,4,5]) then {
	[2,"STR_ISTR_Bolt_AlertPerson",true,[profileName]] remoteExecCall ["life_fnc_broadcast",_person];
};

if(_blocked) exitWith {};
if(_houseOK) then {
	switch (_securityLvl) do
	{
		case 0: {_fail = 10;};
		case 1: {_fail = 30;};
		case 2: {_fail = 40;};
		case 3: {_fail = 50;};
		case 4: {_fail = 60;};
		case 5: {_fail = 70;};
	};
};

_doors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _building), "numberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building GVAR [format["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.08;
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_isknocked) exitWith {}; //Knocked
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
if((player GVAR ["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;

if(life_boltcutter_uses >= 1) then {
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
};
if(_houseOK) then {
	_dice = floor (random 100);
	if(_dice >= _fail) exitWith {_houseOK = false;};
};
if(!_houseOK) then {
    _building SVAR[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
    if((_building GVAR["locked",false])) then {
	    _building SVAR["locked",false,true];
    };
	if (life_HC_isActive) then {
		[getPlayerUID player,profileName,"459"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	} else {
		[getPlayerUID player,profileName,"459"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
} else {
	hint "Das Security System hat den Einbruch geblockt!"; 
	if (life_HC_isActive) then {
		[getPlayerUID player,profileName,"459"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	} else {
		[getPlayerUID player,profileName,"459"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if(_securityLvl in [3,5]) then {
		if(!isNull _person) then {
			if(_securityLvl isEqualTo 3) then {
				[2,"STR_ISTR_Bolt_AlertPerson",true,[profileName]] remoteExecCall ["life_fnc_broadcast",_person];
			};
			if(_securityLvl isEqualTo 5) then {
				[1,"STR_WebcamReceive",true,[]] remoteExecCall ["life_fnc_broadcast",_person];
				sleep 8;
				[_building,player,cursorTarget] remoteExecCall ["life_fnc_webcamHouse",_person];
			};
		};
	};
};
