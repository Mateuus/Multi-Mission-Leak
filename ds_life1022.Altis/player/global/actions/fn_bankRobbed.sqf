/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	If there are no money bags left in the bank, money is taken from each online player
*/

private ["_atmCash","_amountToRemove"];

_amountToRemove = 0;
_atmCash = DS_atmCoin;

if(isNil "DS_punishMe")exitwith{};
if(!DS_punishMe)exitwith{};

if(_atmCash < 1000000) then {_amountToRemove = _atmCash/25;};
if((_atmCash > 999999)&&(_atmCash < 3000000)) then {_amountToRemove = _atmCash/30;};
if((_atmCash > 2999999)&&(_atmCash < 6000000)) then {_amountToRemove = _atmCash/40;};
if((_atmCash > 5999999)&&(_atmCash < 10000000)) then {_amountToRemove = _atmCash/50;};
if((_atmCash > 9999999)&&(_atmCash < 20000000)) then {_amountToRemove = _atmCash/60;};
if(_atmCash > 19999999) then {_amountToRemove = 400000;};


_randomUp = (round random (_amountToRemove/10));
_amountToRemove = _amountToRemove + _randomUp;

if(!([2] call DS_fnc_countPlayers))exitWith{};

if(DS_bankInsurance)then
	{
	hint "The recent robbery on the Altis National Bank has hit civilians where it hurts the most but thankfully you have banking insurance so you didn't lose a penny!\n\nHowever you have lost your banking insurance! Be sure to visit a ATM to renew your plan!";
	systemchat "The recent robbery on the Altis National Bank has hit civilians where it hurts the most but thankfully you have banking insurance so you didn't lose a penny! However you have lost your banking insurance! Be sure to visit a ATM to renew your plan!";
	DS_bankInsurance = false;
	}
	else
	{
	hint format["Due to the recent robbery on the Altis National Bank you have lost $%1 from your bank account, next time buy some banking insurance!\n\nYou can buy banking insurance from a ATM!",[_amountToRemove] call DS_fnc_numberText];
	systemchat format["Due to the recent robbery on the Altis National Bank you have lost $%1 from your bank account, next time buy some banking insurance!  You can buy banking insurance from a ATM!",[_amountToRemove] call DS_fnc_numberText];
	[_amountToRemove,true,false] call DS_fnc_handleMoney;
	player say3D "fail";
	};

if(DS_atmCoin < 0) then {DS_atmCoin = 0};
[] call DS_fnc_compileData;