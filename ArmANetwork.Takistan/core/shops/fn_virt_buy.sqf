#include <macro.h>

/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/

if(EAL_sellSpamTries >= 3) then {  [[profileName,format["DANGEROUS AUTO CLICK FILE ACCESS IN::->fn_virt_sell.sqf. --- Number Of Times Accessed While On a Half Second Cool Down: %1",EAL_sellSpamTries]],"SPY_fnc_tellAdmins",true,false] call life_fnc_MP; };

if(!EAL_canSell) exitWith {EAL_sellSpamTries = EAL_sellSpamTries +1; hint "You are trying to sell items more than once per half second!"; closeDialog 0;};
if(EAL_canSell) then {
    EAL_canSell = false;
    [] spawn { sleep 0.4; EAL_canSell = true; EAL_sellSpamTries = 0;};
};

private["_type","_price","_amount","_diff","_name","_hideout"];
if((lbCurSel 2401) == -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > CASH && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gangBank"}} && {(grpPlayer getVariable "gangBank") <= _price * _amount}}) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};

_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gangBank"}} && {(grpPlayer getVariable "gangBank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gangBank")] call life_fnc_numberText,
				[CASH] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format[localize "STR_Shop_Virt_BoughtGang",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gangBank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gangBank",_funds,true];
			[1,grpPlayer] remoteExecCall ["life_fnc_gangUpdate",2];

		} else {
			if((_price * _amount) > CASH) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
			hint format[localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
			SUB(CASH,_price * _amount);
		};
	} else {
		if((_price * _amount) > CASH) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; [false,_type,_amount] call life_fnc_handleInv;};
		hint format[localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
		SUB(CASH,(_price * _amount));
	};
	[] call life_fnc_virt_update;
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;
