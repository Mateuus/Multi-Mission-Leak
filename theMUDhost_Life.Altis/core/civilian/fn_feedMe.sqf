//////////////////////////////////////////////////////////////////
// Created by: Kevin for STS
// Function Name: fn_feedMe.sqf
// Description: sell food and water to customer
//////////////////////////////////////////////////////////////////

if(life_cash < 1000) exitWith {titleText["You don't have enough money!","PLAIN"]};

life_cash = life_cash - 1000;
titleText["Thank you come again!","PLAIN"];
life_thirst = 100;
life_hunger = 100;

[] call life_fnc_hudUpdate;