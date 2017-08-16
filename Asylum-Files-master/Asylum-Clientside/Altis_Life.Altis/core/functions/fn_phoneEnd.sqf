/*
	File: fn_phoneEnd.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Phone call has been forcibly closed!
*/

life_phone_status = 0;
[[player,objNull,true],"ASY_fnc_managePhone",false,false] spawn life_fnc_MP;