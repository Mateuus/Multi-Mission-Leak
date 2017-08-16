/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens and updates the players ATM menu
*/

private ["_dialog","_balance","_title","_withdraw","_deposit","_transfer","_insurance","_exit","_players","_atClanBase","_index","_type"];

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

lbClear _players;

if(playerSide isEqualTo civilian)then {
	_atClanBase = [] call DS_fnc_sellGangGoods;
	if(_atClanBase)then {
		_index = _players lbAdd "Donate to Clan Account";
		_players lbSetData [_index,str(_players)];
	};
};

if(playerSide isEqualTo west)then {
	_index = _players lbAdd "Police Bank Account";
	_players lbSetData [_index,str(_players)];
};

{
	if(alive _x)then {
		_type = if((side _x) isEqualTo west)then{"(Officer)"}else{""};
		_index = _players lbAdd format ["%1%2",_type,(name _x)];
		_players lbSetData [_index,(_x call BIS_fnc_objectVar)];
	};
} forEach allPlayers;

lbSort [_players,"ASC"];

_balance ctrlSetStructuredText parseText format ["<img size='1.7' image='extras\icons\bank.paa'/> <t size='0.8'>$%1</t><br/><img size='1.6' image='extras\icons\money.paa'/> <t size='0.8'>$%2</t>",[DS_atmCoin] call DS_fnc_numberText,[DS_coin] call DS_fnc_numberText];

_withdraw ctrlSetText "Withdraw";
_withdraw buttonSetAction "[] spawn DS_fnc_withdraw;";

_deposit ctrlSetText "Deposit";
_deposit buttonSetAction "[] spawn DS_fnc_deposit;";

_transfer ctrlSetText "Transfer";
_transfer buttonSetAction "[] spawn DS_fnc_transfer;";

_insurance ctrlSetText "Insurance";
_insurance buttonSetAction "[] spawn DS_fnc_insurance;";

_exit ctrlSetText "Exit";
_exit buttonSetAction "closeDialog 0;";