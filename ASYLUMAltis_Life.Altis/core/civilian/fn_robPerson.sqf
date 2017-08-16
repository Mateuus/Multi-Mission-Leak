/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber","_robbed"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

_robbed = life_money;

hint format["%1 has just robbed you of $%2!", name _robber, [_robbed] call life_fnc_numberText];

if(_robbed > 0) then
{
	[[_robbed,player],"life_fnc_robReceive",_robber,false] spawn BIS_fnc_MP;
	["cash","set",0] call life_fnc_uC;
}
else
{
	[[2,format["%1 doesn't have any money.",name player]],"life_fnc_broadcast",_robber,false] spawn BIS_fnc_MP;
};

[[129, _robber, format["%1 was robbed by %2 for $%3", profileName, name _robber, [_robbed] call life_fnc_numberText]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;