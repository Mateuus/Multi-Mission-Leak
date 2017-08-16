#include "..\..\macros.hpp"
/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns information on the search.
*/
DWEV_action_inUse = false;
private ["_license","_guns","_gun","_Tax"];
params [
    ["_civ",objNull,[objNull]],
    ["_invs",[],[[]]],
    ["_robber",false,[false]]
];
_Tax = ((100 - CopTaxValue) / 100);
if(isNull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_displayName = M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
        _inv = _inv + format ["%1 %2<br/>",(_x select 1),(_displayName)];
		_index = [_x select 0,(sell_array)] call DWF_fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * (((sell_array) select _index) select 1));
		};
	} foreach _invs;
	
	
	if(_illegal > 5000) then
	{
		[getPlayerUID _civ,getPlayerName(_civ),"482"] remoteExec ["DWEV_fnc_wantedAdd",2];
	};
	
	[getPlayerUID _civ,getPlayerName(_civ),"481"] remoteExec ["DWEV_fnc_wantedAdd",2];

	format["%1 hatte illegale sachen im Wert von %2€ bei sich.",getPlayerDName(_civ),[(_illegal * _Tax)] call DWEV_fnc_numberText] remoteExec ["systemChat",west];
	dwf_cash = dwf_cash + (_illegal * _Tax);
	[player,(_illegal * (1 - _Tax)),"Person Durchsuchung"] remoteExec ["DWF_fnc_addToStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
}
	else
{
	_inv = "Keine illegalen Gegenstände gefunden.";
};

if(!alive _civ || player distance _civ > 5) exitWith {hint format["Konnte %1 nicht durchsuchen.",getPlayerDName(_civ)]};

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Illegale Gegenstände</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>"
,getPlayerDName(_civ),_inv,if(_robber) then {"Hat die Bank ausgeraubt."} else {""}];

if(_robber) then
{
	format["%1 wurde als Bankräuber identifiziert!",getPlayerDName(_civ)] remoteExec ["systemChat",-2];
};