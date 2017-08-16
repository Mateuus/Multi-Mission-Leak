#include "..\..\macros.hpp"
private["_display","_units","_type","_data","_rowData","_msg","_playertype"];

if !("ItemRadio" in assignedItems player) then {closeDialog 0; Hint "Du hast kein Smartphone!"};
disableSerialization;

waitUntil {!isNull findDisplay 88883};
_display = findDisplay 88883;
_cMedicList = _display displayCtrl 88888;
_cMessage = _display displayCtrl 88889;

switch((side player)) do {
  case independent:{
    _playertype = "MED";
  };
  case west: {
    _playertype = "COP";
  };
  case east: {
    _playertype = "WSC";
  };
};

lbClear _cMedicList;
{
  if(alive _x && (_x getVariable["realname",name _x] != "HC_1") && (_x getVariable["playertype",""] == _playertype) ) then
  {

    _cMedicList lbAdd format["%1",getPlayerDName(_x)];
    _cMedicList lbSetData [(lbSize _cMedicList)-1,str(_x)];
  };
} foreach playableUnits;

_cMessage ctrlSetText format["%1", DWEV_fwzentral_Target select 3];

DWEV_smartphoneTarget = DWEV_fwzentral_Target select 1;
