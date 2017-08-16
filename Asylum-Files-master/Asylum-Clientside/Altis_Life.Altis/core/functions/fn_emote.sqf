/*
	File: fn_emote.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Players emote.  C'mon, ask for permission before using our code, please.
*/

_unit = _this select 0;
_msg = _this select 1;

if(_unit getVariable ["restrained", false]) exitWith {hint "Your restraints are preventing you from making that movement!";};
if(vehicle _unit != _unit) exitWith {hint "It is dangerous to make movements like that while you're in a vehicle!";};

_black = ["Acts_listeningToRadio_In","Acts_listeningToRadio_Loop","Acts_listeningToRadio_Out","AinvPknlMstpSnonWnonDr_medic0","AinvPknlMstpSnonWnonDnon_medic_1","AfalPknlMstpSnonWnonDnon","Acts_carFixingWheel","AinvPknlMstpSlayWrflDnon","AmovPercMstpSnonWnonDnon","AmovPercMstpSnonWnonDnon_Ease","AmovPercMstpSsurWnonDnon","amovppnemstpsraswrfldnon","CutSceneAnimationBaseZoZo","AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon","Acts_B_M05_briefing"];

_emotes = [
	["piss","Acts_AidlPercMstpSlowWrflDnon_pissing"],
	["ninja","AmovPercMstpSnonWnonDnon_exerciseKata"],
	["squat","AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
	["pushup","AmovPercMstpSnonWnonDnon_exercisePushup"],
	["intro", "Acts_Kore_Introducing"]
];

_message = [_msg, 3] call aniChatEvents_substr;
if ((_message call aniChatEvents_strlen) > 0) then
{
	_index = [_message,_emotes] call life_fnc_index;
	if (_index < 0) exitWith {};
	_anim = (_emotes select _index) select 1;
	if (_anim in _black) exitWith {};
	if (vehicle player != player) exitWith {};
	[[player,_anim,"playNow"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
}
else
{
	_anims = "Valid emotes are: ";
	{ _anims = _anims + (_x select 0); if ((_forEachIndex + 1) < (count _emotes)) then { _anims = _anims + ", "; }; } forEach _emotes;
	_anims = _anims + ".";
	systemChat _anims;
};
