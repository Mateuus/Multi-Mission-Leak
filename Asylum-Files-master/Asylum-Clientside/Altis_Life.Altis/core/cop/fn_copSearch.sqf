/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns information on the search.
*/
private["_civ","_invs","_license","_robber","_runner","_guns","_gun","_holsterLabel","_money","_alcohol","_class","_className","_index"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_license = [_this,1,"",[""]] call BIS_fnc_param;
_invs = [_this,2,[],[[]]] call BIS_fnc_param;
_robber = [_this,3,false,[false]] call BIS_fnc_param;
_runner = [_this,4,false,[false]] call BIS_fnc_param;
_drug = [_this,5,0,[0]] call BIS_fnc_param;
_alcohol = [_this,6,0,[0]] call BIS_fnc_param;
_money = [_this,7,0,[0]] call BIS_fnc_param;
_extra = "";
if(isnull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
		_index = [_x select 0,life_illegal_items] call life_fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((life_illegal_items select _index) select 1));
		};
	} foreach _invs;

	[player, _illegal] spawn life_fnc_copSplit;
	[[0,format["%1 has $%2 worth of contraband on them.",name _civ,[_illegal] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	[floor (_illegal / 25)] spawn life_fnc_earnPrestige; 
}
	else
{
	_inv = "No illegal items";
};
if(!alive _civ || player distance _civ > 5) exitWith {hint format["Couldn't search %1", name _civ]};

if(_robber) then
{
	[player, _money] spawn life_fnc_copSplit;
	_extra = "Matches description of robbery suspect.<br/>"
};
if (_runner) then
{
	[player, _money] spawn life_fnc_copSplit;
	_extra = "Cash on hand has traces of narcotics.<br/>"
};

switch (true) do
{
	case (_drug > 0.9): { _extra = _extra + "Appears stoned out of his mind.<br/>" };
	case (_drug > 0.6): { _extra = _extra + "Clearly extremely intoxicated.<br/>" };
	case (_drug > 0.4): { _extra = _extra + "Clearly very intoxicated.<br/>" };
	case (_drug > 0.2): { _extra = _extra + "Seems moderately intoxicated.<br/>" };
	case (_drug > 0.05): { _extra = _extra + "Seems to have a buzz.<br/>" };
};
switch (true) do
{
	case (_alcohol > 0.9): { _extra = _extra + "BAC > 0.25; Dangerously intoxicated." };
	case (_alcohol > 0.6): { _extra = _extra + "BAC > 0.2; Extremely intoxicated." };
	case (_alcohol > 0.4): { _extra = _extra + "BAC > 0.1; Slurred speech and motor control." };
	case (_alcohol > 0.2): { _extra = _extra + "BAC > 0.06; Impaired reasoning and vision." };
	case (_alcohol > 0.05): { _extra = _extra + "BAC > 0.03; Unable to concentrate." };
};

if (_civ getVariable ["parole",-1000] > time) then { _extra = _extra + "<br/>Currently on parole" };
if (_civ getVariable ["parole",-1000] > time && _civ getVariable ["paroleViolated",false]) then { _extra = _extra + "<br/>PAROLE VIOLATED" };

_weapons = "";
{
	_weapons = _weapons + format["%1<br/>", getText(configFile >> "cfgWeapons" >> _x >> "displayName")];
} forEach (weapons _civ);
if (_weapons == "") then { _weapons = "No weapons"; };

_class = [];
_qty = [];
_magazines = "";
{
	if (!(_x in _class)) then { _class pushBack _x; _qty pushBack 0; };
	_index = -1;
	_className = _x;
	{ if (_x == _className) then { _index = _forEachIndex }} forEach _class;
	_qty set [_index, (_qty select _index) + 1];
} forEach (magazines _civ);
if (count _class == 0) then { _magazines = "No magazines or grenades"; }
else
{
	{
		_magazines = _magazines + format["%2x %1<br/>", getText(configFile >> "CfgMagazines" >> _x >> "displayName"), _qty select _forEachIndex];
	} forEach _class;
};

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>Cash on Hand:</t></t><br/>%6<br/><t color='#FFD700'><t size='1.5'>Weapons:</t></t><br/>%5<br/><t color='#FFD700'><t size='1.5'>Magazines:</t></t><br/>%7<br/><t color='#FFD700'><t size='1.5'>Licenses:</t></t><br/>%2<t color='#FFD700'><t size='1.5'><br/>Illegal Items</t></t><br/>%3<br/><br/><br/><t color='#FF0000'>%4</t>",name _civ,_license,_inv,_extra,_weapons,_money,_magazines];