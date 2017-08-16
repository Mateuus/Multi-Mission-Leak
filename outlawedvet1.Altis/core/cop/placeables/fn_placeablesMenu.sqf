private[];
disableSerialization;

createDialog "Life_Cop_Placeables";

waitUntil { !isNull(findDisplay 20000) };

_display = findDisplay 20000;
_placeables = _display displayCtrl 20001;
lbClear _placeables;


{
	_name = _x select 0;
	_className = _x select 1;

	
	_placeables lbAdd _name;
	_placeables lbSetData [(lbSize _placeables) - 1, _className];
} foreach (life_placeables);