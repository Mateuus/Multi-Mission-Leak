#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout","_marketprice"];

if((lbCurSel 2401) == -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;

////Marktsystem Anfang////
_marketprice = [_type] call tanoarpg_fnc_marketGetBuyPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
////Marktsystem Ende////

if(playerSide == independent) then
{
	if(_type == "kidney") then
	{
		_price = 500;
	};
	
	if(_type == "defibrilator") then
	{
		_price = 2000;
	};
};

if(playerSide == west) then
{
	if(_type == "defibrilator") then
	{
		_price = 7000;
	};
};


if(!([_amount] call TEX_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call tanoarpg_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
if(_amount > 10) exitWith {hint "Du kannst nicht mehr als 10 Items gleichzeitig kaufen"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > life_cash && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};

_name = [([_type,0] call tanoarpg_fnc_varHandle)] call tanoarpg_fnc_varToStr;

if(([true,_type,_amount] call tanoarpg_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call tanoarpg_fnc_numberText,
				[life_cash] call tanoarpg_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format[localize "STR_Shop_Virt_BoughtGang",_amount,_name,[(_price * _amount)] call tanoarpg_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[1,grpPlayer] remoteExec ["TEX_fnc_updateGang", 2, false];
		} else {
			if((_price * _amount) > life_cash) exitWith {[false,_type,_amount] call tanoarpg_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
			hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call tanoarpg_fnc_numberText];
			__SUB__(life_cash,_price * _amount);
		};
	} else {
		if((_price * _amount) > life_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; [false,_type,_amount] call tanoarpg_fnc_handleInv;};
		hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call tanoarpg_fnc_numberText];
		__SUB__(life_cash,(_price * _amount));
		
		if(_marketprice != -1) then
		{
			[_type, _amount] spawn
			{
				sleep 240;
				[_this select 0,_this select 1] call tanoarpg_fnc_marketBuy;
			};
		};
		
	};
	[] call tanoarpg_fnc_virt_update;
};
[0] call XAS_fnc_updatePartial;
[3] call XAS_fnc_updatePartial;
[player, player, (_price * _amount), format["VIRTITEMBOUGHT|%1",_type], life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog",2];

//ANTISPAM
closeDialog 0;