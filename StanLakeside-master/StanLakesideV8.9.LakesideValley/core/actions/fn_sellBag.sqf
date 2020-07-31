/*
	File: sell bag of cash.
*/

if (typeOf _x == "Land_Sleeping_bag_blue_folded_F") then {
detach _x;
deletevehicle _x;
if (side player == civilian || side player == east) then {
_money = 55000;
[format ["Zamieniles skradzione pieniadze i otrzymales $%1!",_money],30,"green"] spawn domsg;

[7] call SOCK_fnc_updatePartial;
["cash","add",_money] call life_fnc_handleCash; 
};
_money = 12500;
if (side player == west) then {
[format ["Odzyskales skradziona torbe i otrzymujesz $%1 nagrody!",_money],30,"green"] spawn domsg;
["cash","add",_money] call life_fnc_handleCash; 
};		
};	

if (typeOf _x == "Land_Screwdriver_V1_F") then {
if (side player == west) then {
detach _x;
deletevehicle _x;
_money = 1000;
["cash","add",_money] call life_fnc_handleCash; 
[format ["Wymieniles nozyk na troche pieniedzy! Otrzymales %1",_money],30,"green"] spawn domsg;
};		
};	


if (typeOf _x == "Land_ExtensionCord_F") then {
if (side player == west) then {
detach _x;
deletevehicle _x;
_money = 1000;
["cash","add",_money] call life_fnc_handleCash; 
[format ["Wymieniles line na troche pieniedzy! Otrzymales %1",_money],30,"green"] spawn domsg;
};		
};	

