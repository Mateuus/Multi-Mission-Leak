scriptName "fn_seizeVehicleCargo";
#define __filename "fn_seizeVehicleCargo.sqf"

//if ( call FL_policerank < 3 ) exitWith {};

private [ "_progressText", "_vehicle", "_ui", "_progress", "_pgText", "_progress", "_cP", "_done" ];

_vehicle = param [ 0, objNull, [ objNull ] ]; // -- Get Vehicle
_searchText = "Seizing Vehicle Cargo"; // -- Progress Bar Text
_vehicleType = getText( configFile >> "CfgVehicles" >> ( typeOf _vehicle ) >> "displayName" ); // -- Vehicle Type

if ( !( _vehicle in life_vehicles ) ) exitWith { hint "To seize trunk, you need keys"; }; // -- No keys

// -- Progress Bar
disableSerialization;
"seizeProgress" cutRsc [ "life_progress", "PLAIN" ];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format[ "%2 (1%1)...","%", _searchText ];
_progress progressSetPosition 0.08;
_cP = 0.08;
_done = false;

// -- Do the shit
while { true } do {

	sleep 0.8;
	_cP = _cP + 0.08;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format[ "%3 (%1%2)...", round ( _cP * 100 ), "%", _searchText ];
	if ( _cP >= 1 ) exitWith { _done = true; };
	if ( !( alive player ) ) exitWith { "seizeProgress" cutText [ "", "PLAIN" ]; };

};

"seizeProgress" cutText [ "", "PLAIN" ];

// -- Progress bar completed so set the variable
if ( _done ) then {

	"seizeProgress" cutText ["","PLAIN"];

    // -- Clear Vehicle Cargo
    clearItemCargoGlobal _vehicle; // -- Clear Items
    clearBackpackCargoGlobal _vehicle; // -- Clear Backpacks
    clearWeaponCargoGlobal _vehicle; // -- Clear Weapons
    clearMagazineCargoGlobal _vehicle; // -- Clear Magazines

    _vehicle setVariable [ "trunk", [ [ ], 0 ], true ]; // -- Seize virtual inventory of vehicle trunk

    [ 0, format [ "You have seized the cargo from the %1.", _vehicleType ] ] call life_fnc_broadcast;

};
