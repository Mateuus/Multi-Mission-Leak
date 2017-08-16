#include "..\..\macros.hpp"
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) == -1) exitWith {hint "Wähle etwas zum kaufen oder verkaufen aus."};
if (isNil "DWEV_virtBuyInUse") then {DWEV_virtBuyInUse = false;};
if (DWEV_virtBuyInUse) exitWith {hint "Du kannst nicht so schnell kaufen!";};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call DWEV_fnc_fetchCfgDetails;

_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = "Du hast nicht genug Platz dafür."};
	};
};

if(_bad != "") exitWith {hint _bad};

DWEV_virtBuyInUse = true;
if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	dwf_cash = dwf_cash + _price;
	[_item,false] call DWEV_fnc_handleItem;
	hint parseText format["Du hast ein %1 für <t color='#8cff9b'>%2€</t> verkauft.",_itemInfo select 1,[_price] call DWEV_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call DWEV_fnc_weaponShopFilter; //Update the menu.
	if (_price >= 100000) then
	{
	[13,player,format ["Verkauf %1 für %2 € - Bargeld. %3 € Bankkonto. %4 €",_item,[_price] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
}
	else
{
	private["_hideout"];
	_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	
	_members = grpPlayer getVariable ["gang_members",[]];
	_ownRank = 0;

	{
		if ((getPlayerUID player) IN _x) exitWith
		{
			_ownRank = (_x select 2);
		};
		false;
	} count _members;
	
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price} && {(_ownRank >= 1)}) then 
	{
		_action = [
			format["Die Gang hat genug Geld dafür, Willst du es mit dem Gang Geld oder deinen Geld kaufen?<br/><br/>Gang Geld: <t color='#8cff9b'>%1€</t><br/>Dein Geld: <t color='#8cff9b'>%2€</t>",
				[(grpPlayer getVariable "gang_bank")] call DWEV_fnc_numberText,
				[dwf_cash] call DWEV_fnc_numberText
			],
			"Mit Gang Geld oder deinem Geld zahlen",
			"Gang Geld",
			"Mein Geld"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			hint parseText format["Du hast ein %1 für <t color='#8cff9b'>%2€</t> mit dem Gang Geld bezahlt.",_itemInfo select 1,[_price] call DWEV_fnc_numberText];
			[grpPlayer,_price] remoteExec ["DWF_fnc_gangBankWithdraw",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
			[_item,true] spawn DWEV_fnc_handleItem;
		} 
		else 
		{
			if(_price > dwf_cash) exitWith {hint "Du hast nicht genug Geld!"};
			hint parseText format["Du hast ein %1 für <t color='#8cff9b'>%2€</t> gekauft.",_itemInfo select 1,[_price] call DWEV_fnc_numberText];
			dwf_cash = dwf_cash - _price;
			[_item,true] spawn DWEV_fnc_handleItem;
		};
	} 
	else 
	{
		if(_price > dwf_cash) exitWith {hint "Du hast nicht genug Geld!"};
		hint parseText format["Du hast ein %1 für <t color='#8cff9b'>%2€</t> gekauft.",_itemInfo select 1,[_price] call DWEV_fnc_numberText];
		dwf_cash = dwf_cash - _price;
		[_item,true] spawn DWEV_fnc_handleItem;
	};
};

if (isNil "DWEV_virtBuySaveInProcess") then {DWEV_virtBuySaveInProcess = false;};
if (!DWEV_virtBuySaveInProcess) then
{
	DWEV_virtBuySaveInProcess = true;
	[] spawn
	{
		sleep 5;
		[0] call SOCK_fnc_updatePartial;
		[player, uniform player] call DWEV_fnc_equipTextures;
		[player, backpack player] call DWEV_fnc_equipTextures;
		DWEV_virtBuySaveInProcess = false;
	};
};

[] spawn
{
	sleep 1;
	DWEV_virtBuyInUse = false;
};
