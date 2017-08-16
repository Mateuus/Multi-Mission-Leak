/*---------------------------------------------------------------------------
	File: fn_placeablesMenu.sqf
	Description:
		Position des différents éléments du menu Placeable
---------------------------------------------------------------------------*/
disableSerialization;
createDialog "life_cop_placeables";
waitUntil { !isNull(findDisplay 20000) };
_display = findDisplay 20000;
_placeables = _display displayCtrl 20001;
lbClear _placeables;{
	_name = _x select 0;
    _className = _x select 1;
    _icon = _x select 2;
    _placeables lbAdd _name;
    _placeables lbSetData [(lbSize _placeables) - 1, _className];
    _placeables lbSetPicture [(lbSize _placeables)-1, _icon];
    lbSort _placeables;
} foreach (life_placeables);
