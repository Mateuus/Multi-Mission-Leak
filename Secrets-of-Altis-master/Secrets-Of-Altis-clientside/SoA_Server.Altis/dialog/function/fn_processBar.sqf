/*-----------------------------------------------------------------------------

       Author: G00golplexian
       Name: fn_processBar.sqf
       Description: blabla process bar

------------------------------------------------------------------------------*/
disableSerialization;
private["_upp","_sleep","_cP","_animation","_isAnim","_distanceTarget","_background","_progress","_pgText","_pgPercent","_ui","_target","_distance"];
_upp = _this select 0;
_sleep = _this select 1;
_cPNew = _this select 2;
_animation = _this select 3;
_distanceTarget = _this select 4;

_isAnim = if(!isnil "_animation") then {true} else {false};
_target = if(!isnil "_distanceTarget") then {true} else {false};

5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_background = _ui displayCtrl 38201;
_progress = _ui displayCtrl 38202;
_pgText = _ui displayCtrl 38203;
_pgPercent = _ui displayCtrl 38204;

_hudselection = [] call life_fnc_hudcfg;
switch(((_hudselection select hudselection) select 3)) do {
	case 0: {_background ctrlSetText "images\hud\exp.paa"};
	case 1: {_background ctrlSetText "images\hud\exp2.paa"};
	case 2: {_background ctrlSetText ""};
};

playsound "woosh";
_background ctrlSetPosition [0.262812 * safezoneW + safezoneX,0.819 * safezoneH + safezoneY,0.474375 * safezoneW,0.209 * safezoneH];
_background ctrlCommit 0.3;
WaitUntil {CtrlCommitted _background};

_progress ctrlSetTextColor [0.3,0.3,0.3,0.85];
_pgText ctrlSetTextColor [0,1,0,1];
_pgPercent ctrlSetTextColor [0,1,0,1];
{_x ctrlCommit 1} foreach [_progress,_pgText,_pgPercent];

_pgText ctrlSetText _upp;
_pgPercent ctrlSetText "0%";
_progress progressSetPosition 0.01;
_tick = 0;
_ticklist = [0];
_cP = 0.01;

player action ["SwitchWeapon", player, player, 100];
sleep 1;

while{true} do {
	if(_isAnim) then {
		if(_tick in _ticklist) then 
		{
   			player playMove _animation;
   			_ticklist pushback (_tick+30);
		};
	_tick = _tick + 1;
	};
	uisleep _sleep;

	_cP = _cP + _cPNew;
	_progress progressSetPosition _cP;
	_pgPercent ctrlSetText format["%1%2",round(_cP * 100),"%"];

	if(life_istazed) exitWith {life_process_bad = true;};
	//if(life_interrupted) exitWith {life_process_bad = true;};
	if((player getVariable["restrained",false])) exitWith {life_process_bad = true;};
	if(!alive player) exitWith {life_process_bad = true;};
	if(_target) then {if(player distance _distanceTarget > (_this select 5)) exitWith {life_process_distance = true;}};
	if(_cP >= 1) exitWith {};
};

_progress ctrlSetTextColor [1,1,1,0];
_pgText ctrlSetTextColor [1,1,1,0];
_pgPercent ctrlSetTextColor [0,1,0,0];
{_x ctrlCommit 1} foreach [_progress,_pgText,_pgPercent];

playsound "woosh";
_background ctrlSetPosition [0.262812 * safezoneW + safezoneX,0.951 * safezoneH + safezoneY,0.474375 * safezoneW,0.209 * safezoneH];
_background ctrlCommit 0.3;

Waituntil{CtrlCommitted _background};

5 cutFadeout 0.2;
if(_isAnim) then {player playActionNow "stop";};