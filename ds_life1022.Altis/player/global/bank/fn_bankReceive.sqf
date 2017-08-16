/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Receives transferred money
*/

params [
    ["_value",0,[0]],
    ["_sender","",[""]]
];

if(_value < 1)exitWith{};

[_value,true,true] call DS_fnc_handleMoney;
hint format ["%1 has deposited $%2 into your bank account",_sender,[_value] call DS_fnc_numberText];
//[] call DS_fnc_compileData;