disableSerialization;
createDialog "life_cop_placeablesMEDIC";
waitUntil { !isNull(findDisplay 40000) };
_display = findDisplay 40000;
_placeables = _display displayCtrl 40001;
lbClear _placeables;
{
    _name = _x select 0;
    _className = _x select 1;
    _placeables lbAdd _name;
    _placeables lbSetData [(lbSize _placeables) - 1, _className];
} foreach (life_placeablesMEDIC);