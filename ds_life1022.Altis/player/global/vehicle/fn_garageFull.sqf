/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Returns money when someones garage is full
*/

deleteVehicle (_this select 2);
hint format ["%1",(_this select 1)];
[(_this select 0),true,true] call DS_fnc_handleMoney;