/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets martial law for the server
*/

private ["_action","_type","_reasonString"];

params ["_type"];

_action = [
	"Make sure you have the permission from the highest ranking online officer before declaring martial law or grounding all Air Vehicles. Martial law does not auto expire, it must be ended manually",
	"Martial Law",
	"Continue",
	"Abort"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

switch(_type)do {
	case 0: { //Declare Region Wide Martial Law
		if(miscInfoArray select 8)exitWith{hint "This is already activated";};
		if(DS_policeBank < 50000)exitWith{hint "There needs to be at least $50k in the police bank to declare martial law on the entire island"};
		if(DS_crimeRate < 8)exitWith{hint "The crimerate must be at least 8 to begin this"};
		[50000,false] remoteExec ["HUNT_fnc_policeBank",2];
		publicVariable "DS_policeBank";
		[0,""] remoteExec ["HUNT_fnc_martiallaw",2];
	};
	case 1: { //End Region Wide Martial Law
		if(!isServer)exitWith{hint "Martial law will automatically undeclared one hour after being set";};
		if(!(miscInfoArray select 8))exitWith{hint "There is no martial law currently declared";};
		[10] remoteExec ["HUNT_fnc_martiallaw",2];
	};
	case 2: { //Declare Air Ban
		if(DS_copLevel < 6)exitWith{hint "Your police level is not high enough to do this"};
		if(DS_AirBan)exitWith{hint "An air ban is already active";};
		if(DS_policeBank < 100000)exitWith{hint "There is not enough funds in the police bank to declare this"};

		_action = [
			"Are you sure you want to ground all air vehicles? This will give civilians 5 minutes to get out of a sky. After that point, any air vehicles are allowed to be shot down with any force",
			"Ground Air Vehicles",
			"Continue",
			"Abort"
		] call BIS_fnc_guiMessage;
		if(!_action)exitWith{};

		[100000,false] remoteExec ["HUNT_fnc_policeBank",2];
		[7] remoteExec ["HUNT_fnc_martiallaw",2];
	};
	case 3: { //End Air Ban
		if(DS_copLevel < 6)exitWith{hint "Your police level is not high enough to do this"};
		if(!DS_AirBan)exitWith{hint "There is no air ban currently active";};
		[7] remoteExec ["HUNT_fnc_martiallaw",2];
	};
};