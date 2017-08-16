
/*
    File: fn_copBreakDoor.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Allows cops to 'kick' in the door?
*/
private["_house","_door","_title","_titleText","_progressBar","_cpRate","_cP","_uid"];
_house = param [0,ObjNull,[ObjNull]];

if (isNull _house || !(_house isKindOf "House_F")) exitWith {};
if (isNil {(_house getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};

_uid = (_house getVariable "house_owner") select 0;
if (!([_uid] call lhm_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};

_door = [_house] call lhm_fnc_nearestDoor;
if (_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"};
if ((_house getVariable [format["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

lhm_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_House_Raid_Progress";
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNamespace getVariable "lhm_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0092;

[[2,"STR_House_Raid_NOTF",true,[(_house getVariable "house_owner") select 1]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;

// Animation Fix Test
if((weaponState player select 4) > 0) then {
	player action ["SwitchWeapon", player, player, 100];
};
waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0};
		
for "_i" from 0 to 1 step 0 do {
	// Animation Fix Test
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		 player action ["SwitchWeapon", player, player, 100];
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		 player playActionNow "stop";
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		 player playActionNow "stop";
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	 };
	 // Animation Fix Test
    sleep 0.26;
    if (isNull _ui) then {
        5 cutRsc ["lhm_progress","PLAIN"];
        _ui = uiNamespace getVariable "lhm_progress";
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive player) exitWith {};
    if (lhm_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if (!alive player) exitWith {lhm_action_inUse = false;};
if (lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; lhm_action_inUse = false;};

lhm_action_inUse = false;
_house animate [format["door_%1_rot",_door],1];
_house setVariable [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
