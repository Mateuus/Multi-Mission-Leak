#include <macro.h>
/*
File: fn_repairHackedCell.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.

Description:
Repair action of hacked cells, available for ALAC staff.
*/
if(playerSide != independent) exitWith {titleText["Das kann nur ein Techniker des ALAC!","PLAIN"];};

private["_cellName","_cellLaptop","_publicMarker","_cellLastHack","_cellInCapture","_cellsIdx","_cellObj","_group","_gangName","_action","_cpRate","_title","_ui","_progressBar","_titleText","_cP","_i","_lastHack"];

_cellName = [_this,3,"",[""]] call BIS_fnc_param;

if (isNil "_cellName") exitWith {
    //diag_log "DEBUG: _cellName is nil";
};
if (_cellName == "") exitWith {
    //diag_log "DEBUG: _cellName is empty";
};

//diag_log format["DEBUG fn_hackCell: _cellName = %1", _cellName];

_cellsIdx = [_cellName, PGSERV_mobile_radiocells] call TON_fnc_index;

if (_cellsIdx == -1) exitWith {
    //diag_log format["DEBUG fn_hackCell: unknown cell %1", _cellName"];
};

_cellObj = SEL(SEL(PGSERV_mobile_radiocells, _cellsIdx), 1);

_group = _cellObj GVAR["gangOwner", grpNull];
if (isNull _group) exitWith {hint "Diese Funkzelle ist derzeit nicht gehackt.";};

_cellInCapture = _cellObj GVAR["inCapture", false];
if(_cellInCapture) exitWith {hint "Eine andere Person interagiert zur Zeit mit dieser Funkzelle!";};

_cpRate = 0.003;

if(!isNil "_action" && {!_action}) exitWith {titleText["Aktion abgebrochen","PLAIN"];};
life_action_inUse = true;

_cellLaptop = (nearestObjects[getPosATL player,["Land_Laptop_device_F"],15]) select 0; // do not replace with SEL() - will not work
[[_cellLaptop, false], "PGSERV_fnc_hideObjectGlobal", false] spawn life_fnc_MP;

//Setup the progress bar
disableSerialization;
_title = "Funkzelle reparieren";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_i = 0;
life_curWep_h = currentWeapon player;
player action ["SwitchWeapon", player, player, 100];
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1" && _i mod 3 == 0) then {
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

    _cellObj SVAR["inCapture", true, true];

	if((_cP >= 1 || !alive player) || (life_istazed || life_interrupted)) exitWith
    {
        life_action_inUse = false;
        [[_cellLaptop], "PG_fnc_hideObjectGlobal", false] spawn life_fnc_MP;
        _cellObj SVAR["inCapture", false, true];
    };
	_i = _i + 1;
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!isNil "life_curWep_h" && (life_curWep_h != "")) then {
	if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
		player selectWeapon life_curWep_h;
	};
};

if((player GVAR["restrained",false])) exitWith
{
    life_action_inUse = false;
    titleText["Reparaturvorgang der gehackten Funkzelle abgebrochen","PLAIN"];
};

if(life_interrupted) exitWith
{
    life_interrupted = false;
    titleText["Reparaturvorgang der gehackten Funkzelle abgebrochen","PLAIN"];
};

titleText["Funkzelle repariert.","PLAIN"];

_lastHack = _cellObj GVAR["lastHack", 0];
if (_lastHack > 0) then {
    SUB(_lastHack, 1800); // block hacking only for the half time when repaired

    if ((serverTime - _lastHack) < 600) then {
        // block at least 10 more minutes...
        _lastHack = serverTime - 3000;
    };
};

_cellObj SVAR["disabled", false, true];
_cellObj SVAR["gangOwner", grpNull, true];
_cellObj SVAR["lastHack", _lastHack, true];

ADD(CASH, 50000);
[] call life_fnc_hudUpdate;
[0] call SOCK_fnc_updatePartial;

hint format["Du hast %1€ für das Reparieren dieser Funkzelle verdient.", [50000] call life_fnc_numberText];