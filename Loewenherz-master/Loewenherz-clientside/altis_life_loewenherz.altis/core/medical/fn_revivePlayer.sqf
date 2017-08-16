/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title","_time","_data","_cpUp","_m1","_m","_valBon"];
_target = param [0,ObjNull,[ObjNull]];
if(isNull _target) exitWith {}; //DAFUQ?@!%$!R?EFFD?TGSF?HBS?DHBFNFD?YHDGN?D?FJH

_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if(player distance _target > 5) exitWith {}; //Not close enough.

//SkillSystem
_price = (call lhm_revive_fee);
_time = 0.5; _cpUp = 0.01;_m = 0.05;_m1 = 0.1;
_data = missionNamespace getVariable "Revive_Prof";
switch ( _data select 0 ) do
    {
            case 0: { _time = 0.5; _cpUp = 0.01;_m = 0.05;_m1 = 0.1;};
            case 1: { _time = 0.4; _cpUp = 0.01;_m = 0.08;_m1 = 0.11;};
            case 2: { _time = 0.35; _cpUp = 0.01;_m = 0.1;_m1 = 0.12;};
            case 3: { _time = 0.3; _cpUp = 0.01;_m = 0.15;_m1 = 0.13;};
            case 4: { _time = 0.25; _cpUp = 0.01;_m = 0.17;_m1 = 0.14;};
            case 5: { _time = 0.2; _cpUp = 0.01;_m = 0.20;_m1 = 0.15;};
            case 6: { _time = 0.2; _cpUp = 0.02;_m = 0.22;_m1 = 0.16;};
            case 7: { _time = 0.2; _cpUp = 0.03;_m = 0.25;_m1 = 0.17;};
            case 8: { _time = 0.2; _cpUp = 0.04;_m = 0.28;_m1 = 0.18;};
            case 9: { _time = 0.15; _cpUp = 0.05;_m = 0.30;_m1 = 0.19;};
            case 10: { _time = 0.1; _cpUp = 0.07;_m = 0.33;_m1 = 0.20;};
            case 11: { _time = 0.1; _cpUp = 0.08;_m = 0.36;_m1 = 0.21;};
            case 12: { _time = 0.1; _cpUp = 0.09;_m = 0.4;_m1 = 0.22;};
            case 13: { _time = 0.09; _cpUp = 0.09;_m = 0.44;_m1 = 0.23;};
            case 14: { _time = 0.09; _cpUp = 0.09;_m = 0.46;_m1 = 0.24;};
            case 15: { _time = 0.09; _cpUp = 0.10;_m = 0.48;_m1 = 0.25;};
            case 16: { _time = 0.08; _cpUp = 0.11;_m = 0.50;_m1 = 0.26;};
            case 17: { _time = 0.08; _cpUp = 0.12;_m = 0.55;_m1 = 0.27;};
            case 18: { _time = 0.07; _cpUp = 0.12;_m = 0.60;_m1 = 0.28;};
            case 19: { _time = 0.06; _cpUp = 0.13;_m = 0.63;_m1 = 0.29;};
            case 20: { _time = 0.05; _cpUp = 0.14;_m = 0.65;_m1 = 0.3;};
    };
//SkillSystem

//Fetch their name so we can shout it.
_targetName = _target getVariable["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];
lhm_action_inUse = true; //Lockout the controls.

_target setVariable["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNamespace getVariable ["lhm_progress",displayNull];
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

//Lets reuse the same thing!
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

	sleep _time;
	_cP = _cP + _cpUp; //SkSy Change
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(lhm_istazed) exitWith {}; //Tazed
	if(lhm_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["Reviving",ObjNull] != player) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"};
_target setVariable["Reviving",NIL,TRUE];
if(!alive player OR lhm_istazed) exitWith {lhm_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if((player getVariable["restrained",false])) exitWith {lhm_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; lhm_action_inUse = false;};
if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; lhm_action_inUse = false;};
//SkillSystem
_valBon = round(_price * _m1);//10,000 x 0.1 = 1000
diag_log format["valbon %1",_valBon];
_addExpAmount = round(_valBon * _m);//1000 x 0.05 = 50
[[0,format["Du bekommst %1 XP und einen Bonus von $%2 für's Wiederbeleben", _addExpAmount, [_valBon] call lhm_fnc_numberText]],"lhm_fnc_broadcast",player,false] call lhm_fnc_mp;
["Revive_Prof",_addExpAmount] call lhm_fnc_addExp;
lhm_atmcash = lhm_atmcash + _price + _valBon;
//SkillSystem
//lhm_atmcash = lhm_atmcash + (call lhm_revive_fee);
lhm_action_inUse = false;
_target setVariable["Revive",TRUE,TRUE];
[[profileName],"lhm_fnc_revived",_target,FALSE] call lhm_fnc_mp;

titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[(call lhm_revive_fee)] call lhm_fnc_numberText],"PLAIN"];

sleep 0.6;
player reveal _target;