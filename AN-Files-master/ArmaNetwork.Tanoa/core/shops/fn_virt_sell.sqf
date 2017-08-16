#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sell a virtual item to the store / shop
*/

if (!EAL_canSell) exitWith {EAL_sellSpamTries = EAL_sellSpamTries + 1; hintSilent "You are trying to sell items more than once per half second!"; closeDialog 0;};
if (EAL_canSell) then {
    EAL_canSell = false;
    [] spawn { sleep 0.4; EAL_canSell = true; EAL_sellSpamTries = 0;};
};

private["_type","_index","_price","_amount","_name"];
if (EQUAL(lbCurSel 2402,-1)) exitWith {};
private _type = lbData [2402,(lbCurSel 2402)];
private _price = 0.0;
private _itemNameToSearchFor = _type;

{
	private _curItemName = _x select 0;
	private _curItemPrice = _x select 1;
	if (_curItemName isEqualTo _itemNameToSearchFor) then {_price = _curItemPrice};
} forEach DYNMARKET_prices;

if(_price isEqualTo -1) exitWith {};

private _amount = ctrlText 2405;
if(!([_amount] call life_fnc_spunetuwada)) exitWith {hintSilent localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
_price = (_price * _amount);
private _name = getText (missionConfigFile >> "VirtualItems" >> _type >> "displayName");

if ([_type,_amount] call life_fnc_virtualItemRemove) then 
{
	[3] call life_fnc_maphuwres;
	hintSilent format[localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call life_fnc_rupadudejat];
	[_price,0,0] call life_fnc_sewawruk;
	call life_fnc_virt_update;
	DYNAMICMARKET_boughtItems pushBack [_type,_amount];

	if(life_shop_type isEqualTo "drugdealer") then 
	{
		private _array = life_shop_npc getVariable["sellers",[]];
		if (count _array isEqualTo 0) then 
		{
			_array pushBack [getPlayerUID player,profileName,_price];
			life_shop_npc setVariable["sellers",_array,true];
		} 
		else 
		{
			private _ind = [getPlayerUID player,_array] call life_fnc_uiudhfyqwtfkdsf;
			if !(_ind isEqualTo -1) then 
			{
				private _val = ((_array select _ind) select 2);
				_val = _val + _price;
				_array set[_ind,[getPlayerUID player,profileName,_val]];
				life_shop_npc setVariable["sellers",_array,true];
			} 
			else 
			{
				_array pushBack [getPlayerUID player,profileName,_price];
				life_shop_npc setVariable["sellers",_array,true];
			};
		};
	};
}
else
{
	hintSilent "You probably don't have enough of the item to sell!";
};
