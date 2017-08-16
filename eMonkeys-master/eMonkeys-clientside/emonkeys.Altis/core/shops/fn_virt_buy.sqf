/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name"];
if((lbCurSel 2401) == -1) exitWith {hint "Sie haben keinen Artikel ausgewählt."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;

////Marktsystem Anfang////
_marketprice = [_type] call EMonkeys_fnc_marketGetPrice;
if(_marketprice != -1) then
{
	_price = _marketprice + 2000;
};
////Marktsystem Ende////

if(!([_amount] call fnc_isnumber)) exitWith {hint "Sie haben eine ungültige Zahl eingeben";};
_diff = [_type,parseNumber(_amount),EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "Sie haben nicht genug Platz!"};
_amount = _diff;
_name = [([_type,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;

if(EMonkeys_shop_type == "AaM") exitWith
{
	if(([true,_type,_amount] call EMonkeys_fnc_handleInv)) then
	{
		hint format["Du hast %1 %2 gekauft",_amount,_name];
		_text = format ["*** Z-Item kaufen | SpielerID: %1 | Name: %2 | Item: %3 | Anzahl: %4 |",getPlayerUID player,name player,_name,_amount];
		[[2,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
	};
};

if((_price * _amount) > EMonkeys_c164) exitWith {hint "Sie haben nicht so viel Geld!"};

if(([true,_type,_amount] call EMonkeys_fnc_handleInv)) then
{
	hint format["Du hast %1 %2 für %3€ gekauft",_amount,_name,[(_price * _amount)] call EMonkeys_fnc_numberText];
	EMonkeys_c164 = EMonkeys_c164 - (_price * _amount);
	[] call EMonkeys_fnc_virt_update;
		_marketprice = [_type] call EMonkeys_fnc_marketGetPrice;
if(_marketprice != -1) then
{

	[[_type,-_amount],"EMonkeys_fnc_updateEconomy",false,false] call EMonkeys_fnc_mp;
};
};