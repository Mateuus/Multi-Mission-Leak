#include <macro.h>
/*
	File: fn_weaponShopBuySell.sqf
	
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;

private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) isEqualTo -1) exitWith {[localize "STR_Shop_Weapon_NoSelect", false] spawn domsg;};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;
_curTarget = cursorTarget;
_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = (localize "STR_NOTF_NoRoom")};
	};
};

if(_bad != "") exitWith {[_bad, false] spawn domsg;};

if(buying_phys_item) exitwith {};
buying_phys_item = true;


if((uiNamespace getVariable["Weapon_Shop_Filter",0]) isEqualTo 1) then
{
	["cash","add",round(_price)] call life_fnc_handleCash; 
	[_item,false] call life_fnc_handleItem;
	[parseText format[localize "STR_Shop_Weapon_Sold",_itemInfo select 1,[_price] call life_fnc_numberText], false] spawn doquickmsg;
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.
}
	else
{
	private["_hideout"];
	_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[cash_in_hand] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			[parseText format[localize "STR_Shop_Weapon_BoughtGang",_itemInfo select 1,[_price] call life_fnc_numberText], false] spawn doquickmsg;
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - _price;
			grpPlayer setVariable["gang_bank",_funds,true];
			[_item,true] spawn life_fnc_handleItem;
			[1,grpPlayer] remoteExecCall ["TON_fnc_updateGang",(call life_fnc_HCC)];
		} else {
			if(_price > cash_in_hand) exitWith {[localize "STR_NOTF_NotEnoughMoney", false] spawn domsg; buying_phys_item = false;};
			[parseText format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText], false] spawn doquickmsg;
			["cash","take",_price] call life_fnc_handleCash;
			[_item,true] spawn life_fnc_handleItem;
		};
	} else {
		if(_price > cash_in_hand) exitWith {[localize "STR_NOTF_NotEnoughMoney", false] spawn domsg; buying_phys_item = false;};
		[parseText format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText], false] spawn doquickmsg;


			if(karma_level > 0) then {
				_mydiscount = karma_level / 100;
				_discount = 1 - _mydiscount;
				_price = _price * _discount;
				_discountper = _mydiscount * 100;
				[format["Otrzymales %%1 znizki dzieki Twojej reputacji!",_discountper], false] spawn doquickmsg;
			};

			if (typeOf _curTarget IN ["critgamin_vangmcc_clothing","critgamin_vangmcc_fedex","critgamin_vangmcc_food","critgamin_vangmcc_general"] && count crew _curTarget != 0) then {
				mobile_payment = _price * 0.7;
				_unit = (driver _curTarget);
			 	_price = _price * 0.8;
			 	["You have received a 20% discount due to buying on the run.", false] spawn doquickmsg;
			 	sleep 1;
			 	mobile_payment remoteExec ["fnc_totalmobile",_unit];
			};


			["cash","take",_price] call life_fnc_handleCash; 	

		[_item,true] spawn life_fnc_handleItem;
	};
};
buying_phys_item = false;
_sweapons2 = ["cg_machete","cg_hatchet","CG_PICKAXE","cg_scythe"];
_mweapons = ["CG_BAT","CG_BATON","CG_CROSS","CG_TELBAT","CG_SHOVEL"];
if(_item in _mweapons) then { player addMagazine "nonlethal_swing"};
if(_item in _sweapons2) then { player addMagazine "sharp_swing"};
[] call life_fnc_saveGear;