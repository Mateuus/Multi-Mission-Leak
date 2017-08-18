#include <macro.h>
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) == -1) exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 5;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;

_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = (localize "STR_NOTF_NoRoom")};
	};
};

if(_bad != "") exitWith {hint _bad};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	//if(_item in ownedWeapons) exitWith {};
	["cash","add",_price] call life_fnc_handlePaper;
	PlaySound "purchase";
	[_item,false,false,false,false,false,false,true] spawn life_fnc_handleItem;
	hint parseText format[localize "STR_Shop_Weapon_Sold",_itemInfo select 1,[_price] call life_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter;
}
	else
{
	private["_hideout"];
	_price = (_price * __GETC__(life_vip_discount));
	//_hideout = {if(player distance _x < 50) exitWith {true}; false} forEach [gang_flag_1,gang_flag_2,gang_flag_3];
	if(/*_hideout && */{!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(group player getVariable "gang_bank")] call life_fnc_numberText,
				[life_cash] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint parseText format[localize "STR_Shop_Weapon_BoughtGang",_itemInfo select 1,[_price] call life_fnc_numberText];
			_funds = group player getVariable "gang_bank";
			_funds = _funds - _price;
			group player setVariable["gang_bank",_funds,true];
			PlaySound "purchase";
			[_item,true,false,false,false,false,false,true] spawn life_fnc_handleItem;
			[[1,group player,_funds],"TON_fnc_updateGang",(false),false] spawn life_fnc_MP;
		} else {
			if(_price > life_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
			hint parseText format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText];
			["cash","take",_price] call life_fnc_handlePaper;
			PlaySound "purchase";
			[_item,true,false,false,false,false,false,true] spawn life_fnc_handleItem;
		};
	} else {
		_oldPrice = _price;
		_tax = false;
		_toSelect = ((life_capture_list) select 0);
		if(life_weaponShop in["gang","rebel"] && (_toSelect select 2) == 1 && (_toSelect select 0) != group player getVariable["gang_name",""]) then {
			_price = round (_price * 1.04);
			_tax = true;
		};
		if(_price > life_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
		hint parseText format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText];
		["cash","take",_price] call life_fnc_handlePaper;
		PlaySound "purchase";
		if(_tax) then {
			_taxed = round (_price - _oldPrice);
			if(_taxed < 1) exitWith {};
			systemChat format["A tax of %1 was taken by the owners of %2",_taxed,(_toSelect select 0)];
			life_tax = life_tax + _taxed;
			if(life_tax == _taxed) then {
				[_toSelect select 0] spawn {
					waitUntil{!dialog};
					[[5,nil,(_this select 0),life_tax],"TON_fnc_updateGang",(false),false] spawn life_fnc_MP;
					life_tax = 0;
				};
			};
		};
		[_item,true/*,false,false,false,false,false,true*/] spawn life_fnc_handleItem;
	};
};