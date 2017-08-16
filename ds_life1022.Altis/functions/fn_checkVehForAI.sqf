/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Checks a vehicle for any non-job AI and removes them if found
*/

params [["_vehicle",objNull,[objNull]]];

if(isNull _vehicle)exitWith{};

{
    //Check if the unit is an AI and not a dead body
    if((!isPlayer _x)&&(alive _x))then {
        //Make sure it isn't a mission AI
        if(!((group _x) isEqualTo DS_civGroup))then {
            //Delete the AI
            unassignVehicle _x;
            moveOut _x;
            deleteVehicle _x;

            systemChat "Removed a disconnected player's AI from the vehicle.";
        };
    };
} forEach (crew _vehicle);