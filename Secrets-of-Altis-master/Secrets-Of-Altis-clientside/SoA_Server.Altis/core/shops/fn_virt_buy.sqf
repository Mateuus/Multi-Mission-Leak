#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout","_marketprice"];
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {};
life_nottoofast = time;
if((lbCurSel 2401) == -1) exitWith {titleText [localize "STR_Shop_Virt_Nothing","PLAIN DOWN"]};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;

_marketprice = [_type] call life_fnc_marketGetBuyPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};

if(!([_amount] call SOA_fnc_isnumber)) exitWith {["Oh nein!",localize "STR_Shop_Virt_NoNum","#ff1000","#ffffff",4] call life_fnc_texttiles;};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_amount > 50) exitWith {["Oh nein!","Du kannst nicht mehr als 50 Stapel kaufen!","#ff1000","#ffffff",4] call life_fnc_texttiles;};
if(_diff <= 0) exitWith {titleText [localize "STR_NOTF_NoSpace","PLAIN DOWN"]};
_amount = _diff;
_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;
if((_price * _amount) > life_beatgeld) exitWith {["Oh nein!",format["Dir fehlen %3€ um %1x %2 kaufen zu können!",_amount,_name,[(_price * _amount)] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;};

[true,_type,_amount] call life_fnc_handleinv;
["Yeah!",format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;
life_beatgeld = life_beatgeld - (_price * _amount);
[] call life_fnc_virt_update;

if(_marketprice != -1) then 
{ 
	[_type, _amount] spawn
	{
		sleep 120;
		[_this select 0,_this select 1] call life_fnc_marketBuy;
	};			
};
		
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;