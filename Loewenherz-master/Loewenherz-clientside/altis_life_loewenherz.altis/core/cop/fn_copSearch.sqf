#include <macro.h>
/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns information on the search.
*/
lhm_action_inUse = false;
private["_civ","_invs","_license","_robber","_guns","_gun"];
_civ = param [0,Objnull,[Objnull]];
_invs = param [1,[],[[]]];
_robber = param [2,false,[false]];
if(isNull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call lhm_fnc_varHandle)] call lhm_fnc_varToStr];
		_index = [_x select 0,__GETC__(sell_array)] call TON_fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((__GETC__(sell_array) select _index) select 1));
		};
	} foreach _invs;
	if(_illegal > 6000) then
	{
		[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
	};
	
	[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
	[[0,"STR_Cop_Contraband",true,[(_civ getVariable["realname",name _civ]),[_illegal] call lhm_fnc_numberText]],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;
}
	else
{
	_inv = localize "STR_Cop_NoIllegal";
};
if(!alive _civ || player distance _civ > 5) exitWith {hint format[localize "STR_Cop_CouldntSearch",_civ getVariable["realname",name _civ]]};
//hint format["%1",_this];
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>" +(localize "STR_Cop_IllegalItems")+ "</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>"
,(_civ getVariable["realname",name _civ]),_inv,if(_robber) then {"Robbed the bank"} else {""}];

if(_robber) then
{
	[[0,"STR_Cop_Robber",true,[(_civ getVariable["realname",name _civ])]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
};