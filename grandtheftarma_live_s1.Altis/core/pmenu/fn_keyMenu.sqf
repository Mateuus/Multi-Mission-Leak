disableSerialization;

waitUntil {!isNull findDisplay 2700};
private _display = findDisplay 2700;
private _ctrlListVehicles = _display displayCtrl 2701;
lbClear _ctrlListVehicles;
private _ctrlListPlayers = _display displayCtrl 2702;
lbClear _ctrlListPlayers;

private _units = if (vehicle player == player) then {
  nearestObjects [player, ["Man"], 10]
} else {
  crew vehicle player
};
_units = _units - [player];

{
  private _vehicle = _x;

  if (!isNull _vehicle && alive _vehicle) then {
    private _colorName = [typeOf _vehicle, _vehicle getVariable "Life_VEH_color"] call life_fnc_vehicleColorStr;
    if (_colorName != "") then {_colorName = format ["(%1)", _colorName]};
    private _displayname = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
    private _picture = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "picture");
    private _distance = round (player distance _vehicle);
    _distance  = if (_distance > 100) then {">100"} else {str _distance};

    private _index = _ctrlListVehicles lbAdd format ["%1 %3 - [Distance: %2m]", _displayname, _distance, _colorName];
    if (_picture select [count _picture - 4] == ".paa") then {
      _ctrlListVehicles lbSetPicture [_index, _picture];
    };
    _ctrlListVehicles lbSetData [_index, str _forEachIndex];
  };
} forEach life_vehicles;

{
  if (!isNull _x && {isPlayer _x} && {alive _x} && {!isObjectHidden _x}) then {
    private _index = _ctrlListPlayers lbAdd format ["%1 - %2", _x getVariable ["nametag_title", name _x], side _x];
    _ctrlListPlayers lbSetData [_index, str _x];
  };
} forEach _units;

if (lbSize _ctrlListVehicles - 1 == -1) then {
  _ctrlListVehicles lbAdd "You don't own any vehicles";
  _ctrlListVehicles lbSetData [0, str objNull];
};
