#include "..\..\..\script_macros.hpp"
/*
	File:	fn_BugOccored.sqf
	Date:   02.04.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life,hawaii-life.net server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_placedMoney", 0,[0]],
	["_name", "0",[""]]
];
ADD(BANK,(_placedMoney ));

if ((count life_gamble_teil) isEqualTo 1) then {
	hint parseText format["<t size= '1.6' color='#f19727'>Hawaii-Jackpot<br/><br/></t><t size= '1.2'>Es tut uns leid %1. Da du der einzige Teilnehmer des Hawaii-Jackpot warst, wurde dir dein gesamter Einsatz ohne Abzüge zurück überwiesen.<br/>Dein Einsatz: $%2</t>",_name,[_placedMoney] call life_fnc_numberText];
} else {
	hint parseText format["<t size= '1.6' color='#f19727'>Hawaii-Jackpot<br/><br/></t><t size= '1.2'>Es tut uns leid %1. Leider ist ein Fehler bei der Ziehung des Gewinners aufgetreten, deswegen wurden allen Teilnehmern der Einsatz  zurück überwiesen.<br/>Dein Einsatz: $%2</t>",_name,[_placedMoney] call life_fnc_numberText];
};

[1] call SOCK_fnc_updatePartial;