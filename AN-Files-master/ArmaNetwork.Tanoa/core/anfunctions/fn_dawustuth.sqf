/*
	File: fn_dawustuth.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by Rathbone for ArmA.Network
*/
if(life_gov select 3) then {
	titleText["Free Healthcare provided by the Government - Hold On","PLAIN"];
	uiSleep 8;
	if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
	titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
	player setDamage 0;
	player setvariable ["bloodlevel",5500];
	player setvariable ["bleedrate",0];
} else {
	if(an_cash < 100) exitWith {hint format[localize "STR_NOTF_HS_NoCash",100];};
	titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
	uiSleep 8;
	if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
	titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
	player setDamage 0;
	player setvariable ["bloodlevel",5500];
	player setvariable ["bleedrate",0];
	[100,0,1] call life_fnc_sewawruk;
};
