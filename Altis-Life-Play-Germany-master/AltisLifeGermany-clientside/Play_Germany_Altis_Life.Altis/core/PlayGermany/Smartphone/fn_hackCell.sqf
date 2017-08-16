#include <macro.h>
/*
File: fn_hackCell.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.

Description:
Does the hacking process of a radio cell.
*/
if(isNil {grpPlayer GVAR "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};

private["_cellName","_cellLaptop","_publicMarker","_cellLastHack","_cellInCapture","_cellsIdx","_cellObj","_group","_gangName","_action","_cpRate","_title","_ui","_progressBar","_titleText","_cP","_i","_provEarn","_cellClients","_provEarnPerClient","_provRange","_playerRadioProviderIdx"];

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

_cellLastHack = _cellObj GVAR["lastHack", 0];
if (_cellLastHack != 0 && ((_cellLastHack + 3600) > serverTime)) exitWith {hint "Diese Funkzelle wurde vor kurzem bereits gehackt!";};

_group = _cellObj GVAR["gangOwner", grpNull];
if(_group == grpPlayer) exitWith {titleText["Deine Gang hat bereits Kontrolle über diese Funkzelle!","PLAIN"]};

_cellInCapture = _cellObj GVAR["inCapture", false];
if(_cellInCapture) exitWith {hint "Nur eine Person kann die Funkzelle hacken!";};

/*if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format["Diese Funkzelle wird durch %1 kontrolliert.<br/><br/>Möchtest du die Funkzelle trotzdem hacken?",_gangName],
		"Funkzelle ist bereits unter Kontrolle...",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;

	_cpRate = 0.0015;
} else {
	_cpRate = 0.0009;
};*/

_cpRate = 0.003; // 0.003 every second with start of 0.01 means: 5 minutes hack process

if(!isNil "_action" && {!_action}) exitWith {titleText["Hackvorgang abgebrochen","PLAIN"];};
life_action_inUse = true;

// everything fine, start hack progress
//_cellLaptop = SEL(SEL(PGSERV_mobile_radiocells, _cellsIdx), 2);
_cellLaptop = (nearestObjects[getPosATL player,["Land_Laptop_device_F"],15]) select 0; // do not replace with SEL() - will not work
[[_cellLaptop, false], "PGSERV_fnc_hideObjectGlobal", false] spawn life_fnc_MP;

_publicMarker = createMarker [format["hacking_%1", _cellName], (position player)];
_publicMarker setMarkerColor "ColorRed";
_publicMarker setMarkerText "!Achtung! >>> Hackerangriff <<< !Achtung!";
_publicMarker setMarkerType "mil_warning";

//Setup the progress bar
disableSerialization;
_title = "Funkzelle hacken";
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
	uiSleep 1;
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

	if((_cP >= 1 || !alive player) || (life_istazed || life_interrupted) || (player GVAR["restrained",false])) exitWith
    {
        life_action_inUse = false;
        [[_cellLaptop], "PGSERV_fnc_hideObjectGlobal", false] spawn life_fnc_MP;
        _cellObj setVariable["inCapture", false, true];
        deleteMarker _publicMarker;
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

// Chris approved
if((player GVAR["restrained",false])) exitWith
{
    titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];
	life_action_inUse = false;
};

if(life_interrupted) exitWith
{
    life_interrupted = false;
    titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];
};

titleText["Funkzelle übernommen.","PLAIN"];

_cellObj SVAR["gangOwner", grpPlayer, true];
_cellObj SVAR["lastHack", serverTime, true];
_cellObj SVAR["lastHackedMsg", 0, true];

// reward for hacking
// for each provider
_provEarn = 5000 + round(random 5000); // minimum earn with 0 connected clients
_provClients = 0;

for "_provIdx" from 0 to ((count PGSERV_mobile_providers) - 1) do
{
    _provRange = SEL(SEL(PGSERV_mobile_providers, _provIdx), 1);
	_provEarnPerClient = SEL(SEL(PGSERV_mobile_providers, _provIdx), 7);

    if (_provEarnPerClient > 0 && _provRange > 0) then
    {
    	_cellClients = _cellObj nearEntities ["Man", _provRange];

	    {
	        _playerRadioProviderIdx = [_x GVAR["mobile_provider", ""], PGSERV_mobile_providers] call TON_fnc_index;

	        if (_playerRadioProviderIdx != -1) then
	        {
			    if (isPlayer _x && _provIdx == _playerRadioProviderIdx && _x != player) then
	            {
                    ADD(_provEarn, _provEarnPerClient);
                    ADD(_provClients, 1);
			    };
	        };
	    } forEach _cellClients;
    };
};

ADD(CASH, _provEarn);
[] call life_fnc_hudUpdate;
[0] call SOCK_fnc_updatePartial;

//diag_log format["Du hast %1€ für den Hack dieser Funkzelle mit %2 verbundenen Clients verdient", _provEarn, _provClients];
hint format["Du hast %1€ für den Hack dieser Funkzelle mit %2 verbundenen Clients verdient.", [_provEarn] call life_fnc_numberText, _provClients];

[[_cellName], "PGSERV_fnc_captureRadioCell", false] spawn life_fnc_MP;