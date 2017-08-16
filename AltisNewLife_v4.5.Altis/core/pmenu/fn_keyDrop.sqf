#include <macro.h>
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;
_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_sel = lbCurSel _list;
if(_sel == -1) exitWith {hint "Pas de données selectionnées";};
_index = (parseNumber(_list lbData _sel));
_vehicle = life_vehicles select _index;
if(_vehicle isKindOf "House_F") exitWith {hint "Vous ne pouvez pas supprimer les clés de votre maison !"};
_owners = _vehicle getVariable "vehicle_info_owners";
_index2 = [(steamid),_owners] call TON_fnc_index;
life_vehicles = life_vehicles - [_vehicle];
_owners set[_index,-1];
_owners = _owners - [-1];
_vehicle SVAR["vehicle_info_owners",_owners,true];
[] spawn life_fnc_keyMenu;