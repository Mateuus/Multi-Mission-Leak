#include <macro.h>
/*
	File: fn_copdogSearch.sqf
	
	
	Description:
	Returns information on the search.
*/
life_action_inUse = false;

params [["_civ", ObjNull, [ObjNull]], ["_invs", [], [[]]], ["_robber", false, [false]], "_license", "_guns", "_gun", "_textbrah"];

_textbrah = "";
if(isNull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
		_index = [_x select 0,__GETC__(sell_array)] call fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((__GETC__(sell_array) select _index) select 1));
		};
	} foreach _invs;
	if(_illegal > 6000) then
	{
		[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"] remoteExec ["life_fnc_wantedAdd",2];
	};
	
	[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"] remoteExec ["life_fnc_wantedAdd",2];

	[0,format["K-9 unit just found illegal items on %1.",(_civ getVariable["realname",name _civ])]] remoteExecCall ["life_fnc_broadcast", -2]; 

}
else
{
	_inv = localize "STR_Cop_NoIllegal";
};
if((_civ getVariable["dead",FALSE]) || player distance _civ > 5) exitWith {hint format[localize "STR_Cop_CouldntSearch",_civ getVariable["realname",name _civ]]};

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>" +(localize "STR_Cop_IllegalItems")+ "</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>"
,(_civ getVariable["realname",name _civ]),_inv,if(_robber) then {"Robbed the bank"} else {""}];

if(_robber) then
{
	[0,format[localize "STR_Cop_Robber",(_civ getVariable["realname",name _civ])]] remoteExecCall ["life_fnc_broadcast", -2];
};