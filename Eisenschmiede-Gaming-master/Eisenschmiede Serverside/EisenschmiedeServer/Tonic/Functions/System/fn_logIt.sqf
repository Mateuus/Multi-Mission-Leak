#include "\EisenschmiedeServer\Tonic\script_macros.hpp"
/*
	Name: PerFecTiiNsKiLLz
	File: fn_logIt.sqf
	Description: Log handler

	_toLog = format ["%1 (%2) wurde getötet.", player getVariable["realname","Unknown"], getPlayerUID player];
	["KILL_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

*/
private["_mode","_log", "_message"];
_mode = param [0,""];
_log = param [1,""];
_message = [""];

{
	_output = switch(_mode) do {
		case "diag_log": {[0,diag_log _x];};
		case "ADMIN_LOG": {[1,format["1:ADMIN_LOG:Admin Log: %1",_log,_x]];};
		case "ADMIN_DEBUG": {[1,format["1:ADMIN_DEBUG:Admin Debug: %1",_log,_x]];};
		case "ADMIN_SPAWN": {[1,format["1:ADMIN_SPAWN:Admin Spawn: %1",_log,_x]];};
		case "ADMIN_KEY": {[1,format["1:ADMIN_KEY:Admin Key: %1",_log,_x]];};
		case "COP_LOG": {[1,format["1:COP_LOG:Cop Log: %1",_log,_x]];};
		case "GIVE_LOG": {[1,format["1:GIVE_LOG:Give Log: %1",_log,_x]];};
		case "DEPOSIT_LOG": {[1,format["1:DEPOSIT_LOG:Deposit Log: %1",_log,_x]];};
		case "ROB_LOG": {[1,format["1:ROB_LOG:Rob Log: %1",_log,_x]];};
		case "BUGREPORT_LOG": {[1,format["1:BUGREPORT_LOG:Bugreport Log: %1",_log,_x]];};
		case "ADMIN_MESSAGE_LOG": {[1,format["1:ADMIN_MESSAGE_LOG:Admin Message Log: %1",_log,_x]];};
		case "MESSAGE_LOG": {[1,format["1:MESSAGE_LOG:Message Log: %1",_log,_x]];};
		case "LIZENZ_LOG": {[1,format["1:LIZENZ_LOG:Lizenz Log: %1",_log,_x]];};
		case "FAHRZEUG_LOG": {[1,format["1:FAHRZEUG_LOG:Fahrzeug Log: %1",_log,_x]];};
		case "SHOP_LOG": {[1,format["1:SHOP_LOG:Shop Log: %1",_log,_x]];};
		case "SHOPSELL_LOG": {[1,format["1:SHOPSELL_LOG:Shop Sell Log: %1",_log,_x]];};
		case "MONEY_TRANSFER_LOG": {[1,format["1:MONEY_TRANSFER_LOG:Money Transfer Log: %1",_log,_x]];};
		case "GANG_WITHDRAW_LOG": {[1,format["1:GANG_WITHDRAW_LOG:Gang Withdraw Log: %1",_log,_x]];};
		case "GANG_DEPOSITS_LOG": {[1,format["1:GANG_DEPOSITS_LOG:Gang Depostis Log: %1",_log,_x]];};
		case "TICKET_LOG": {[1,format["1:TICKET_LOG:Ticket Log: %1",_log,_x]];};
		case "JAIL_LOG": {[1,format["1:JAIL_LOG:Jail Log: %1",_log,_x]];};
		case "KILL_LOG": {[1,format["1:KILL_LOG:Kill Log: %1",_log,_x]];};
		case "HACK_LOG": {[1,format["1:HACK_LOG:Hack Log: %1",_log,_x]];};
		case "RANDOME_LOG": {[1,format["1:RANDOME_LOG:Log: %1",_log,_x]];};
		default {[1,format["1:%1:extDB: %2",_mode,_x]];};
	};
	if(EQUAL(SEL(_output,0),1)) then {
		"extDB2" callExtension SEL(_output,1);
	};
} forEach _message;