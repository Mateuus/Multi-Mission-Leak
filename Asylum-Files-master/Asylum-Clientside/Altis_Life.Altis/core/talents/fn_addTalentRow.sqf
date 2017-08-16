/*
	File: fn_addTalentRow.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Recursive function to add tree row to list control.
*/

private["_label","_list","_parent","_depth","_id","_i","_d"];

_list = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_parent = [_this,1,0,[0]] call BIS_fnc_param;
_depth = [_this,2,0,[0]] call BIS_fnc_param;

// Disable buttons by default since none are pre-selected

_talentInfo = if (life_gangperk) then { life_gangTalentInfo } else { life_talentInfo };
_talents = if (life_gangperk) then { life_gangtalents } else { life_talents };

for "_i" from 0 to ((count _talentInfo) - 1) do
{
	_x = _talentInfo select _i;
	if ((_x select 1) == (str playerSide) && (_x select 3) == _parent) then
	{
		_id = (_x select 0);
		_label = (_x select 2);
		for [{_d=0}, {_d<_depth}, {_d=_d+1}] do { _label = "- " + _label; };
		_list lbAdd _label;
		_list lbSetdata [(lbSize _list)-1,str(_id)];
		if (!(_id in _talents)) then { _list lbSetColor [(lbSize _list)-1,[1,1,1,0.5]]; };
		if (!((_x select 3) in _talents) && (_x select 3) > 0) then { _list lbSetColor [(lbSize _list)-1,[1,0,0,0.9]]; };
		[_list, _id, (_depth + 1)] call life_fnc_addTalentRow;
	};
};