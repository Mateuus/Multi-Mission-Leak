/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Transfers money
*/

private ["_value","_receiver","_atClanBase","_action"];

_value = parseNumber(ctrlText 1400);
_receiver = lbData [2100,lbCurSel 2100];
_receiver = missionNamespace getVariable _receiver;
_action = true;

closeDialog 0;

if(_value > 999999)exitWith{hint "You can not transfer a value greater than $999,999";[] spawn DS_fnc_menuAtm;};
if(_value < 1)exitWith{hint "You can not transfer a value lower than $1";[] spawn DS_fnc_menuAtm;};
if(_value > DS_atmCoin)exitWith{hint "You do not have enough money in your account to complete this transaction";[] spawn DS_fnc_menuAtm;};

_atClanBase = [] call DS_fnc_sellGangGoods;
if((playerSide isEqualTo civilian)&&(_atClanBase)&&((lbText [2100,lbCurSel 2100]) isEqualTo "Donate to Clan Account"))exitWith {
	[_value,true,false] call DS_fnc_handleMoney;
	[player,true,_value,"added money",false] remoteExec ["HUNT_fnc_gangMoney",2];
	hint format ["$%1 has been added to the local clans base",[_value] call DS_fnc_numberText];
	[] call DS_fnc_compileData;
};

if((playerSide isEqualTo west)&&((lbText [2100,lbCurSel 2100]) isEqualTo "Police Bank Account")) exitWith {
	_value spawn {
		[_this,true,false] call DS_fnc_handleMoney;
		[_this,true] remoteExec ["HUNT_fnc_policeBank",2];
		sleep 3;
		[0,format ["%1 has deposited $%2 into the police bank. The police bank now has $%3 in it.",(name player),[_this] call DS_fnc_numberText,[DS_policeBank] call DS_fnc_numberText]] remoteExecCall ["DS_fnc_globalMessage",west];
	};
};

if((lbCurSel 2100) isEqualTo -1)exitWith{hint "Nobody was selected"};
if((isNil "_receiver")||(isNull _receiver))exitWith{hint "Player doesn't exist"};
if(!(isPlayer _receiver))exitWith{hint "Some error occurred, has the player logged out?"};

if((side _receiver) isEqualTo west)then {
	_action = [
		"You are about to send a police officer money, are you sure you want to?",
		"Send Police Money?",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
};
if(!_action)exitWith{};

[_value,true,false] call DS_fnc_handleMoney;
[_value,profileName,(name _receiver)] remoteExecCall ["DS_fnc_bankReceive",_receiver];

hint format ["You transferred $%1 into the bank account belonging to %2",[_value] call DS_fnc_numberText,(name _receiver)];
[] spawn DS_fnc_menuAtm;
[] call DS_fnc_compileData;