/*

	Resets market by calling marketConfiguration

*/

[] call life_fnc_marketconfiguration;

[0,format["ADMIN: %1 has set the market prices to standart."],name player] remoteExecCall ["life_fnc_broadcast",RCLIENT];

["Market prices reset.",false,"slow"] call life_fnc_notificationSystem;