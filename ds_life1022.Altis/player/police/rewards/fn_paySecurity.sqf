/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Punishes police for stuff
*/

private ["_amount","_cops","_exit"];

_amount = _this select 0;
_exit = false;

if(_this select 1)exitWith
	{
	_action = [
		format ["A security contractor is attempting to charge you $%1 for his services, this money will be paid to them by all officers at a discounted rate",[_amount] call DS_fnc_numberText],
		"Accept Payment Request",
		"Accept",
		"Decline"
		] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true;[0,"Your request for payment was declined"] remoteExecCall ["DS_fnc_globalMessage",(_this select 2)];};
	[_amount,false] remoteExec ["DS_cop_paySecurity",west];
	[_amount,true] remoteExec ["DS_sec_requestPayment",(_this select 2)];
	_exit = true;
	};
if(_exit)exitwith{};

_cops = (playersNumber west);
_amount = (round(_amount/_cops));

if(player getVariable["pubCop",false])then
	{
	_amount = (_amount/3);
	};

if(DS_copLevel > 4)then
	{
	_amount = (_amount/2);
	};

if(DS_copLevel > 8)then
	{
	_amount = (_amount/2);
	};

_amount = (round(_amount));

hint format ["$%1 has been deducted from your bank account to pay security contractors",[_amount] call DS_fnc_numberText];
systemchat format ["$%1 has been deducted from your bank account to pay security contractors",[_amount] call DS_fnc_numberText];
[_amount,true,false] call DS_fnc_handleMoney;