#include "..\script_macros.hpp"
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) == -1) exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call ES_fnc_fetchCfgDetails;

_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then {
	if((_itemInfo select 4) in [4096,131072]) then {
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = (localize "STR_NOTF_NoRoom")};
	};
};

if(_bad != "") exitWith {hint _bad};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then {
	ES_cash = ES_cash + _price;
	[_item,false] call ES_fnc_handleItem;
	["WaffenVerkaufen"] call ES_fnc_xp_add;
	_toLog = format ["Name: %1 (%2) hat Item: %3 für: %4 $ verkauft", player getVariable["realname",name player], getPlayerUID player, _itemInfo select 1, [_price] call ES_fnc_numberText];
	["SHOPSELL_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

	hint parseText format[localize "STR_Shop_Weapon_Sold",_itemInfo select 1,[_price] call ES_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call ES_fnc_weaponShopFilter; //Update the menu.
} else {

	if(ES_xp_lvl < 6  && _item == "B_UavTerminal") exitWith{hint"UavTerminal ist erst ab Level 6 verfügbar.";};
	if(ES_xp_lvl < 7  && _item == "HandGrenade_Stone") exitWith{hint"Flashbang ist erst ab Level 7 verfügbar.";};
	if(ES_xp_lvl < 9  && _item == "DemoCharge_Remote_Mag") exitWith{hint"Sprengstoff ist erst ab Level 9 verfügbar.";};
	if(ES_xp_lvl < 15  && _item == "LMG_Zafir_F") exitWith{hint"Nur erfahrene und verantwortungsvolle Spieler ab Level 15, können diese Waffe kaufen.";};
	if(ES_xp_lvl < 15  && _item == "150Rnd_762x51_Box") exitWith{hint"Nur erfahrene und verantwortungsvolle Spieler ab Level 15, können Zubehör für diese Waffe kaufen.";};
	if(ES_xp_lvl < 16  && _item == "srifle_LRR_F") exitWith{hint"Nur erfahrene und verantwortungsvolle Spieler ab Level 16, können diese Waffe kaufen.";};
	if(ES_xp_lvl < 16  && _item == "7Rnd_408_Mag") exitWith{hint"Nur erfahrene und verantwortungsvolle Spieler ab Level 16, können Zubehör für diese Waffe kaufen.";};
	if(ES_xp_lvl < 18  && _item == "MMG_02_black_F") exitWith{hint"Nur erfahrene und verantwortungsvolle Spieler ab Level 18, können diese Waffe kaufen.";};
	if(ES_xp_lvl < 18  && _item == "130Rnd_338_Mag") exitWith{hint"Nur erfahrene und verantwortungsvolle Spieler ab Level 18, können Zubehör für diese Waffe kaufen.";};
	if(ES_xp_lvl < 20  && _item == "LMG_Mk200_F") exitWith{hint"Nur erfahrene und verantwortungsvolle Spieler ab Level 20, können diese Waffe kaufen.";};
	if(ES_xp_lvl < 20  && _item == "200Rnd_65x39_cased_Box") exitWith{hint"Nur erfahrene und verantwortungsvolle Spieler ab Level 20, können Zubehör für diese Waffe kaufen.";};

	private["_hideout"];
	_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	if(!isNil "_hideout" && {!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(group player getVariable "gang_bank")] call ES_fnc_numberText,
				[ES_cash] call ES_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint parseText format[localize "STR_Shop_Weapon_BoughtGang",_itemInfo select 1,[_price] call ES_fnc_numberText];
			_funds = group player getVariable "gang_bank";
			_funds = _funds - _price;
			group player setVariable["gang_bank",_funds,true];
			[_item,true] spawn ES_fnc_handleItem;
			playSound "buy";
			["WaffenKaufenGangGeld"] call ES_fnc_xp_add;
			[1,group player] remoteExec ["ES_fnc_updateGang",2];
			_toLog = format ["Name: %1 (%2) hat Item: %3 für: %4 $ gekauft", player getVariable["realname",name player], getPlayerUID player, _itemInfo select 1, [_price] call ES_fnc_numberText];
			["SHOP_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		} else {
			if(_price > ES_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
			hint parseText format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call ES_fnc_numberText];
			ES_cash = ES_cash - _price;
			[_item,true] spawn ES_fnc_handleItem;
			playSound "kaufen";
			["WaffenKaufen"] call ES_fnc_xp_add;
			_toLog = format ["Name: %1 (%2) hat Item: %3 für: %4 $ gekauft", player getVariable["realname",name player], getPlayerUID player, _itemInfo select 1, [_price] call ES_fnc_numberText];
			["SHOP_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		};
	} else {
		if(_price > ES_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
		hint parseText format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call ES_fnc_numberText];
		ES_cash = ES_cash - _price;
		[_item,true] spawn ES_fnc_handleItem;
		playSound "kaufen";
		["WaffenKaufen"] call ES_fnc_xp_add;
		_toLog = format ["Name: %1 (%2) hat Item: %3 für: %4 $ gekauft", player getVariable["realname",name player], getPlayerUID player, _itemInfo select 1, [_price] call ES_fnc_numberText];
		["SHOP_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
	};
};
[] call ES_fnc_saveGear;
