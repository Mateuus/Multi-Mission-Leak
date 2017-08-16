/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState","_className","_vehicleInfo","_maxFuel","_fillFuel"];
closeDialog 0;
_vehicle = cursorTarget;
DWEV_interrupted = false;
if(isNull _vehicle) exitWith {hint "Schau das Fahrzeug an, dass du betanken möchtest!"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint "Geh dichter an das Fahrzeug ran!"};

if(!([false,"fuelF",1] call DWEV_fnc_handlelnv)) exitWith {};
DWEV_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format["Refuelling %1",_displayName];

disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNameSpace getVariable "DWEV_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then
	{
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};

	sleep 0.195;

	if(isNull _ui) then
	{
			5 cutRsc ["DWEV_progress","PLAIN"];
			_ui = uiNamespace getVariable "DWEV_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(DWEV_interrupted) exitWith {};
};
DWEV_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen","PLAIN"];};


//wie viel sind 30 Liter?
_className = typeof _vehicle;
_vehicleInfo = [_className] call DWEV_fnc_fetchVehInfo;
_maxFuel = _vehicleInfo select 12; // Maximalen Tankinhalt in Litern ermitteln getVehicleInfo!
_fillFuel = (fuel _vehicle) + (20 / _maxFuel);		// Wie viele Liter werden benötigt um das Fahrzeug mit 20 Liter zu füllen
if(_fillFuel > 1) then { _fillFuel = 1; };

if(!local _vehicle) then
{
	[_vehicle,(_fillFuel)] remoteExec ["DWEV_fnc_setFuel",_vehicle];
}
	else
{
	_vehicle setFuel (_fillFuel);
};

titleText[format["Du hast den %1 mit 20 Litern betankt.",_displayName],"PLAIN"];
[true,"fuelE",1] call DWEV_fnc_handlelnv;