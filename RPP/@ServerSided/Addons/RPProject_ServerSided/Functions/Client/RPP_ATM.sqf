/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_ATM.sqf

Description:
ATM
*/
["RPP_ATM_Dialog", {
	private ["_text","_Cash","_Bank","_data"];
	if (!(RPP_CanUseATM)) exitWith {
		_msg = "Access denied!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	createDialog "RPP_ATM";
	disableSerialization;
	_Cash_STR = [] call RPP_Lib_FormatNumber_Cash;
    _bank_STR = [] call RPP_Lib_FormatNumber_Bank;
	_text = uiNameSpace getVariable ["RPP_ATM",displayNull];
	_Cash = _text displayCtrl 1000;
	_Bank = _text displayCtrl 1001;
	_Cash ctrlSetText format["Cash: $%1",_Cash_STR];
	_Bank ctrlSetText format["Bank: $%1",_bank_STR];

	{
		_data = lbAdd [2100, format ["%1",name _x]];
		lbSetData [2100,_data,getPlayerUID _x];
	} foreach playableUnits;

	buttonSetAction [1600, "[] call RPP_ATM_Withdraw;"];
	buttonSetAction [1601, "[] call RPP_ATM_Deposit;"];
	buttonSetAction [1602, "[] call RPP_ATM_Transfer;"];
}] call RPP_Function;
publicVariable "RPP_ATM_Dialog";

["RPP_ATM_Withdraw", {
	_amount = round(parseNumber(ctrlText 1400));
	if (_amount > RPP_Bank) exitWith {
		_msg = "You don't have that much in your bank account.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_amount > 9999999) exitWith {
		_msg = "You are not allowed to withdraw more then $999,99999";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_amount <= 0) exitWith {
		_msg = "Please type how much you want to withdraw.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	[_amount] call RPP_AntiCheat_RemoveBank;
	[_amount] call RPP_AntiCheat_AddMoney;

	_msg = format ["Successfully withdrawn $%1 from your bank account",_amount];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_ATM_Withdraw";

["RPP_ATM_Deposit", {
	_amount = round(parseNumber(ctrlText 1400));
	if (_amount > RPP_Cash) exitWith {
		_msg = "You don't have that much Cash on you";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_amount > 9999999) exitWith {
		_msg = "You are not allowed to deposit more then $999,99999";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_amount <= 0) exitWith {
		_msg = "Please type how much you want to deposit.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[_amount] call RPP_AntiCheat_RemoveMoney;
	[_amount] call RPP_AntiCheat_AddBank;

	_msg = format ["Successfully Deposit $%1 to your bank account",_amount];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_ATM_Deposit";

["RPP_ATM_Transfer", {
	if (lbCurSel 2100 == -1) exitWith {
		_msg = "Please first select a from the drop down menu.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 2100, ( lbCurSel 2100 ) ];
	if (_Data isEqualTo "") exitWith {
		_msg = "No Player selected";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Data isEqualTo getPlayerUID player) exitWith {
		_msg = "You are not allowed to transfer money to yourself.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_amount = round(parseNumber(ctrlText 1400));

	if (_amount > RPP_Bank) exitWith {
		_msg = "You don't have that much in your bank account.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_amount > 9999999) exitWith {
		_msg = "You are not allowed to send more then $999,99999";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_amount <= 0) exitWith {
		_msg = "Please type how much you want to send.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	[[player,_amount,_data], "RPP_ATM_Transfer_Get",true] call BIS_FNC_MP;

	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_ATM_Transfer";

["RPP_ATM_Transfer_Get", {
	private ["_p","_amount","_id","_getname"];
	_p = _this select 0;
	_amount = _this select 1;
	_id = _this select 2;
	_unit = "";
	_getname = "";
	{
		if (_id == getPlayerUID _x) exitWith {
			_unit = _x;
			_getname = name player;
		};
	} count playableUnits;

	[[_p,_amount], "RPP_ATM_Transfer_GetMoney",_unit] call BIS_FNC_MP;
	[[_getname,_amount], "RPP_ATM_Transfer_Return",_p] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_ATM_Transfer_Get";

["RPP_ATM_Transfer_GetMoney", {
	private ["_p","_amount"];
	_p = _this select 0;
	_amount = _this select 1;

	[_amount] call RPP_Anticheat_Addmoney;

	_msg = format ["%1 just transfered $%2 to you",name _p,_amount];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_ATM_Transfer_GetMoney";

["RPP_ATM_Transfer_Return", {
	private ["_name","_amount"];
	_name = _this select 0;
	_amount = _this select 1;

	_msg = format ["Successfully transfered $%1 to %2",_amount,_name];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	[_amount] call RPP_AntiCheat_RemoveMoney;
}] call RPP_Function;
publicVariable "RPP_ATM_Transfer_Return";