/*
	File: fn_hudUpdate.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_control","_text"];
disableSerialization;

_text = "<t align='center'>";
_footText = "";
_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_control = _ui displayCtrl 23515;
_header = _ui displayCtrl 23525;
_control ctrlSetPosition [safeZoneX,safeZoneY+safeZoneH-0.04,safeZoneW,0.04];
_header ctrlSetPosition [safeZoneX,safeZoneY,safeZoneW,0.04];

_hp = round((1 - (damage player)) * 100);
if (life_heroin_effect > 0) then { _hp = _hp * (life_drug_level + 1); };

_healthColor = switch (true) do
{
	case (_hp < 10): { "FF0000" };
	case (_hp < 20): { "FF4000" };
	case (_hp < 30): { "FF8000" };
	case (_hp < 40): { "FFB000" };
	case (_hp < 50): { "FFF000" };
	case (_hp < 60): { "D0FF00" };
	case (_hp < 70): { "90FF00" };
	case (_hp < 80): { "50FF00" };
	case (_hp < 90): { "25FF00" };
	default { "00FF00" };
};
if (isNull (findDisplay 7300)) then { _text = _text + format["<img size='1' image='icons\hud_health.paa' /><t color='#%3'> %1%2</t>    ", _hp, "%", _healthColor]; }
else { _text = _text + "<img size='1' image='icons\hud_health.paa' /><t color='#ff0000'> DEAD</t>    " };
_text = _text + format["<img size='1' image='icons\hud_water.paa' /> %1%2    ", life_thirst, "%"];
_text = _text + format["<img size='1' image='icons\hud_food.paa' /> %1%2    ", life_hunger, "%"];
if ((life_dispatch select 0) > 0) then { _text = _text + format["<img size='1' image='icons\hud_police.paa' /> %1    ", life_dispatch select 1]; };
if (life_wanted > 0) then { _text = _text + format["<img size='1' image='icons\hud_police.paa' /> %1K    ", round(life_wanted / 1000)]; };
if (count life_bounty_uid > 0) then
{
	{
		_name = "UNAVAILABLE";
		_uid = _x;
		{ if (_uid == getPlayerUID _x) exitWith { _name = name _x } } forEach allPlayers;
		_text = _text + format["<img size='0.5' image='icons\hud_target.paa' /> <t size='1'>%1</t>    ", _name];
	} forEach life_bounty_uid;
};
if ((player getVariable["can_revive",-1000]) > time) then { _text = _text + format["<img size='1' image='icons\hud_norevive.paa' /> %1    ", round((player getVariable["can_revive",-1000]) - time)]; };
if ((player getVariable["parole",-1000]) > time && !(player getVariable["paroleViolated",false])) then { _text = _text + format["<img size='1' image='icons\hud_parole.paa' /> %1m    ", ceil(((player getVariable["parole",-1000]) - time)/60)]; };
if (player getVariable["paroleViolated",false]) then { _text = _text + "<img size='1' image='icons\hud_parole.paa' /> <t size='1' color='#ff0000'>VIOLATED</t>    "; };
if (playerSide == west && count life_allpoints > 0) then
{
	_footText = format["<t align='center'>APB: <t color='#ff0000'>%1</t> wanted for $%2</t>", life_allpoints select 0, [life_allpoints select 2] call life_fnc_numberText];
};

_text = _text + "</t>";

_control ctrlSetStructuredText parseText _text;
_control ctrlCommit 0;

_header ctrlSetStructuredText parseText _footText;
_header ctrlCommit 0;