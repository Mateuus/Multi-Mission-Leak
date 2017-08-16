/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Process.sqf

Description:
Process stuff into something else
*/
["RPP_Process_MoneyBag", {
	private ["_item","_amount","_msg","_color"];
	_item = "Money Bag";
	_amount = [_item] call RPP_Inventory_Count;
	if (!([_item] call RPP_Inventory_Count >= 0)) exitWith {
		_msg = format ["You don't have any %1",_item];
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	RPP_Process = true;
	[_amount] call RPP_Process_MoneyBag_Loop;
}] call RPP_Function;
publicVariable "RPP_Process_MoneyBag";

["RPP_Process_MoneyBag_Loop", {
	private ["_amount","_progress_p","_ui","_progress","_pgText","_msg","_color"];
	disableSerialization;
	5 cutRsc ["RPP_ProgressBar","PLAIN"];
	_amount = _this select 0;
	_progress_p = 0.01;
	_ui = uiNameSpace getVariable "RPP_ProgressBar";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	while {RPP_Process} do {
		_pgText ctrlSetText "Opening Money bag...";
		_progress progressSetPosition _progress_p;
		sleep 0.2;
		_progress_p = _progress_p + 0.01;
		if (player distance RPP_Process_MoneyBag > 5) exitWith {
			_msg = "You are to far away from the Processing place";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			5 cutText ["","PLAIN"];
		};
		if (player getVariable "RPP_Handcuff") exitWith {
			_msg = "You can't open your wallet.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (player getVariable "RPP_Revive") exitWith {
			_msg = "You can't open your wallet.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (player getVariable "RPP_Tased") exitWith {
			_msg = "You can't open your wallet.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (!([_item] call RPP_Inventory_Count >= 0)) exitWith {
			_msg = "Did you lose your money ?";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (_progress_p >= 1) exitWith {
			_pgText ctrlSetText "Wallet Open";
			5 cutText ["","PLAIN"];
			[_amount] call RPP_Anticheat_addmoney;
			["Money Bag",_amount] call RPP_Inventory_Remove;
			_msg = format ["$%1 Added into your wallet",_amount];
			_color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Process_MoneyBag_Loop";