/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Deletes objects on the client (Since they don't seem to delete globally when done from the server until you go near the object :/)
*/

params [["_corpse",objNull,[objNull]]];

if(isNull _corpse)exitWith{};
if(alive _corpse)exitWith{};

_corpse setVariable ["revive",false,true];
deleteVehicle _corpse;