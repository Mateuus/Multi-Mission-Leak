disableSerialization;
private ["_display", "_text", "_units", "_sideColors", "_sideColor", "_index"];

if (!dialog) then {
  createDialog "Life_atm_management";
};

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format ["<img size='1.7' image='icons\bank.paa'/> £%1<br/><img size='1.6' image='icons\money.paa'/> £%2", [GTA_money_bank] call life_fnc_numberText, [GTA_money_cash] call life_fnc_numberText];

_sideColors = [
  [east] call BIS_fnc_sideColor,
  [west] call BIS_fnc_sideColor,
  [independent] call BIS_fnc_sideColor,
  [civilian] call BIS_fnc_sideColor,
  [sideUnknown] call BIS_fnc_sideColor
];

{
  if(alive _x) then {
    _sideColor = _sideColors select ([side group _x] call BIS_fnc_sideID);
    _sideColor = format ["#(rgb,8,8,3)color(%1,%2,%3,1)", _sideColor select 0, _sideColor select 1, _sideColor select 2];

    _index = _units lbAdd format ["%1", _x getVariable ["nametag_title", name _x]];
    _units lbSetData [_index, str _x];
    _units lbSetPictureRight [_index, _sideColor];
  };
} foreach playableUnits - [player];

lbSort _units;

lbSetCurSel [2703, 0];
