/*
	File: fn_welcomeCredits.sqf
	Author: GR8 & John "Paratus" VanderZwet

	Description:
	Displays welcome message on connection
*/

private ["_players","_Delay"];
_players = _this select 0;

if(isDedicated) exitWith {};

_sizeTitle             = 0.7; // Font Size of the Title Messages
_sizeSubText         = 0.55;  // Font Size of the SubTitle Messages
_colorTitle         = "#CC1111"; // HTML Color Code of the Title Messages (must start with '#' )
_colorSubText         = "#c0be94"; // HTML Color Code of the SubTitle Messages (must start with '#' )
_alignTitle         = "right"; // Alignment of the Title Message (right or left)
_alignSubText         = "right"; // Alignment of the SubTitle Message (right or left)
_fontTitle             = "PuristaSemibold"; // Font Type Of Title Messages
_fontSubText        = "PuristaLight"; // Font Type Of SubTitle Messages

_Delay                = 8; // Wait in seconds before the credits start after player IS ingame
_FadeIn             = 3; //how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role

_posDefault         = [0.3,0.55,0.5]; // Default Positions of all Credits

_title             = "Welcome to The Asylum";
_shorttext         = "The world's largest Life RPG community";
_posText        = [0.65,0.5,0.4];

_title2         = "Prestigious";
_shorttext2     = "";
for "_i" from 1 to (count _players) do
{
	_shorttext2 = format["%1%2. %3<br/>", _shorttext2, _i, (_players select (_i - 1)) select 0];
};
_posText2        = [0.65,0.35,0.25];

_title3            = "Roleplaying";
_shorttext3      = "Asylum is an RP community. Follow RDM and VDM rules!";
_posText3        = [0.65,0.5,0.25];

_title4            = "Identity";
_shorttext4      = "Enjoy Altis Life? You'll love Identity. Check out IdentityRPG.com.";
_posText4        = [0.65,0.5,0.25];


















/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/*                                        /!\ DO NOT EDIT BELOW THIS LINE. DO NOT REMOVE CREDITS /!\
/*
/*                                            SCRIPTING BY:        GR8 [GhostzGamerz.com]
/*                                            VERSION:            2.1
/*                                            DATE:            21 December 2014
/*
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
_ms = [];
for "_i" from 1 to 4 do
{
    _t = if (_i!=1) then { format["_title%1",_i] } else { "_title" };
    _s = if (_i!=1) then { format["_shorttext%1",_i] } else { "_shorttext" };
    _p = if (_i!=1) then { format["_postext%1",_i] } else { "_postext" };
    if (!isNil _t or !isNil _s) then
    {
        _at = if (!isNil _t) then { call compile _t } else { "" };
        _as = if (!isNil _s) then { call compile _s } else { "" };
        _ap = if (!isNil _p) then { call compile _p } else { _posDefault };
        _ms = _ms + [[_at,_as,_ap]];
    }
};

sleep _Delay;
player enableSimulation true;
{
    _t = _x select 0;
    _s = _x select 1;
    _pX = _x select 2 select 0;
    _pY = _x select 2 select 1;
    _pW = _x select 2 select 2;
    _m = format ["<t size='%1' color='%2' align='%3' font='%4'>%5<br /></t>", _sizeTitle, _colorTitle, _alignTitle, _fontTitle, _t];
    _m = _m + format ["<t size='%1' color='%2' align='%3' font='%4'>%5<br /></t>", _sizeSubText, _colorSubText, _alignSubText, _fontSubText, _s];
    _tm = round (count toArray (_t+_s) / 6 / 2) + 3;
    [ _m, [_pX * safeZoneW + safeZoneX, _pW], [_pY * safezoneH + safezoneY, 1 * safezoneH + safezoneY], _tm, _FadeIn ] spawn BIS_fnc_dynamicText;
    sleep (_tm+_FadeIn+4);
} forEach _ms; 