#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) == -1) exitWith {hint  "Du musst einen Gegenstand auswählen, um ihn zu kaufen / zu verkaufen."};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;

_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then {
	if((_itemInfo select 4) in [4096,131072]) then {
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = ( "Du hast nicht genug Platz für den Gegenstand.")};
	};
};

if(_bad != "") exitWith {hint _bad};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then {
	ADD(CASH,_price);
	[_item,false] call life_fnc_handleItem;
	hint parseText format[ "Du hast eine %1 für <t color='#8cff9b'>$%2</t> verkauft",_itemInfo select 1,[_price] call life_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.
} else {
	private["_hideout"];
	_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[( "Die Gang hat genügend Geld, um dafür zu zahlen. Willst du mit dem Geld der Gang oder deinem eigenen bezahlen?")+ "<br/><br/>" +( "Geld der Gang:")+ " <t color='#8cff9b'>$%1</t><br/>" +( "Bargeld:")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[CASH] call life_fnc_numberText
			],
			 "Mit Bargeld oder Geld der Gang bezahlen",
			 "Geld der Gang",
			 "Bargeld"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint parseText format[ "Du hast eine %1 für <t color='#8cff9b'>$%2</t> mit dem Geld der Gang gekauft.",_itemInfo select 1,[_price] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - _price;
			grpPlayer setVariable["gang_bank",_funds,true];
			[_item,true] spawn life_fnc_handleItem;
			
			if(life_HC_isActive) then {
				[1,grpPlayer] remoteExecCall ["HC_fnc_updateGang",HC_Life];
			} else {
				[1,grpPlayer] remoteExecCall ["TON_fnc_updateGang",RSERV];
			};

			
		} else {
			if(_price > CASH) exitWith {hint  "Du hast nicht so viel Geld!"};
			hint parseText format[ "Du hast eine %1 für <t color='#8cff9b'>$%2</t> gekauft",_itemInfo select 1,[_price] call life_fnc_numberText];
			SUB(CASH,_price);
			[_item,true] spawn life_fnc_handleItem;
		};
	} else {
		if(_price > CASH) exitWith {hint  "Du hast nicht so viel Geld!"};
		hint parseText format[ "Du hast eine %1 für <t color='#8cff9b'>$%2</t> gekauft",_itemInfo select 1,[_price] call life_fnc_numberText];
		CASH = CASH - _price;
		[_item,true] spawn life_fnc_handleItem;
	};
};
[] call life_fnc_saveGear;