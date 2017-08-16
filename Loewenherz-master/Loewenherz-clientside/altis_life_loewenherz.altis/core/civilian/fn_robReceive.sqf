/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash","_data","_addExpAmount"];
_cash = param [0,0,[0]];
//SkillSystem
_data = missionNamespace getVariable "Thief_Prof";
_addExpAmount = 25;
_addExpAmount = _addExpAmount + (5 * (_data select 0));
["Thief_Prof",_AddExpAmount] call lhm_fnc_addExp;
[[0,format["Du bekommst %1 XP für's Ausrauben", _addExpAmount]],"lhm_fnc_broadcast",player,false] spawn lhm_fnc_mp; 
//SkillSystem
if(_cash == 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

lhm_cash = lhm_cash + _cash;
titleText[format[localize "STR_Civ_Robbed",[_cash] call lhm_fnc_numberText],"PLAIN"];
