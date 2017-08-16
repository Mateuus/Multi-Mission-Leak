/*
	ArmA.Network
	The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_vehicle = param[2,objNull,[objNull]];
switch (true) do
{
	case (_vehicle isKindOf "LandVehicle"): {
    setViewDistance life_settings_viewDistanceCar;
    setObjectViewDistance [life_settings_viewDistanceCar,0];
  };
	case (_vehicle isKindOf "Air"): {
    setViewDistance life_settings_viewDistanceAir;
    setObjectViewDistance [life_settings_viewDistanceAir,0];
  };
	case (_vehicle isKindOf "Ship"): {
		setViewDistance life_settings_viewDistanceCar;
    setObjectViewDistance [life_settings_viewDistanceCar,0];
	};
	default {
    setViewDistance life_settings_viewDistanceFoot;
    setObjectViewDistance [life_settings_viewDistanceFoot,0];
  };
};
