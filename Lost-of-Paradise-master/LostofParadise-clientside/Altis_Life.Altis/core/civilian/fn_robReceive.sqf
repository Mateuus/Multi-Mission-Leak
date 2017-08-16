/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
if (license_civ_rebel) then {
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash == 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

life_6cash = life_6cash + _cash;
titleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"PLAIN"];
}
else 
{ 
hint "Du brauchst eine Rebellenlizenz!";
};