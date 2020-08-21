#include "..\..\script_macros.hpp"
/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns information on the search.
*/
life_action_inUse = false;
private["_civ","_invs","_robber","_weapons","_prim","_sec","_vest","_uni"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
_robber = [_this,2,false,[false]] call BIS_fnc_param;
_weapons = [_this,3,[],[[]]] call BIS_fnc_param;
_prim = _this select 3;
_sec = _this select 4;
_vest = _this select 5;
_uni = _this select 6;
if(isNull _civ) exitWith {};


if(isNull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then {
	{
		_displayName = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"displayName");
		_inv = _inv + format["%1 %2<br/>",SEL(_x,1),(localize _displayName)];
		_price = M_CONFIG(getNumber,"VirtualItems",SEL(_x,0),"sellPrice");
		if(!isNull (missionConfigFile >> "VirtualItems" >> SEL(_x,0) >> "processedItem")) then {
			_processed = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"processedItem");
			_price = M_CONFIG(getNumber,"VirtualItems",_processed,"sellPrice");
		};

		if(!(EQUAL(_price,-1))) then {
			ADD(_illegal,(SEL(_x,1) * _price));
		};
	} forEach _invs;
	if(_illegal > 6000) then {

		if(life_HC_isActive) then {
			[getPlayerUID _civ,_civ GVAR ["realname",name _civ],"482"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
		} else {
			[getPlayerUID _civ,_civ GVAR ["realname",name _civ],"482"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		};

	};

	if(life_HC_isActive) then {
		[getPlayerUID _civ,_civ GVAR ["realname",name _civ],"481"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	} else {
		[getPlayerUID _civ,_civ GVAR ["realname",name _civ],"481"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};

	[0,"STR_Cop_Contraband",true,[(_civ GVAR ["realname",name _civ]),[_illegal] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];
} else {
	_inv = localize "STR_Cop_NoIllegal";
};

if(!alive _civ || player distance _civ > 5) exitWith {hint format[localize "STR_Cop_CouldntSearch",_civ GVAR ["realname",name _civ]]};
//hint format["%1",_this];
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>" +(localize "STR_Cop_IllegalItems")+ "</t></t><br/>%2<br/><br/><br/><t color='#FF0000'>%3</t><br/><br/><t color='#FFD700'><t size='1.5'><br/>Wyposazenie:</t></t><br/><br/>Broń Główna: %4<br/>Broń Zapasowa: %5<br/>Kamizelka: %6<br/>Uniform: %7<br/><br/>"
,(_civ GVAR ["realname",name _civ]),_inv,if(_robber) then {"Obrabował Bank"} else {""},_prim,_sec,_vest,_uni];

if(_robber) then {
	[0,"STR_Cop_Robber",true,[(_civ GVAR ["realname",name _civ])]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};
