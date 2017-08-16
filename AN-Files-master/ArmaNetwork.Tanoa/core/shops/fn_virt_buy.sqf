#include <macro.h>

/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/
if(!EAL_canSell) exitWith {EAL_sellSpamTries = EAL_sellSpamTries +1; hintSilent "You are trying to sell items more than once per half second!"; closeDialog 0;};
if(EAL_canSell) then {
    EAL_canSell = false;
    [] spawn { sleep 0.4; EAL_canSell = true; EAL_sellSpamTries = 0;};
};

private["_type","_price","_amount","_diff","_name","_hideout"];
if((lbCurSel 2401) isEqualTo -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call life_fnc_spunetuwada)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_wacruspekuc;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;
_name = getText (missionConfigFile >> "VirtualItems" >> _type >> "displayName");

if([_type,_amount] call life_fnc_virtualItemAdd) then
{
  _oldPrice = _price;
  _tax = false;
  _toSelect = ((life_capture_list) select 2);
  if(life_shop_type in ["rebel"] && {(_toSelect select 2) isEqualTo 1} && {((_toSelect select 0) != group player getVariable["gangName",""])}) then {
    _price = _price * 1.05;
    _tax = true;
  } else {
    _govtax = round (_price * (life_gov select 2) / 100);
    _price = _price + _govtax;
    if(_price > an_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
    life_tax = life_tax + _govtax;
    if(life_tax isEqualTo _govtax) then {
      if(!life_diagWaiting) then {
        life_diagWaiting = true;
        [] spawn {
          waitUntil{!dialog};
          life_diagWaiting = false;
          if(life_tax > 0) then {
            [2,life_tax] remoteExecCall ["life_fnc_updateGovDetails",2];
          };
          life_tax = 0;
        };
      };
    };
  };
  if((_price * _amount) > an_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; [_type,_amount] call life_fnc_virtualItemRemove;};
	hintSilent format[localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call life_fnc_rupadudejat];
  [(_price * _amount),0,1] call life_fnc_sewawruk;
  if(_tax) then {
    _taxed = round (_price - _oldPrice);
    if(_taxed < 1) exitWith {};
    systemChat format["A tax of %1 was taken by the owners of %2",_taxed,(_toSelect select 0)];
    life_tax = life_tax + _taxed;
    if(life_tax isEqualTo _taxed) then {
      [_toSelect select 0] spawn {
        waitUntil{!dialog};
        [2,nil,(_this select 0),life_tax] remoteExecCall ["life_fnc_gangUpdate",2];
        life_tax = 0;
      };
    };
  };
	[] call life_fnc_virt_update;
};
[3] call life_fnc_maphuwres;
