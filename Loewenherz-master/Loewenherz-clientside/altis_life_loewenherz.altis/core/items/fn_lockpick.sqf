/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];

_curTarget = cursorObject;
lhm_interrupted = false;
if(lhm_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in lhm_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];

lhm_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNamespace getVariable "lhm_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

// Animation Fix Test
if((weaponState player select 4) > 0) then {
	player action ["SwitchWeapon", player, player, 100];
};
waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0};

For "_i" from 0 to 1 step 0 do
{
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
	if(isNull _ui) then {
		5 cutRsc ["lhm_progress","PLAIN"];
		_ui = uiNamespace getVariable "lhm_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(lhm_istazed) exitWith {}; //Tazed
	if(lhm_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR lhm_istazed) exitWith {lhm_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {lhm_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; lhm_action_inUse = false;};
if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; lhm_action_inUse = false;};
if(!([false,"lockpick",1] call lhm_fnc_handleInv)) exitWith {lhm_action_inUse = false;};

lhm_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice < 30) then {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		lhm_vehicles pushBack _curTarget;
		if (playerside == civilian)then{
			[[getPlayerUID player,profileName,"487"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
		};
	} else {
		if (playerside == civilian)then{
			[[getPlayerUID player,profileName,"215"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
		};
		[[0,format[localize "STR_ISTR_Lock_FailedNOTF",profileName]],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;
		titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
	};
};