private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint "Ce vehicule n'a pas d'information, il a du spawn avec un cheat. \n\nDetruire le vehicule."; deleteVehicle _vehicle;};
	life_action_inUse = true;
	hint "Recherche Vehicule....";
	uiSleep 3;
	life_action_inUse = false;
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint "Vous ne pouvez pas chercher dans ce vehicule";};
	_owners = [_owners] call life_fnc_vehicleOwners;
	if(_owners == "any<br/>") then
	{
		_owners = "Pas de proprietaire, mise en fourriere<br/>";
	};
	hint parseText format["<t color='#FF0000'><t size='2'>Information</t></t><br/><t color='#FFD700'><t size='1.5'>Proprietaire</t></t><br/> %1",_owners];
};