/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	deletes objects on the client (Since they don't seem to delete globally when done from the server until you go near the object :/
*/

(_this select 0) setVariable ["revive",false,true];
deleteVehicle (_this select 0);