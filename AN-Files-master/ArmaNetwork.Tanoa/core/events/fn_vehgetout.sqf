/*
	ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
_vehicle = param[0,objNull,[objNull]];
switch (_vehicle) do
{
	case "I_Boat_Armed_01_minigun_F" : {player setPos (_vehicle modelToWorld [-3.85,0.78,-1.08]);};
	case "B_Boat_Armed_01_minigun_F" : {player setPos (_vehicle modelToWorld [-3.85,0.78,-1.08]);};
};
setViewDistance life_settings_viewDistanceFoot;
setObjectViewDistance [life_settings_viewDistanceFoot,0];
