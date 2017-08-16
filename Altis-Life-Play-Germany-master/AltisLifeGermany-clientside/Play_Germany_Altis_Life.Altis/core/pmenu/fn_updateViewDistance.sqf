/*
	File: fn_updateViewDistance.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
*/
if (life_vdFoot > 3000) then {life_vdFoot = 3000;};
if (life_vdCar > 3000) then {life_vdCar = 3000;};
if (life_vdAir > 3000) then {life_vdAir = 3000;};

switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {setViewDistance life_vdFoot; setObjectViewDistance [life_vdFoot, 50];};
	case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance life_vdCar; setObjectViewDistance [life_vdCar, 50];};
	case ((vehicle player) isKindOf "Air"): {setViewDistance life_vdAir; setObjectViewDistance [life_vdAir, 50];};
};
