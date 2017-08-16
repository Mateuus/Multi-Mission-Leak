/*
	File: fn_vehDetect.sqf
	Author: Komodo

	Description:
	Script used to display the distance to the closest Zamak Lab found (or any choosen vehicle)
	TODO: Might be necessary to check that the vehicle is processing to allow detection (would make sense in theory, but not really easy for cops)
*/

private["_message","_vehicle","_vehicleList","_upp","_ui","_progress","_pgText","_progress","_cP","_distance","_distanceMax"];

//Getting the closet vehicle of selected type. If several found, then the first is chosen.
_vehicle = Null;
_distanceMax = 500;
_vehicleList = nearestObjects [player, ["O_Truck_02_Ammo_F"], _distanceMax];
if (count _vehicleList == 1) {_vehicle = _vehicleList select 0; _message = "Un laboratoire mobile a été repéré dans un rayon de 500m. Aide-toi de la barre ci-dessus pour le repérer.";};
else if (count _vehicleList == 0) {_vehicle = Null; _message = "Aucun laboratoire trouvé dans un rayon de 500m.";};
else if (count _vehicleList > 1) {_vehicle = _vehicleList select 0; _message = "plusieurs laboratoires repérés, l'appareil te donnera une indication sur le premier trouvé.";};
if (_vehicle == Null) exitWith {_message;};

//Setup our detection bat (re-used progress bar)
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_upp = "Distance Laboratoire Mobile: ";
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","m",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_distance = player distance _vehicle;

hint "Ce détecteur ne peut afficher que la distance. A toi d'apprendre à l'utiliser pour trouver ta cible!";

//Looping to update the distance each second. No need for more updates, but I should improve the loop exit conditions.
while{true} do
	{
		sleep  1;
		if(!alive _vehicle || isNull _vehicle) exitWith;
		if(!alive player) exitWith {};
		//Objective is to check the player is still in his vehicle.
		if (isNull attachedTo player) exitWith{};
		_distance = player distance _vehicle;
		if(_distance > _distanceMax) exitWith {hint "Tu t'es trop éloignée de la cible, le détecteur intégré s'est mis en veille. Relance les gyrophares pour relancer la détection.";};
		_cP = _distance/_distanceMax;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",_distance,"m",_upp];
	};

5 cutText ["","PLAIN"];
