/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Transfers money 
*/

private ["_value","_fail","_receiver","_action"];

_value = parseNumber(ctrlText 1400);
closeDialog 0;
//Checks because humans do stupid things
_receiver = lbData [2100,lbCurSel 2100];
_receiver = call compile format["%1",_receiver];
_fail = false;
_action = true;

if(_value > 999999) then {hint "You can not transfer a value greater than $999,999";_fail = true};
if(_value < 1) then {hint "You can not transfer a value lower than $1";_fail = true};
if(_value > DS_atmcoin) then {hint "You do not have enough money in your account to complete this transaction";_fail = true};
if(_fail)exitwith{[] spawn DS_fnc_menuAtm;};


if((playerside == west)&&((lbCurSel 2100) == 0)) exitWith 
	{
	_value spawn
		{
		[_this,true,false] call DS_fnc_handleMoney;
		[[_this,true],"HUNT_fnc_policeBank",false,false] spawn DS_fnc_MP;
		sleep 3;
		[[0,format["%1 has deposited $%2 into the police bank. The police bank now has $%3 in it.",(name player),[_this] call DS_fnc_numberText,[DS_policeBank] call DS_fnc_numberText]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		};
	};
	
if(isNull _receiver)exitwith{};
if((lbCurSel 2100) == -1) exitWith {hint "Nobody was selected"};
if(isNil "_receiver") exitWith {hint "Player doesn't exist"};

if((side _receiver) == west)then
	{
		_action = [
			"You are about to send a police officer money, are you sure you want to?",
			"Send Police Money?",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
	};
if(!_action)exitwith{};

[_value,true,false] call DS_fnc_handleMoney;
[[_value,profileName,(name _receiver)],"DS_fnc_bankReceive",_receiver,false] spawn BIS_fnc_MP;

hint format ["You transferred $%1 into the bank account belonging to %2",[_value] call DS_fnc_numberText,(name _receiver)];
[] spawn DS_fnc_menuAtm;
[] call DS_fnc_compileData;

