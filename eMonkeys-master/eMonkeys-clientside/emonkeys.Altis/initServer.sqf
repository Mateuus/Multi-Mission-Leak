/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
if(!isServer) exitWith {};
[] call compile PreprocessFileLineNumbers "\eMonkeys_server\init.sqf";

East setFriend [West, 1];
East setFriend [Civilian, 1];
East setFriend [Independent, 1];
West setFriend [East, 1];
West setFriend [Civilian, 1];
West setFriend [Independent, 1];
Independent setFriend [East, 1];
Independent setFriend [Civilian, 1];
Independent setFriend [West, 1];
Civilian setFriend [East, 1];
Civilian setFriend [Independent, 1];
Civilian setFriend [West, 1];
