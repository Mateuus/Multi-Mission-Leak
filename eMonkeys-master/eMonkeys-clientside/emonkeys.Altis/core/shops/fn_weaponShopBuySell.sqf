/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) == -1) exitWith {hint "Du musst einen Gegenstand zum verkaufen auswählen"};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call EMonkeys_fnc_fetchCfgDetails;

_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = "Du hast nicht genug Platz im Inventar!"};
	};
};

if(_bad != "") exitWith {hint _bad};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	if(uiNamespace getVariable "Weapon_Shop" == "AaMstore") then
	{
		_text = format ["*** I-Item verkaufen | SpielerID: %1 | Name: %2 | Item: %3 |",getPlayerUID player,name player,_itemInfo select 1];
		[[1,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
	};
	EMonkeys_c164 = EMonkeys_c164 + _price;
	[_item,false] call EMonkeys_fnc_handleItem;
	hint parseText format["Sie haben %1 für <t color='#8cff9b'>%2€</t> verkauft",_itemInfo select 1,[_price] call EMonkeys_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call EMonkeys_fnc_weaponShopFilter; //Update the menu.
}
	else
{
	if(uiNamespace getVariable "Weapon_Shop" == "AaMstore") then
	{
		_text = format["<<<<BUY WEAPON Special>>>>|%1||%2|>>hat %3 gekauft",getPlayerUID player,name player,_itemInfo select 1];
		[[6,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
	};
	if(_price > EMonkeys_c164) exitWith {hint "Sie haben nicht genug Geld!"};
	[_item,true] spawn EMonkeys_fnc_handleItem;
	hint parseText format["%1 für <t color='#8cff9b'>%2€ gekauft</t>",_itemInfo select 1,[_price] call EMonkeys_fnc_numberText];
	EMonkeys_c164 = EMonkeys_c164 - _price;
};

//Hotfix in for cop gear
if(playerSide == west) then
{
	[] call EMonkeys_fnc_saveGear;
};
