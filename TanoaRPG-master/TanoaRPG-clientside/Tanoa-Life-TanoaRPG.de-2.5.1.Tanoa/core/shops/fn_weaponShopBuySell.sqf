#include <macro.h>
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) == -1) exitWith {hint "You need to select an item to buy/sell."};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call tanoarpg_fnc_fetchCfgDetails;

_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = "You don't have enough room for that item."};
	};
};

if(_bad != "") exitWith {hint _bad};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	life_cash = life_cash + _price;
	[_item,false] call tanoarpg_fnc_handleItem;
	hint parseText format["You sold a %1 for <t color='#8cff9b'>$%2</t>",_itemInfo select 1,[_price] call tanoarpg_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call tanoarpg_fnc_weaponShopFilter; //Update the menu.
}
	else
{
	private["_hideout"];
	_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F","Land_JunkPile_F"],25]) select 0;
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format["The gang has enough funds to pay for this, would you like to pay with the gangs funds or your own?<br/><br/>Gang Funds: <t color='#8cff9b'>$%1</t><br/>Your Cash: <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call tanoarpg_fnc_numberText,
				[life_cash] call tanoarpg_fnc_numberText
			],
			"Pay with cash or gang funds",
			"Gang Funds",
			"My Cash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint parseText format["You bought a %1 for <t color='#8cff9b'>$%2</t> with the gangs funds.",_itemInfo select 1,[_price] call tanoarpg_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - _price;
			grpPlayer setVariable["gang_bank",_funds,true];
			[_item,true] spawn tanoarpg_fnc_handleItem;
			[1,grpPlayer] remoteExec ["TEX_fnc_updateGang", 2, false];
		} else {
			if(_price > life_cash) exitWith {hint "You do not have enough money!"};
			hint parseText format["You bought a %1 for <t color='#8cff9b'>$%2</t>",_itemInfo select 1,[_price] call tanoarpg_fnc_numberText];
			__SUB__(life_cash,_price);
			[_item,true] spawn tanoarpg_fnc_handleItem;
		};
	} else {
		if(_price > life_cash) exitWith {hint "You do not have enough money!"};
		hint parseText format["You bought a %1 for <t color='#8cff9b'>$%2</t>",_itemInfo select 1,[_price] call tanoarpg_fnc_numberText];
		life_cash = life_cash - _price;
		[_item,true] spawn tanoarpg_fnc_handleItem;
	};
};

[] call tanoarpg_fnc_saveGear;
[player, player, _price, "WEAPON/ITEM/BOUGHT", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];