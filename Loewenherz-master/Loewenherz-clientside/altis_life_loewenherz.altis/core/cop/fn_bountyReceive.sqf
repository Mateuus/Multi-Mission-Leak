/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
private["_val","_total","_addExpAmount","_valBon","_m","_data"];
_val = param [0,"",["",0]];
_total = param [1,"",["",0]];
//SkillSystem
_addExpAmount = 0;
_valBon = 1;
//SkillSystem
_m = 0.06;
if(_val == _total) then
{
	titleText[format[localize "STR_Cop_BountyRecieve",[_val] call lhm_fnc_numberText],"PLAIN"];
}
	else
{
	titleText[format[localize "STR_Cop_BountyKill",[_val] call lhm_fnc_numberText,[_total] call lhm_fnc_numberText],"PLAIN"];
};
//SkillSystem 
_data = missionNamespace getVariable "Arrest_Prof";
switch ( _data select 0 ) do
{
        case 0: {_m = 0.05;};
        case 1: {_m = 0.08;};
        case 2: {_m = 0.1;};
        case 3: {_m = 0.15;};
        case 4: {_m = 0.17;};
        case 5: {_m = 0.20;};
        case 6: {_m = 0.22;};
        case 7: {_m = 0.25;};
        case 8: {_m = 0.28;};
        case 9: {_m = 0.30;};
        case 10: {_m = 0.33;};
        case 11: {_m = 0.36;};
        case 12: {_m = 0.4;};
        case 13: {_m = 0.44;};
        case 14: {_m = 0.46;};
        case 15: {_m = 0.48;};
        case 16: {_m = 0.50;};
        case 17: {_m = 0.55;};
        case 18: {_m = 0.60;};
        case 19: {_m = 0.63;};
        case 20: {_m = 0.65;};
};
 
_valBon = round((_val * 0.1) * _m);
diag_log format["valbon %1",_valBon];
_addExpAmount = round(_valBon * 0.05);
[[0,format["Du bekommst %1 XP und einen Bonus von $%2 für diese Verhaftung", _addExpAmount, [_valBon] call lhm_fnc_numberText]],"lhm_fnc_broadcast",player,false] spawn lhm_fnc_MP;
["Arrest_Prof",_addExpAmount] call lhm_fnc_addExp;
lhm_atmcash = lhm_atmcash + _val + _valBon;
//SkillSystem
//lhm_atmcash = lhm_atmcash + _val;