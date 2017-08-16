#include "..\..\macros.hpp"
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout","_icon1","_icon"];
if (isNil "DWEV_virtBuyInUse") then {DWEV_virtBuyInUse = false;};
if (DWEV_virtBuyInUse) exitWith {hint "Du kannst nicht so schnell kaufen! Lass dir etwas Zeit oder gib unten die gewünschte Anzahl ein";};
if((lbCurSel 2401) == -1) exitWith {hint "Wähle aus was du kaufen möchtest."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call DWF_fnc_isnumber)) exitWith {hint "Gebe eine Zahl ein.";};
_diff = [_type,parseNumber(_amount),DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "Du hast nicht genug Platz!"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > dwf_cash && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint "Du hast nicht genug Geld!"};
if((_price * _amount) > dwf_cash) exitWith {[false,_type,_amount] call DWEV_fnc_handlelnv; hint "Du hast nicht genug Geld!";};
DWEV_virtBuyInUse = true;

_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
_icon1 = M_CONFIG(getText,"VirtualItems",_type,"icon");
if (!(_icon1 isEqualTo "")) then {_icon = format["<img image='%1'/>",_icon1];};

if(([true,_type,_amount] call DWEV_fnc_handlelnv)) then
{
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
			format["Die Gang hat genug Geld um es zu zahlen, willst du mit der Gang oder deinem eigenen Geld bezahlen?<br/><br/>Gang Geld: <t color='#8cff9b'>%1€</t><br/>Dein Geld: <t color='#8cff9b'>%2€</t>",
				[(grpPlayer getVariable "gang_bank")] call DWEV_fnc_numberText,
				[dwf_cash] call DWEV_fnc_numberText
			],
			"Mit deinem oder Gang Geld bezahlen",
			"Gang Geld",
			"Mein Geld"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			hint parseText format["Du hast %1 %2%3 fuer %4€ vom Gangkonto gekauft.",_amount,_icon,_name,[(_price * _amount)] call DWEV_fnc_numberText];
			[grpPlayer,(_price * _amount)] remoteExec ["DWF_fnc_gangBankWithdraw",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		} 
		else 
		{
			if((_price * _amount) > dwf_cash) exitWith {[false,_type,_amount] call DWEV_fnc_handlelnv; hint "Du hast nicht genug Geld!";};
			hint parseText format["Du hast %1 %2%3 fuer %4€ gekauft.",_amount,_icon,_name,[(_price * _amount)] call DWEV_fnc_numberText];
			__SUB__(dwf_cash,(_price * _amount));
		};
	} 
	else 
	{
		if((_price * _amount) > dwf_cash) exitWith {hint "Du hast nicht genug Geld!"; [false,_type,_amount] call DWEV_fnc_handlelnv;};
		hint parseText format["Du hast %1 %2%3 fuer %4€ gekauft.",_amount,_icon,_name,[(_price * _amount)] call DWEV_fnc_numberText];
		__SUB__(dwf_cash,(_price * _amount));
	};
	[] call DWEV_fnc_virt_update;
};

if (isNil "DWEV_virtBuySaveInProcess") then {DWEV_virtBuySaveInProcess = false;};
if (!DWEV_virtBuySaveInProcess) then
{
	DWEV_virtBuySaveInProcess = true;
	[] spawn
	{
		sleep 5;
		[0] call SOCK_fnc_updatePartial;
		[3] call SOCK_fnc_updatePartial;
		DWEV_virtBuySaveInProcess = false;
	};
};

[] spawn
{
	sleep 2;
	DWEV_virtBuyInUse = false;
};
