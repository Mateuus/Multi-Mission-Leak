// this allowDamage false; this enableSimualtion false; this addAction["Rob Cash Register",life_fnc_robShops,"",0,false,false,"",' !life_action_robshops '];

private ["_robber", "_shop", "_cashRegister", "_ui", "_progress", "_pgText", "_cP", "_ongoingRobbery", "_markerName", "_markerZoneName", "_shopName", "_action"];
_shop = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_robber = [_this, 1, objNull, [objNull]] call GTA_fnc_param;
_action = [_this, 2] call GTA_fnc_param;

_ongoingRobbery = _shop getVariable ["ongoingRobbery", false];
_shopName = _shop getVariable ["nametag_title","Unknown"];

//--- Error checks
if (!alive _robber) exitWith {};

if (side _robber != civilian) exitWith {hint "You can not rob this station!"};
if (_robber distance _shop > 5) exitWith {hint "You need to be within 5m of the cashier to rob him!"};

if (_ongoingRobbery) exitWith {hint "Robbery already in progress!"};
if (vehicle player != _robber) exitWith {hint "Get out of your vehicle!"};

if (currentWeapon _robber == "" || {currentWeapon _robber == binocular player}) exitWith {hint "You do not threaten me! Get out of here you hobo!"};

_cops = west countSide allPlayers;
if (_cops < 4) exitWith {hint "There isn't enough cops online to rob the gas station!"};

_cashRegister = 40000 + round (random 25000);
_markerName = format ["robMarker_%1", name _robber];
_markerZoneName = format ["robZoneMarker_%1", name _robber];

//--- Start Robbery
_shop setVariable ["ongoingRobbery", true, true];
_ongoingRobbery = true;
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";

//--- Alert law enforcement
[
	[
		1,
		[
			["STR_GTA_MISC_GAS_STATION_ALERT_GANG", "STR_GTA_MISC_GAS_STATION_ALERT"] select (isNil {group player getVariable "gang_name"}),
			[getPosATL _shop] call GTA_fnc_nearestTown,
			group player getVariable ["gang_name", ""]
		],
		["Alert", "#ff0000"]
	],
	"GTA_fnc_broadcast",
	west
] call GTA_fnc_remoteExec;

//--- Create the marker
_marker = createMarker [_markerName, position _shop];
_markerName setMarkerColor "ColorRed";
_markerName setMarkerText format ["Ongoing Robbery! - %1", _shopName];
_markerName setMarkerType "mil_warning";

/*_marker = createMarker [_markerZoneName, (position player)];
_markerZoneName setMarkerColor "ColorBlue";
_markerZoneName setMarkerShape "ELLIPSE";
_markerZoneName setMarkerType "Empty";
_markerZoneName setMarkerSize [50, 50];
_markerZoneName setMarkerBrush "FDiagonal";*/

// Set up the progress bar
disableSerialization;
("life_progress" call BIS_fnc_rscLayer) cutRsc ["life_progress", "PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["Robbery Progress (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if (_ongoingRobbery) then {
	life_action_robshops = true;
	[] spawn { sleep (20 * 60); life_action_robshops = false; };

	//--- Progress Bar
	while {true} do {
		sleep 2.40;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;

		_pgText ctrlSetText format ["Robbery in Progress (%1%2)...", round (_cP * 100), "%"];

		if (_cP >= 1) exitWith {};
		if (_robber distance _shop > 12) exitWith {};
		if (!alive _robber) exitWith {};
	};

	//--- Error checks
	if (!alive _robber || {vehicle player != _robber}) exitWith {
		deleteMarker _markerName;
		deleteMarker _markerZoneName;
		_shop setVariable ["ongoingRobbery", false, true];
	};

	if (_robber distance _shop > 12) exitWith	{
		deleteMarker _markerName;
		deleteMarker _markerZoneName;
		_shop switchMove "";
		hint "You need to stay within 12m to Rob registry! - Now the registry is locked."; ("life_progress" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
		_shop setVariable ["ongoingRobbery", false, true];
	};

	("life_progress" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

	//--- Robbery successful
	titleText [format ["You have successfully robbed the store for £%1", [_cashRegister] call life_fnc_numberText], "PLAIN"];
	GTA_money_cash = GTA_money_cash + _cashRegister;
	_shop switchMove "";

	//--- Wait for a bit before adding the robber to the wantedlist and removing the marker
	sleep 60;

	_shop setVariable ["ongoingRobbery", false, true];
	deleteMarker _markerName;
	deleteMarker _markerZoneName;

	if (!alive _robber) exitWith {};
	[[getPlayerUID _robber, name _robber, "211"], "life_fnc_wantedAdd", false] call GTA_fnc_remoteExec;
};

sleep (30 * 60);
_shop setVariable ["ongoingRobbery", false, true];
_action = _shop addAction ["Rob Cash Register", life_fnc_robShops];
