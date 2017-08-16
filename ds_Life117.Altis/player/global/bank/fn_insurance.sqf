/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Buys banking insurance
*/

private ["_balance","_cost","_action"];

if(DS_bankInsurance) exitwith {hint "You already have banking insurance"};
_balance = DS_atmcoin;
_cost = 250;

if(_balance > 40000000)then{_cost = 60000}else{
if(_balance > 25000000)then{_cost = 50000}else{
if(_balance > 15000000)then{_cost = 40000}else{
if(_balance > 7500000)then{_cost = 30000}else{
if(_balance > 5000000)then{_cost = 20000}else{
if(_balance > 2500000)then{_cost = 10000}else{
_cost = 500};};};};};};

_action = true;
_action = [
	format ["With your bank balance banking insurance will cost you $%1",[_cost] call DS_fnc_numberText],
	"Price",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if([_cost,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough funds in your bank to cover this cost"};
[_cost,true,false] call DS_fnc_handleMoney;
DS_bankInsurance = true;
hint "You have bought banking insurance";
systemchat "You have bought banking insurance";
closeDialog 0;
sleep 0.5;
[] spawn DS_fnc_menuAtm;
if(DS_infoArray select 13 == 6)then
	{
	[0] call DS_fnc_questCompleted;
	};