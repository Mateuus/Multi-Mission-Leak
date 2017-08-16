/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash","_victim","_rnd"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
_victim = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(_cash == 0) exitWith {titleText["They didn't have any cash..","PLAIN"]};

["cash","add",_cash] call life_fnc_uC;
titleText[format["You stole $%1",[_cash] call life_fnc_numberText],"PLAIN"];

if (45 in life_talents) then
{
	_rnd = random 100;
	if (_rnd >= 80) exitWith {systemChat "As a skilled mugger, you managed to rob the person without being reported!"};
};

serv_killed = [player,"211"];
publicVariableServer "serv_killed";
[[1,format["%1 has robbed %2 for $%3",name player,name _victim,[_cash] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;