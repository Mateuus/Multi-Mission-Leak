#include <macro.h>
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
if((life_nottoofast != 0) && ((time - life_nottoofast) < 2)) exitWith {hint "TU T'ES PRIS POUR FLASH !!! Merci de ralentir un peu...";};
life_nottoofast = time;
_type = lbData[2402,(lbCurSel 2402)];
_price = 0.0;
_itemNameToSearchFor = _type;
{
	_curItemName = _x select 0;
	_curItemPrice = _x select 1;
	if (_curItemName==_itemNameToSearchFor) then {_price=_curItemPrice};
} forEach DYNMARKET_prices;

if(EQUAL(_price,-1)) exitWith {};

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Vous n'avez pas saisi un nombre correct";};
_amount = parseNumber (_amount);
if(_amount > (ITEM_VALUE(_type))) exitWith {hint "Vous n'avez pas assez d'objets à vendre"};

_price = (_price * _amount);
//_name = [_var] call life_fnc_vartostr;
_name = M_CONFIG(getText,"ANL_VItems",_type,"displayName");
if(([false,_type,_amount] call life_fnc_handleInv)) then {
	hint format["Tu as vendu %1 %2 pour %3€",_amount,(localize _name),[_price] call life_fnc_numberText];
	ADD(argent_liquide,_price);
	[] call life_fnc_virt_update;	
	DYNAMICMARKET_boughtItems pushBack [_type,_amount];
};

if(EQUAL(life_shop_type,"heroin")) then {
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(!(EQUAL(_ind,-1))) then {
		_val = SEL(SEL(_array,_ind),2);
		ADD(_val,_price);
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	} else {
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;