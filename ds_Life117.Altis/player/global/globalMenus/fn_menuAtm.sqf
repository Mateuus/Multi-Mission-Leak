/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens and updates the players ATM menu 
*/


private["_dialog","_balance","_title","_withdraw","_deposit","_transfer","_insurance","_exit","_type","_players"];

closeDialog 0;
createDialog "atmMenu";

disableSerialization;

_dialog = findDisplay 666;
_balance = _dialog displayCtrl 1001;
_title = _dialog displayCtrl 1000;
_withdraw = _dialog displayCtrl 2401;
_deposit = _dialog displayCtrl 2400; 
_transfer = _dialog displayCtrl 2402; 
_insurance = _dialog displayCtrl 2403; 
_exit = _dialog displayCtrl 2404;
_players = _dialog displayCtrl 2100;

_type = "";
lbClear _players;
if(playerside == west)then
	{
	_players lbAdd "Police Bank Account";
	_players lbSetData [(lbSize _players)-1,str(_players)];
	};
{
	if(alive _x) then
	{
		_type = "";
		if(side _x == west)then
			{
			_type = "(Officer)";
			};
		_players lbAdd format["%1%2",_type,(name _x)];
		_players lbSetData [(lbSize _players)-1,str(_x)];
	};
} foreach playableUnits;
_balance ctrlSetStructuredText parseText format["<img size='1.7' image='extras\icons\bank.paa'/> <t size='0.8'>$%1</t><br/><img size='1.6' image='extras\icons\money.paa'/> <t size='0.8'>$%2</t>",[DS_atmcoin] call DS_fnc_numberText,[DS_coin] call DS_fnc_numberText];

_withdraw ctrlSetText "Withdraw";
_withdraw buttonSetAction "[] spawn DS_fnc_withdraw;";

_deposit ctrlSetText "  Deposit";
_deposit buttonSetAction "[] spawn DS_fnc_deposit;";

_transfer ctrlSetText "     Transfer";
_transfer buttonSetAction "[] spawn DS_fnc_transfer;";

_insurance ctrlSetText "Insurance";
_insurance buttonSetAction "[] spawn DS_fnc_insurance;";

_exit ctrlSetText "   Exit";
_exit buttonSetAction "closeDialog 0;";







