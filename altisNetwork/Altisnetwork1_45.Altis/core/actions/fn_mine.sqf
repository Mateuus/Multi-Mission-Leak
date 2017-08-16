#include "..\..\script_macros.hpp"
    /*
        File: fn_mine.sqf
        Author: Devilfloh
        Editor: Dardo

        Description:
        Same as fn_gather,but it allows use of probabilities for mining.
    */
private["_maxGather", "_resource", "_amount", "_requiredItem", "_mined","_cpRate"];
if (life_action_inUse) exitWith {};
if ((vehicle player) != player) exitWith {};
if (dialog) exitWith {
if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
        advanced_log = format ["%1 - %2 Has used Y Menu Glitch",profileName,(getPlayerUID player)];
        publicVariableServer "advanced_log";
    };
    hint localize "STR_NOTF_glitchYMenu";
    [0,"STR_NOTF_YMenuGlitch",true, [profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};
if (player getVariable "restrained") exitWith {
    hint localize "STR_NOTF_isrestrained";
};
_exit = false;
if (player getVariable "playerSurrender") exitWith {
    hint localize "STR_NOTF_surrender";
};
life_action_inUse = true;
life_interrupted = false;

if((time - life_action_delay) < 1) exitWith {hint "You can't rapidly use action keys!"; _this SVAR ["inUse",false,true];};

_zone = "";
_requiredItem = "";
_zoneSize = (getNumber(missionConfigFile >> "CfgGather" >> "zoneSize"));

_resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals";
_percent = (floor random 100) + 1; //Make sure it's not 0

for "_i" from 0 to count(_resourceCfg)-1 do {
    _curConfig = _resourceCfg select _i;
    _resources = getArray(_curConfig >> "mined");
    _maxGather = getNumber(_curConfig >> "amount");
    _resourceZones = getArray(_curConfig >> "zones");
    _requiredItem = getText(_curConfig >> "item");
    _mined = "";

    if (_resources isEqualTo []) exitWith {}; //Smart guy :O
    for "_i" from 0 to count (_resources) do {
        if (count _resources isEqualTo 1) exitWith {
            if (!((_resources select 0) isEqualType [])) then {
                _mined = _resources select 0;
            } else {
                _mined = (_resources select 0) select 0;
            };
        };
        _resource = (_resources select _i) select 0;
        _prob = (_resources select _i) select 1;
        _probdiff = (_resources select _i) select 2;
        if ((_percent >= _prob) && (_percent <= _probdiff)) exitWith {
            _mined = _resource;
        };
    };

    {
        if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith {
            _zone = _x;
        };
    } forEach _resourceZones;

    if (_zone != "") exitWith {};
};

if (_zone isEqualTo "") exitWith {
    life_action_inUse = false;
};

if (_requiredItem != "") then {
    _valItem = missionNamespace getVariable "life_inv_" + _requiredItem;

    if (_valItem < 1) exitWith {
        switch (_requiredItem) do {
            case "pickaxe": {
                titleText[(localize "STR_NOTF_Pickaxe"), "PLAIN"];
            };
        };
        life_action_inUse = false;
        life_action_gathering = false;
        _exit = true;
  };
};

if (_exit) exitWith {
    life_action_inUse = false;
};

_amount = round(random(_maxGather)) + 1;
_diff = [_mined, _amount, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith {
    hint localize "STR_NOTF_InvFull";
    life_action_inUse = false;
};
player say3D "mining";

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_upp = "Mining...";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
/*
if ([life_currentExpPerks, "farmer"] call mav_ttm_fnc_hasPerk) then {
        _cpRate = 0.70; //-- _cpRate = 0.10;
    } else {
        _cpRate = 0.10; //-- _cpRate = 0.010;
    };
*/
while{true} do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
    sleep 0.1;
	//_cP = _cP + _cpRate;
    _cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_minespeedMultiplier", 1])); //Leveling System
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {}; //--Check if player is alive
	if(player != vehicle player) exitWith {}; //-- Check if player is in vehicle
	if(life_interrupted) exitWith {};
	if(dialog) exitWith {};
};

5 cutText ["","PLAIN"];
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

if (([true, _mined, _diff] call life_fnc_handleInv)) then {
    _itemName = M_CONFIG(getText, "VirtualItems", _mined, "displayName");
    titleText[format[localize "STR_NOTF_Gather_Success", (localize _itemName), _diff], "PLAIN"];
    life_action_delay = time;
};

["Mining"] spawn mav_ttm_fnc_addExp;

sleep 2.5;
life_action_inUse = false;