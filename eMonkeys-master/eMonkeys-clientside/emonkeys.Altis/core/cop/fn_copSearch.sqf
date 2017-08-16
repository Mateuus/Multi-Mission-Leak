/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns information on the search.
*/
eM_action_inUse = false;
private["_civ","_invs","_license","_robber","_guns","_gun"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
_robber = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr];
		_index = [_x select 0,(call sell_array)] call TON_fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * (((call sell_array) select _index) select 1));
		};
	} foreach _invs;
	if(_illegal > 6000) then
	{
		[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp;
	};
	
	[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp;
	[[0,format["%1 hat illegale Güter im Wert von %2€ dabei",(_civ getVariable["realname",name _civ]),[_illegal] call EMonkeys_fnc_numberText]],"EMonkeys_fnc_broadcast",west,false] call EMonkeys_fnc_mp;
	[format ["%1",_illegal],"EMonkeys_fnc_copcash",west,false] call EMonkeys_fnc_MP;
}
	else
{
	_inv = "Keine illegalen Items";
};
if(((!alive _civ) || (_civ getVariable["onkill",FALSE])) || player distance _civ > 5) exitWith {hint format["Konnte %1 nicht durchsuchen",_civ getVariable["realname",name _civ]]};
//hint format["%1",_this];
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Illegale Items</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>"
,(_civ getVariable["realname",name _civ]),_inv,if(_robber) then {"Bankräuber"} else {""}];

if(_robber) then
{
	[[0,format["%1 wurde als Räuber identifiziert!",(_civ getVariable["realname",name _civ])]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;
};