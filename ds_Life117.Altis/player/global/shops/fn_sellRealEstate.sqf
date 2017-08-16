/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sells all real estate
*/
disableSerialization;

private ["_action","_sellPrice"];
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
_sellPrice = 0;
	if (DS_realEstateArray select 29 > 0)then
	{
	_sellPrice = _sellPrice + ((DS_realEstateArray select 29)*300000);
	};
	if (DS_realEstateArray select 30 > 0)then
	{
	_sellPrice = _sellPrice + ((DS_realEstateArray select 30)*500000);
	};
	if (DS_realEstateArray select 31 > 0)then
	{
	_sellPrice = _sellPrice + ((DS_realEstateArray select 31)*700000);
	};
	if (DS_realEstateArray select 32 > 0)then
	{
	_sellPrice = _sellPrice + ((DS_realEstateArray select 32)*1500000);
	};
	if (DS_realEstateArray select 33 > 0)then
	{
	_sellPrice = _sellPrice + ((DS_realEstateArray select 33)*2000000);
	};
	if (DS_realEstateArray select 34 > 0)then
	{
	_sellPrice = _sellPrice + ((DS_realEstateArray select 34)*2500000);
	};
	if (DS_realEstateArray select 35 > 0)then
	{
	_sellPrice = _sellPrice + ((DS_realEstateArray select 35)*4000000);
	};
	if (DS_realEstateArray select 36 > 0)then
	{
	_sellPrice = _sellPrice + ((DS_realEstateArray select 36)*5500000);
	};
	if (DS_realEstateArray select 37 > 0)then
	{
	_sellPrice = _sellPrice + ((DS_realEstateArray select 37)*7000000);
	};
	
if(_sellPrice == 0)exitwith{Hint "You own no properties";DS_doingStuff = false;};
_sellPrice = (_sellPrice*0.9);

_action = [
	format ["Currently you may sell all of your Real Estate for $%1, do you wish to continue with this?",[_sellPrice] call DS_fnc_numberText],
	"Sell Real Estate",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action)then
	{
	hint format ["Properties Sold, a Total of $%1 has been deposited into your bank account",[_sellPrice] call DS_fnc_numberText];
	[_sellPrice,true,true] call DS_fnc_handleMoney;
	DS_realEstateArray set [29,0];DS_realEstateArray set [32,0];DS_realEstateArray set [35,0];
	DS_realEstateArray set [30,0];DS_realEstateArray set [33,0];DS_realEstateArray set [36,0];
	DS_realEstateArray set [31,0];DS_realEstateArray set [34,0];DS_realEstateArray set [37,0];
	[] call DS_fnc_compileData;
	}
	else
	{
	hint "Transaction cancelled";
	};
DS_doingStuff = false;

