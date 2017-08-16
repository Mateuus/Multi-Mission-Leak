/*
	File: fn_GroupBankInVite.sqf
	Author: Barney

	Description:
	Starts the bank group process and asks every selected member if it wants to join..

	You're not allowed to modify this file!
   	 Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/


_state = param[0,-1,[-1]];

if(_state == -1)exitWith{};
BankHeistState = _state;