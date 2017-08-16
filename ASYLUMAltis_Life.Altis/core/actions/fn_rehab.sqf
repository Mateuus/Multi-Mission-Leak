/*
	File: fn_rehab.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Drugs are bad, mmkay?
*/

private ["_level","_startPos"];

if (life_drug_level == 0) exitWith {hint "You do not have a drug addiction!"};

_level = switch (true) do
{
	case (life_drug_level >= 0.9): { "extreme" };
	case (life_drug_level >= 0.7): { "major" };
	case (life_drug_level >= 0.5): { "substantial" };
	case (life_drug_level >= 0.3): { "moderate" };
	case (life_drug_level >= 0.1): { "minor" };
	default { "trivial" };
};

_handle = [format["<t align='center'>You have a <t color='#FF0000'>%1 drug addiction</t>! Getting cleaned up in rehab will cost you $5,000. Proceed?</t>", _level]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};

if(!([5000] call life_fnc_debitCard)) exitWith {};
life_drug_level = 0;
life_used_drug = [0,0,0,0];

_startPos = position player;
cutText ["", "BLACK OUT", 3];
sleep 3;
cutText["Time passes slowly...","BLACK FADED"];
0 cutFadeOut 999999;
player setPos (getMarkerPos "sky_dive");

sleep ((2 * 60) * life_drug_level);

player setPos _startPos;
cutText ["", "BLACK IN", 0.75];
sleep 0.75;

hint "You've kicked the addiction and feel healthy again! See you soon.";