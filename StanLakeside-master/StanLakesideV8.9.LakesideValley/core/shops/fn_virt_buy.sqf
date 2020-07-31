#include <macro.h>
/*
	File: fn_virt_buy.sqf
	
	
	Description:
	Buy a virtual item from the store.
*/

private["_type","_price","_amount","_diff","_name","_hideout"];
if((lbCurSel 2401) isEqualTo -1) exitWith {[localize "STR_Shop_Virt_Nothing", false] spawn doquickmsg;};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call fnc_isnumber)) exitWith {[localize "STR_Shop_Virt_NoNum", false] spawn doquickmsg;};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {[localize "STR_NOTF_NoSpace", false] spawn doquickmsg; };
_amount = _diff;
_curTarget = cursorTarget;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > cash_in_hand && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
if(buying_virt_item) exitwith {};
buying_virt_item = true;

_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if((_price * _amount) < cash_in_hand) then {
		if (typeOf _curTarget IN ["critgamin_vangmcc_clothing","critgamin_vangmcc_fedex","critgamin_vangmcc_food","critgamin_vangmcc_general"] && count crew _curTarget != 0) then {
			_price = _price * 0.9;
			mobile_payment = _price * 0.9;
			_unit = (driver _curTarget);
		 	mobile_payment remoteExec ["fnc_totalmobile",_unit];
		};
	};

	if((_price * _amount) > cash_in_hand) exitWith {
		[localize "STR_NOTF_NotEnoughMoney", false] spawn domsg; 
		[false,_type,_amount] call life_fnc_handleInv; 
		buying_virt_item = false; 
	};
	[format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText], false] spawn doquickmsg;
	__SUB__(cash_in_hand,(_price * _amount));

	[] call life_fnc_virt_update;
};

buying_virt_item = false;
