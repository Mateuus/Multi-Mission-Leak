#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_points","_amount","_diff","_name","_hideout","_marketprice"];
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {};
life_nottoofast = time;
if((lbCurSel 2445) == -1) exitWith {["Oh nein!",localize "STR_Shop_Virt_Nothing","#ff1000","#ffffff",4] call life_fnc_texttiles;};
_type = lbData[2445,(lbCurSel 2445)];
_points = lbValue[2445,(lbCurSel 2445)];
_amount = ctrlText 2446;

if(!([_amount] call SOA_fnc_isnumber)) exitWith {["Oh nein!",localize "STR_Shop_Virt_NoNum","#ff1000","#ffffff",4] call life_fnc_texttiles;};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_amount > 50) exitWith {["Oh nein!","Du kannst nicht mehr als 50 Stapel kaufen!","#ff1000","#ffffff",4] call life_fnc_texttiles;};
if(_diff <= 0) exitWith {["Oh nein!",localize "STR_NOTF_NoSpace","#ff1000","#ffffff",4] call life_fnc_texttiles;};
_amount = _diff;
_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;
if((_points * _amount) > life_serverpoints) exitWith {titleText [format["Dir fehlen %3 Punkte um %1x %2 kaufen zu können!",_amount,_name,[(_points * _amount)] call life_fnc_numberText],"PLAIN DOWN"]};

[true,_type,_amount] call life_fnc_handleinv;
["Yeah!",format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_points * _amount)] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;
life_serverpoints = life_serverpoints - (_points * _amount);
[] call life_fnc_virtVIP_update;

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;