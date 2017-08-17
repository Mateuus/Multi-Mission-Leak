/*

	Open pack-up dlg

*/

if(!createDialog "marketView") exitWith {["Failed Creating Dialog",false,"slow"] call life_fnc_notificationSystem;}; //Couldn't create the menu?
disableSerialization;



waitUntil {!isnull (findDisplay 39500)};


//Refresh
[] spawn life_fnc_refreshMarketView;