/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_BankRobbery.sqf

Description:
robbing bank
*/
["RPP_BankRobbery_MoneyAdd", {
	if (!(isServer)) exitWith {};
	[] spawn {
		private ["_Add"];
		while {true} do {
			_Add = round (random RPP_BankMoneyadd);
			sleep (RPP_BankMoneyadd_WaitTime);
			waituntil{!RPP_isRobbingBank};
			if (!(RPP_isRobbingBank)) then {
				RPP_BankSafe1 = RPP_BankSafe1 + _add;
				publicVariable "RPP_BankSafe1";
			};
			sleep 25;
		};
	};
}] call RPP_Function;
publicVariable "RPP_BankRobbery_MoneyAdd";

[] call RPP_BankRobbery_MoneyAdd;

["RPP_BankRobbery_Rob", {
	private ["_msg","_color"];
	if (RPP_isCop || RPP_isEMT) exitWith {
		_msg = "You are not allowed to rob the bank!";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	//Need to finish the crafting system first
	/*if (["Lingor Bank Keys"] call RPP_Inventory_Count == 0) exitWith {
		_msg = "You are not able to open the safe, you need the Lingor Bank Keys";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	}; */
	if (RPP_isRobbingBank) exitWith {
		_msg = "Someone is already robbing the bank";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if (!(call RPP_isArmed)) exitWith {
		_msg = "You need to be Armed to rob the bank.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_BankSafe1 < 4500) exitWith {
		_msg = "There is not enough money in the bank!";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};

	RPP_isRobbingBank = true;
	publicVariable "RPP_isRobbingBank";
	_msg = "!!WARNING!! SOMEONE IS ROBBING THE BANK !!WARNING!!";

	[_msg] call RPP_Message_Police;
	[RPP_Safe,"RPP_BankRobbery_Alarm"] call RPP_PlaySound_Global_Object;

	_msg = "You are now Robbing the Bank!";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;

	[] call RPP_BankRobbery_StartRob;
}] call RPP_Function;
publicVariable "RPP_BankRobbery_Rob";

["RPP_BankRobbery_StartRob", {
	[] spawn {
		private ["_RPP_BankRob_M","_RPP_BankRob_S","_msg","_color"];
		_RPP_BankRob_M = 5;
		_RPP_BankRob_S = 0;
		RPP_CanUseATM = false;
		while {RPP_isRobbingBank} do {
			titleText [format ["Bank Timer: Minute(s): %1  Second(s): %2",_RPP_BankRob_M,_RPP_BankRob_S], "PLAIN"];
			if (_RPP_BankRob_S <= 0 && _RPP_BankRob_M <= 0) exitWith {
				[] call RPP_BankRobbery_Success;

				RPP_isRobbingBank = false;
				publicVariable "RPP_isRobbingBank";
			};
			if (_RPP_BankRob_S <= 0 && _RPP_BankRob_M >= 1) then {
				_RPP_BankRob_M = _RPP_BankRob_M - 1;
				_RPP_BankRob_S = 59;
			};
			if (player distance (getpos RPP_Safe) > 24) exitWith {
				_msg = "You failed the robbery because you left the area.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;

				RPP_isRobbingBank = false;
				publicVariable "RPP_isRobbingBank";
				RPP_CanUseATM = true;
			};
			if (!Alive player) exitWith {
				_msg = "You failed the robbery because you died.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;

				RPP_isRobbingBank = false;
				publicVariable "RPP_isRobbingBank";
				RPP_CanUseATM = true;
			};
			if (player getVariable "RPP_HandCuff") exitWith {
				_msg = "You failed the robbery because you were handcuffed.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;

				RPP_isRobbingBank = false;
				publicVariable "RPP_isRobbingBank";
				RPP_CanUseATM = true;
			};
			if (player getVariable "RPP_CabelCuff") exitWith {
				_msg = "You failed the robbery because you were cable cuffed.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;

				RPP_isRobbingBank = false;
				publicVariable "RPP_isRobbingBank";
				RPP_CanUseATM = true;
			};
			if (player getVariable "RPP_Revive") exitWith {
				_msg = "You failed the robbery because you died.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;

				RPP_isRobbingBank = false;
				publicVariable "RPP_isRobbingBank";
				RPP_CanUseATM = true;
			};
			_RPP_BankRob_S = _RPP_BankRob_S - 1;
			sleep 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_BankRobbery_StartRob";

["RPP_BankRobbery_Success", {
	private ["_msg","_color"];
	["Money Bag",RPP_BankSafe1] call RPP_Inventory_Add;

	_msg = format ["You successfully robbed the bank for $%1",RPP_BankSafe1];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;

	RPP_BankSafe1 = RPP_BankSafe1 - RPP_BankSafe1;
	RPP_isRobbingBank = false;

	publicVariable "RPP_isRobbingBank";
	publicVariable "RPP_BankSafe1";

	[] spawn {
		sleep 500;
		RPP_CanUseATM = true;
	};
}] call RPP_Function;
publicVariable "RPP_BankRobbery_Success";