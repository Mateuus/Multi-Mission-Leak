#include <macro.h>
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private["_price","_item","_itemInfo","_bad"];
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {};
life_nottoofast = time;

if((lbCurSel 38403) == -1) exitWith {["Oh nein!",localize "STR_Shop_Weapon_NoSelect","#ff1000","#ffffff",4] call life_fnc_texttiles;};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
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

if(_bad != "") exitWith {["Oh nein!",_bad,"#ff1000","#ffffff",4] call life_fnc_texttiles;};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	life_beatgeld = life_beatgeld + _price;
	[_item,false] call life_fnc_handleItem;
	["Yeah!",format["Du hast eine(n) %1 für %2€ verkauft.",_itemInfo select 1,[_price] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;

	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.
}
	else
{
	private["_hideout"];
	_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>%1€</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>%2€</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[life_beatgeld] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			["Yeah!",format["Du hast %1 für %2€ mit dem Geld der Gang gekauft.",_itemInfo select 1,[_price] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - _price;
			grpPlayer setVariable["gang_bank",_funds,true];
			[_item,true] spawn life_fnc_handleItem;
			[1,grpPlayer] remoteExecCall ["SOA_fnc_updateGang",2];
		} else {
			if(_price > life_beatgeld) exitWith {["Oh nein!",format["Dir fehlen %1€ um %2 kaufen zu können!",[(_price - life_beatgeld)] call life_fnc_numberText,(_itemInfo select 1)],"#ff1000","#ffffff",4] call life_fnc_texttiles;};
			["Yeah!",format["Du hast eine(n) %1 für %2€ gekauft.",_itemInfo select 1,[_price] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;
			__SUB__(life_beatgeld,_price);
			[_item,true] spawn life_fnc_handleItem;
		};
	} else {
		if(_price > life_beatgeld) exitWith {["Oh nein!",format["Dir fehlen %1€ um %2 kaufen zu können!",[(_price - life_beatgeld)] call life_fnc_numberText,(_itemInfo select 1)],"#ff1000","#ffffff",4] call life_fnc_texttiles;};
		["Yeah!",format["Du hast eine(n) %1 für %2€ gekauft.",_itemInfo select 1,[_price] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;
		life_beatgeld = life_beatgeld - _price;
		[_item,true] spawn life_fnc_handleItem;
	};
};
[] call life_fnc_saveGear;
