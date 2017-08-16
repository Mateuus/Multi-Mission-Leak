/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	If there are no money bags left in the bank, money is taken from each online player
*/
private ["_atmcash","_amountToRemove"];

_amountToRemove = 0;
_atmcash = DS_atmCoin;

if(_atmcash < 1000000) then {_amountToRemove = _atmcash/25;};
if((_atmcash > 999999)&&(_atmcash < 3000000)) then {_amountToRemove = _atmcash/30;};
if((_atmcash > 2999999)&&(_atmcash < 6000000)) then {_amountToRemove = _atmcash/40;};
if((_atmcash > 5999999)&&(_atmcash < 10000000)) then {_amountToRemove = _atmcash/50;};
if((_atmcash > 9999999)&&(_atmcash < 20000000)) then {_amountToRemove = _atmcash/60;};
if(_atmcash > 19999999) then {_amountToRemove = 400000;};

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
	
if(DS_atmcoin < 0) then {DS_atmcoin = 0};
[] call DS_fnc_compileData;