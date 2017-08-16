private["_list","_sortArr","_name","_playableUnits","_playableUnitsName","_realName","_type","_Sorted"];
disableSerialization;
_list = ((findDisplay 2700) displayCtrl 2703);

lbClear _list;

_playableUnits = [];
_playableUnitsName = [];
_name = "";
_realName = "";
_type = "";

{
	if (alive _x) then {
		_name = toLower(_x getVariable["realname",name _x]);

		if([_name,toLower(ctrlText 9854)] call KRON_StrInStr) then {
			switch (side _x) do
			{
				case west: {_type = "Cop"};
				case civilian: {_type = "Civ"};
				case independent: {_type = "Med"};
			};
			_playableUnits pushBack [name _x, _x getVariable["realname",name _x],_type, _x];
			_playableUnitsName pushBack (name _x);
		};
	};
} foreach playableUnits;

_Sorted = _playableUnitsName call BIS_fnc_sortAlphabetically;

if (_Sorted isEqualTo []) exitWith {
	_list lbAdd localize "STR_no_player_name";
	_list lbSetdata [(lbSize _list)-1,"Null"];
};

{
	_indexUnits = [_x,_playableUnits] call ES_fnc_index;
	if(_indexUnits != -1) then {
		_name = (_playableUnits select _indexUnits) select 0;
		_realName = (_playableUnits select _indexUnits) select 1;
		_type = (_playableUnits select _indexUnits) select 2;
		_unit = (_playableUnits select _indexUnits) select 3;

		_list lbAdd format["%1",_realName];
		_list lbSetData [(lbSize _list)-1,str(_unit)];
	};
} foreach _Sorted;