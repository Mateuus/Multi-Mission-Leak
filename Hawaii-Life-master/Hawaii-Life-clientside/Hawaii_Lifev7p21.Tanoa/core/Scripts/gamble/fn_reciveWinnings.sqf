#include "..\..\..\script_macros.hpp"
/*
	File:	fn_reciveWinnings.sqf
	Date:   01.04.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life,hawaii-life.net server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_totalmoney", 0,[0]],
	["_perc", 0,[0]],
	["_winninticket", 0,[0]]
];
ADD(BANK,(_totalmoney * 0.9));

hint parseText format["<t size= '1.6' color='#f19727'>Hawaii-Jackpot<br/><br/></t><t size= '1.2'>Herzlichen Glückwunsch<br/> Du hast den Hawaii-Jackpot gewonnen mit einer Gewinnchance von %1%2<br/><br/>Gezogenes Ticket: %4 <br/>Gewonnen: $%3</t>",_perc,"%",[_totalmoney * 0.9] call life_fnc_numberText,[_winninticket] call life_fnc_numberText];

[1] call SOCK_fnc_updatePartial;