/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Cops bribing drug dealer (Illegal items trader)
	*/
private ["_random"];	
if([500,true,false] call DS_fnc_checkMoney)exitwith{hint "You need $500 in your bank to bride this dealer"};
[500,true,false] call DS_fnc_handleMoney;
_random = round random 100;
if(_random < 20)exitwith{hint "Bribe failed, though you still lost your money"};
hint format [
"Illegal Item Current Prices\n\n\n
Meth: $%1\n
Illegal Relics: $%2\n
Weed: $%3\n
Heroin: $%4\n
Cocaine: $%5
"
,(DS_sellArray select 39)
,(DS_sellArray select 34)
,(DS_sellArray select 28)
,(DS_sellArray select 27)
,(DS_sellArray select 29)
];
