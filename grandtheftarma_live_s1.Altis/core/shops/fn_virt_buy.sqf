#include <macro.h>

private["_type","_price","_amount","_diff","_name"];

if((lbCurSel 2401) == -1) exitWith { hint localize "STR_Shop_Virt_Nothing" };

_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;

if(!([_amount] call fnc_isnumber)) exitWith { hint localize "STR_Shop_Virt_NoNum"; };

_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

_amount = parseNumber(_amount);
if(_amount <= 0) exitWith { hint "You can't buy 0 of something."; };

if(_diff <= 0) exitWith { hint localize "STR_NOTF_NoSpace" };
_amount = _diff;

if ( _price * _amount > GTA_money_cash ) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};

_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then {
	
	hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
	__SUB__(GTA_money_cash,_price * _amount);

	[0] call GTA_fnc_updatePlayerPartial;
	[3] call GTA_fnc_updatePlayerPartial;
	[] call life_fnc_virt_update;
};
