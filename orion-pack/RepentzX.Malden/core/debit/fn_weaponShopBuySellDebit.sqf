#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopBuySellDebit.sqf
    Author: Bryan "Tonic" Boardwine
	Edited by: Ilusionz
	
    Description:
    Master handling of the weapon shop for buying / selling an item with a debit card.
*/
disableSerialization;
private ["_price","_item","_itemInfo","_bad"];
if ((lbCurSel 38403) isEqualTo -1) exitWith {[localize "STR_Shop_Weapon_NoSelect",true,"slow"] call life_fnc_notificationSystem;};
_price = lbValue[38403,(lbCurSel 38403)]; if (isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;

_bad = "";

if ((_itemInfo select 6) != "CfgVehicles") then {
    if ((_itemInfo select 4) in [4096,131072]) then {
        if (!(player canAdd _item) && (uiNamespace getVariable ["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = (localize "STR_NOTF_NoRoom")};
    };
};

if (_bad != "") exitWith {hint _bad};

if ((uiNamespace getVariable ["Weapon_Shop_Filter",0]) isEqualTo 1) then {
    civRDMed = civRDMed + _price;
	[1] call SOCK_fnc_updatePartial;
    [_item,false] call life_fnc_handleItem;
    hint parseText format [localize "STR_Debit_Weapon_Sold",_itemInfo select 1,[_price] call life_fnc_numberText];
    [nil,(uiNamespace getVariable ["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.
} else {
    private _maldenArray = ["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"];
    private _tanoaArray = ["Land_School_01_F","Land_Warehouse_03_F","Land_House_Small_02_F"];
    private _hideoutObjs = [[["Malden", _maldenArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;
    private _hideout = (nearestObjects[getPosATL player,_hideoutObjs,25]) select 0;
	
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
            hint parseText format [localize "STR_Shop_Weapon_BoughtGang",_itemInfo select 1,[_price] call life_fnc_numberText];
            _funds = group player getVariable "gang_bank";
            _funds = _funds - _price;
            group player setVariable ["gang_bank",_funds,true];
            [_item,true] spawn life_fnc_handleItem;

            if (life_HC_isActive) then {
                [1,group player] remoteExecCall ["HC_fnc_updateGang",HC_Life];
            } else {
                [1,group player] remoteExecCall ["TON_fnc_updateGang",RSERV];
            };
		} else {
			try {
				if (civRDM < _price) then {
					if (civRDMed < _price) then {
						[localize "STR_NOTF_NotEnoughMoney",true,"slow"] call life_fnc_notificationSystem;
						throw "No money";
					};
				};
				
				if ((civRDMed > _price) && (civRDM < _price)) then {
					if (LIFE_SETTINGS(getNumber,"debit_tax") isEqualTo 1) then {
						_debitTax = LIFE_SETTINGS(getNumber,"debit_taxAmount");
						_realTaxAmount = _debitTax * _price;
						_priceAfterTax = _price + _realTaxAmount;
						civRDMed = civRDMed - _priceAfterTax;
						[1] call SOCK_fnc_updatePartial;
						hint parseText format [localize "STR_Debit_BoughtItemTax",_itemInfo select 1,[_price] call life_fnc_numberText,[_realTaxAmount] call life_fnc_numberText];
						[_item,true] spawn life_fnc_handleItem;
					} else {
						civRDMed = civRDMed - _price;
						[1] call SOCK_fnc_updatePartial;
						hint parseText format [localize "STR_Debit_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText];
						[_item,true] spawn life_fnc_handleItem;
						
					};
					} else {
						if (life_has_debit isEqualTo true) then {
							hint parseText format [localize "STR_Debit_UsedOnHandCash",_itemInfo select 1,[_price] call life_fnc_numberText];
							civRDM = civRDM - _price;
							[0] call SOCK_fnc_updatePartial;
							[_item,true] spawn life_fnc_handleItem;
						} else {
							civRDM = civRDM - _price;
							[0] call SOCK_fnc_updatePartial;
							hint parseText format [localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText];
							[_item,true] spawn life_fnc_handleItem;
						};
					};
				} catch {
			};
		};
	
	} else {
		try {
			if (civRDM < _price) then {
				if (civRDMed < _price) then {
					[localize "STR_NOTF_NotEnoughMoney",true,"slow"] call life_fnc_notificationSystem;
					throw "No money";
				};
			};
			
			if ((civRDMed > _price) && (civRDM < _price)) then {
				if (LIFE_SETTINGS(getNumber,"debit_tax") isEqualTo 1) then {
					_debitTax = LIFE_SETTINGS(getNumber,"debit_taxAmount");
					_realTaxAmount = _debitTax * _price;
					_priceAfterTax = _price + _realTaxAmount;
					civRDMed = civRDMed - _priceAfterTax;
					[1] call SOCK_fnc_updatePartial;
					hint parseText format [localize "STR_Debit_BoughtItemTax",_itemInfo select 1,[_price] call life_fnc_numberText,[_realTaxAmount] call life_fnc_numberText];
					[_item,true] spawn life_fnc_handleItem;
				} else {
					civRDMed = civRDMed - _price;
					[1] call SOCK_fnc_updatePartial;
					hint parseText format [localize "STR_Debit_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText];
					[_item,true] spawn life_fnc_handleItem;
					
				};
				} else {
					if (life_has_debit isEqualTo true) then {
						hint parseText format [localize "STR_Debit_UsedOnHandCash",_itemInfo select 1,[_price] call life_fnc_numberText];
						civRDM = civRDM - _price;
						[0] call SOCK_fnc_updatePartial;
						[_item,true] spawn life_fnc_handleItem;
					} else {
						civRDM = civRDM - _price;
						[0] call SOCK_fnc_updatePartial;
						hint parseText format [localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText];
						[_item,true] spawn life_fnc_handleItem;
					};
				};
			} catch {
		};
	};
};
[] call life_fnc_saveGear;
