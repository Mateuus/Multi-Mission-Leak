/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Receives money from another player
*/

params [
    ["_value",0,[0]],
    ["_unit",objNull,[objNull]]
];

if((isNil "_unit")||(isNull _unit)||(!isPlayer _unit))exitWith{hint "An error occured receiving money. You may need to relog"};
if(!([_value] call DS_fnc_isNumber))exitWith{};

hint format ["%1 has given you $%2",(name _unit),[_value] call DS_fnc_numberText];
[_value,false,true] call DS_fnc_handleMoney;
//[] call DS_fnc_compileData;