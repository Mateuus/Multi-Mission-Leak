/*
	File: fn_hudUpdate.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_control","_text"];
disableSerialization;

_text = "";
_footText = "";
_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_control = _ui displayCtrl 23515;
_footer = _ui displayCtrl 23525;
_control ctrlSetPosition [safeZoneX+safeZoneW-0.15,safeZoneY+safeZoneH-0.548];
_footer ctrlSetPosition [safeZoneX+safeZoneW-0.75,safeZoneY+safeZoneH-0.04];

_hp = round((1 - (damage player)) * 100);
if (life_heroin_effect > 0) then { _hp = _hp * (life_drug_level + 1); };

_text = _text + format["<img size='1' image='icons\hud_health.paa' /> %1<br/>", _hp];
_text = _text + format["<img size='1' image='icons\hud_water.paa' /> %1<br/>", life_thirst];
_text = _text + format["<img size='1' image='icons\hud_food.paa' /> %1<br/>", life_hunger];
if ((life_dispatch select 0) > 0) then { _text = _text + format["<img size='1' image='icons\hud_police.paa' /> %1<br/>", life_dispatch select 1]; };
if (life_wanted > 0) then { _text = _text + format["<img size='1' image='icons\hud_police.paa' /> %1K<br/>", round(life_wanted / 1000)]; };
if (count life_bounty_uid > 0) then
{
	{
		_name = "UNAVAILABLE";
		_uid = _x;
		{ if (_uid == getPlayerUID _x) exitWith { _name = name _x } } forEach playableUnits;
		_text = _text + format["<img size='0.5' image='icons\hud_target.paa' /> <t size='0.5'>%1</t><br/>", _name];
	} forEach life_bounty_uid;
};
if ((player getVariable["can_revive",-1000]) > time) then { _text = _text + format["<img size='1' image='icons\hud_norevive.paa' /> %1<br/>", round((player getVariable["can_revive",-1000]) - time)]; };
if ((player getVariable["parole",-1000]) > time && !(player getVariable["paroleViolated",false])) then { _text = _text + format["<img size='1' image='icons\hud_parole.paa' /> %1m<br/>", ceil(((player getVariable["parole",-1000]) - time)/60)]; };
if (player getVariable["paroleViolated",false]) then { _text = _text + "<img size='0.6' image='icons\hud_parole.paa' /> <t size='0.6' color='#ff0000'>VIOLATED</t><br/>"; };
if (playerSide == west && count life_allpoints > 0) then
{
	_footText = format["<t align='center'>APB: <t color='#ff0000'>%1</t> wanted for $%2</t>", life_allpoints select 0, [life_allpoints select 3] call life_fnc_numberText];
};

_control ctrlSetStructuredText parseText _text;
_control ctrlCommit 0;

_footer ctrlSetStructuredText parseText _footText;
_footer ctrlCommit 0;