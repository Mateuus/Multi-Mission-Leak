/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Verifies that the ticket was paid.
*/
private["_value","_unit","_cop","_addExpAmount","_valBon","_m","_data"];
_value = param [0,5,[0]];
_unit = param [1,ObjNull,[ObjNull]];
_cop = param [2,ObjNull,[ObjNull]];
//SkillSystem
_addExpAmount = 0;
_valBon = 0;
_m = 0.004;
//SkillSystem
if(isNull _unit OR {_unit != lhm_ticket_unit}) exitWith {}; //NO
if(isNull _cop OR {_cop != player}) exitWith {}; //Double NO

//SkillSystem
_data = missionNamespace getVariable "Ticket_Prof";
switch ( _data select 0 ) do
{
        case 0: {_m = 0.005;};
        case 1: {_m = 0.008;};
        case 2: {_m = 0.01;};
        case 3: {_m = 0.015;};
        case 4: {_m = 0.017;};
        case 5: {_m = 0.020;};
        case 6: {_m = 0.022;};
        case 7: {_m = 0.025;};
        case 8: {_m = 0.028;};
        case 9: {_m = 0.030;};
        case 10: {_m = 0.033;};
        case 11: {_m = 0.036;};
        case 12: {_m = 0.04;};
        case 13: {_m = 0.044;};
        case 14: {_m = 0.046;};
        case 15: {_m = 0.048;};
        case 16: {_m = 0.050;};
        case 17: {_m = 0.055;};
        case 18: {_m = 0.060;};
        case 19: {_m = 0.063;};
        case 20: {_m = 0.065;};
};
 
_valBon = round(_value * 0.10);
_addExpAmount = round(_valBon * _m);
["Ticket_Prof",_addExpAmount] call lhm_fnc_addExp;
[[0,format["You have earned %1 XP and a bonus of $%2 for this ticket", _addExpAmount, [_valBon] call lhm_fnc_numberText]],"lhm_fnc_broadcast",player,false] spawn lhm_fnc_MP;
 
lhm_atmcash = lhm_atmcash + _value + _valBon; 
//SkillSystem

//lhm_atmcash = lhm_atmcash + _value;