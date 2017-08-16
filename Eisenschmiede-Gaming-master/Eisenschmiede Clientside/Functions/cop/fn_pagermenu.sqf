private ["_cops","_streifen","_streifenlb","_i","_pager","_streife","_pagervar"];
disableSerialization;
createdialog "ES_pager";

_cops = [];
_streifen = getArray (missionConfigFile >> "CfgPager" >> "cops" >> "pager1");
_streifenlb = ((findDisplay 5689) displayCtrl 8256);
lbclear _streifenlb;

{if (side _x isEqualTo west) then {_cops pushback _x;}} foreach playableunits;

{
	_i = 0;
	_pager = _x;
	_streife = getText (missionConfigFile >> "CfgPager" >> "cops" >> "pager" >> _pager >> "display");
	{
		_pagervar = _x getVariable "pager";
		if (_pager isEqualTo _pagervar) then {
			_i = _i + 1;
		};
	} forEach _cops;
	_streifenlb lbAdd format["%1 (%2)",_streife, _i];
	_streifenlb lbSetData [(lbSize _streifenlb)-1,_pager];
} foreach _streifen;