/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {life_spyglassamount = life_spyglassamount +1;[[profileName,format["Geldglitch beim Markt einkauf, Anzahl: %1",life_spyglassamount]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;};
life_nottoofast = time;
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,sell_array] call TON_fnc_index;
if(_index == -1) exitWith {};
_index2 = [_type,DYNMARKET_prices] call TON_fnc_index;
_price = 0.0;
if(_index2==-1) then {_price = (sell_array select _index) select 1;} else {_price = (DYNMARKET_prices select _index2) select 1;};
_var = [_type,0] call life_fnc_varHandle;

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

//LEvel 10% mehr Erlös
if(life_erfahrung <=3424) then{_price = (_price * _amount);};
if((life_erfahrung >=3425) AND (life_erfahrung <=10599)) then {_price = ((_price * _amount)* 1.10);};
if(life_erfahrung >=10600) then {_price = ((_price * _amount)* 1.25);};
//
_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call life_fnc_numberText];
	life_cash = life_cash + _price;
	DYNAMICMARKET_boughtItems pushBack [_type,_amount];
	[] call life_fnc_virt_update;
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};
sendlogfile = [format ["###### %1 verkauft %2x %3 für %4$",name player,_amount,_name,_price],"shop"];
publicVariableServer "sendlogfile";
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;