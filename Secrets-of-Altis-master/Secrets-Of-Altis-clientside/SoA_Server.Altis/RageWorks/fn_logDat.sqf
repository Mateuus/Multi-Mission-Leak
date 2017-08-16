#include "debug_console.hpp"
/*

	fn_logDat.sqf
	Author: RageBone & G00golplexian
	
	Description: Logs given money from supporter
*/
private["_money","_supporter","_to","_mode","_msg1","_msg2","_msg3","_grund"];

_mode = _this select 3;
_grund = _this select 5;

switch(_mode) do {

	case 0: {
		_money = _this select 0;
		_supporter = _this select 1;
		_to = _this select 2;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 Euro wurden von %2 an %3 überwiesen/übergeben.",_money,_supporter,_to];
		_msg3 = "------------------------";
	};

	case 1: {
		_money = _this select 0;
		_supporter = _this select 1;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 Euro wurden von %2 ercheatet.",_money,_supporter];
		_msg3 = "------------------------";
	};

	case 2: {
		_unit = _this select 0;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 hat den Sidetalk verwendet!",_unit];
		_msg3 = "------------------------";
	};

	case 3: {
		_unit = _this select 0;
		_vehicle = _this select 1;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 hat %2 aufgebrochen!",_unit,_vehicle];
		_msg3 = "------------------------";
	};

	case 4: {
		_unit = _this select 0;
		_vehicle = _this select 1;
		_from = _this select 2;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 hat %2 von %3 beim Autoschmuggel verkauft!",_unit,_vehicle,_from];
		_msg3 = "------------------------";
	};

	case 5: {
		_money = _this select 0;
		_supporter = _this select 1;
		_to = _this select 2;
		_moneyold = _this select 4;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 Euro wurden vom %2-Konto an %3 übertragen. (Kontobetrag: %4 Euro)",_money,_supporter,_to,_moneyold];
		_msg3 = "------------------------";
	};

	case 6: {
		_money = _this select 0;
		_supporter = _this select 1;
		_to = _this select 2;
		_moneyold = _this select 4;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 Euro wurden von %3 auf das %2-Konto gebucht. (Kontobetrag: %4 Euro)",_money,_supporter,_to,_moneyold];
		_msg3 = "------------------------";
	};
	
	case 7: {
		_supporter = _this select 0;
		_script = _this select 1;
		_level = _this select 2;

		if(_level == 1) then {levelname = "Supporter"};
		if(_level == 2) then {levelname = "Moderator"};
		if(_level == 3) then {levelname = "Admin"};
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 %2 %3",levelname,_supporter,_script];
		_msg3 = "------------------------";
	};
	
	case 8: {
		_killer = _this select 0;
		_victim = _this select 1;
		_submode = _this select 2;		
		
		switch(_submode) do {	
			case 0: {		
				_msg1 = "------------------------";
				_msg2 = format ["%1 hat %2 überfahren! (Regelverstoss)",_killer,_victim];
				_msg3 = "------------------------";
			};
			
			case 1: {
				_msg1 = "------------------------";
				_msg2 = format ["%1 hat %2 getötet!",_killer,_victim];
				_msg3 = "------------------------";
			};
		};
	};
	
	case 9: {
		_player = _this select 0;
		_money = _this select 1;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 hat sein Haus verkauft und %2 Euro erhalten!",_player,_money];
		_msg3 = "------------------------";
	};
	
	case 10: {
		_supporter = _this select 0;
		_player = _this select 1;
		_item = _this select 2;
		_menge = _this select 4;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 hat %2 %3x %4 gesendet!",_supporter,_player,_menge,_item];
		_msg3 = "------------------------";
	};
	
	case 11: {
		_player = _this select 0;
		_money = _this select 1;
		_vehicle = _this select 2;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 hat für %2 Euro eine(n) %3 gekauft!",_player,_money,_vehicle];
		_msg3 = "------------------------";
	};

	case 12: {

		_player = _this select 0;
		_money = _this select 1;
		_vehicle = _this select 2;
		_versicherung = _this select 4;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 hat für %2 Euro eine(n) %3 %4-versichert!",_player,_money,_vehicle,_versicherung];
		_msg3 = "------------------------";
	};

	case 13: {

		_supporter = _this select 0;
		_player = _this select 1;
		_level = _this select 2;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 hat %2 auf Level %3 gesetzt!",_supporter,_player,_level];
		_msg3 = "------------------------";
	};

	case 14: {

		_supporter = _this select 0;
		_player = _this select 1;
		_lizenz = _this select 2;
		
		_msg1 = "------------------------";
		_msg2 = format ["%1 hat %2 %3 gegeben!",_supporter,_player,_lizenz];
		_msg3 = "------------------------";
	};
};

_msg2 = format["%1 (Grund: %2)",_msg2,_grund];
{conFileTime(_x)} foreach [_msg1,_msg2,_msg3];

//{diag_log _x} foreach [_msg1,_msg2,_msg3];