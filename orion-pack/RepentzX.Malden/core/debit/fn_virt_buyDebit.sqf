#include "..\..\script_macros.hpp"
/*
    File: fn_virt_buyDebit.sqf
    Author: Bryan "Tonic" Boardwine
	Edited by: Ilusionz

    Description:
    Buy a virtual item from the store using a debit card.
*/
private ["_type","_price","_amount","_diff","_name","_hideout","_realPrice","_priceAfterTax","_debitTax","_realTaxAmount"];
if ((lbCurSel 2401) isEqualTo -1) exitWith {[localize "STR_Shop_Virt_Nothing",true,"slow"] call life_fnc_notificationSystem;};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if (!([_amount] call TON_fnc_isnumber)) exitWith {[localize "STR_Shop_Virt_NoNum",true,"slow"] call life_fnc_notificationSystem;};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if (_diff <= 0) exitWith {[localize "STR_NOTF_NoSpace",true,"slow"] call life_fnc_notificationSystem;};
_amount = _diff;
private _maldenArray = ["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"];
private _tanoaArray = ["Land_School_01_F","Land_Warehouse_03_F","Land_House_Small_02_F"];
private _hideoutObjs = [[["Malden", _maldenArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;
_hideout = (nearestObjects[getPosATL player,_hideoutObjs,25]) select 0;
if ((time - life_action_delay) < 0.2) exitWith {[localize "STR_NOTF_ActionDelay",true,"slow"] call life_fnc_notificationSystem;};
life_action_delay = time;
_realPrice = _price * _amount;
 
_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");

if ([true,_type,_amount] call life_fnc_handleInv) then {
	if (!isNil "_hideout" && {!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") >= _price}) then {
		_action = [
			format [(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(group player getVariable "gang_bank")] call life_fnc_numberText,
				[civRDM] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		
		if (_action) then {
			hint format [localize "STR_Shop_Virt_BoughtGang",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
			_funds = group player getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			group player setVariable ["gang_bank",_funds,true];

			if (life_HC_isActive) then {
				[1,group player] remoteExecCall ["HC_fnc_updateGang",HC_Life];
			} else {
				[1,group player] remoteExecCall ["TON_fnc_updateGang",RSERV];
			};

		} else {
			try {
				if (civRDM < _realPrice) then {
					if (civRDMed < _realPrice) then {
						[localize "STR_NOTF_NotEnoughMoney",true,"slow"] call life_fnc_notificationSystem; [false,_type,_amount] call life_fnc_handleInv;
						throw "No money";
					};
				};
				
				if ((civRDMed > _realPrice) && (civRDM < _realPrice)) then {
					if (LIFE_SETTINGS(getNumber,"debit_tax") isEqualTo 1) then {
						_debitTax = LIFE_SETTINGS(getNumber,"debit_taxAmount");
						_realTaxAmount = _debitTax * _realPrice;
						_priceAfterTax = _realPrice + _realTaxAmount;
						civRDMed = civRDMed - _priceAfterTax;
						[1] call SOCK_fnc_updatePartial;
						hint parseText format [localize "STR_Debit_Virt_BoughtItemTax",_amount,(localize _name),[_realPrice] call life_fnc_numberText,[_realTaxAmount] call life_fnc_numberText];
					} else {
						civRDMed = civRDMed - _realPrice;
						hint parseText format [localize "STR_Debit_Virt_BoughtItem",_amount,(localize _name),[_realPrice] call life_fnc_numberText];
						[1] call SOCK_fnc_updatePartial;
					};
					} else {
						if (life_has_debit isEqualTo true) then {
							hint parseText format [localize "STR_Debit_Virt_UsedOnHandCash",_amount,(localize _name),[_realPrice] call life_fnc_numberText];
							civRDM = civRDM - _realPrice;
							[0] call SOCK_fnc_updatePartial;
						} else {
							civRDM = civRDM - _realPrice;
							[0] call SOCK_fnc_updatePartial;
						};
					};
				} catch {
			};
		};
	} else {
		try {
			if (civRDM < _realPrice) then {
				if (civRDMed < _realPrice) then {
					[localize "STR_NOTF_NotEnoughMoney",true,"slow"] call life_fnc_notificationSystem; [false,_type,_amount] call life_fnc_handleInv;
					throw "No money";
				};
			};
			
				if ((civRDMed > _realPrice) && (civRDM < _realPrice)) then {
					if (LIFE_SETTINGS(getNumber,"debit_tax") isEqualTo 1) then {
						_debitTax = LIFE_SETTINGS(getNumber,"debit_taxAmount");
						_realTaxAmount = _debitTax * _realPrice;
						_priceAfterTax = _realPrice + _realTaxAmount;
						civRDMed = civRDMed - _priceAfterTax;
						[1] call SOCK_fnc_updatePartial;
						hint parseText format [localize "STR_Debit_Virt_BoughtItemTax",_amount,(localize _name),[_realPrice] call life_fnc_numberText,[_realTaxAmount] call life_fnc_numberText];
						[player,"buy"] remoteexeccall ["say3D",0];
					} else {
						civRDMed = civRDMed - _realPrice;
						hint parseText format [localize "STR_Debit_Virt_BoughtItem",_amount,(localize _name),[_realPrice] call life_fnc_numberText];
						[player,"buy"] remoteexeccall ["say3D",0];
						[1] call SOCK_fnc_updatePartial;
					};
					} else {
						if (life_has_debit isEqualTo true) then {
							hint parseText format [localize "STR_Debit_Virt_UsedOnHandCash",_amount,(localize _name),[_realPrice] call life_fnc_numberText];
							civRDM = civRDM - _realPrice;
							[player,"buy"] remoteexeccall ["say3D",0];
							[0] call SOCK_fnc_updatePartial;
						} else {
							civRDM = civRDM - _realPrice;
							[player,"buy"] remoteexeccall ["say3D",0];
							[0] call SOCK_fnc_updatePartial;
						};
					};
				} catch {
			};
		};
	[] call life_fnc_virt_update;
};

[3] call SOCK_fnc_updatePartial;
