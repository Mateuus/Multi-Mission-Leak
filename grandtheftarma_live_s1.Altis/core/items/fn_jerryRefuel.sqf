/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_vehicle" ];
_vehicle = [] call GTA_fnc_cursorTarget;

//--- Error checks
if ( isNull _vehicle ) exitWith {};

//--- Check if player is looking at vehicle
if(isNull _vehicle) exitWith {hint localize "STR_ISTR_Jerry_NotLooking"};

//--- Check if correct vehicle type
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};

//--- Check if player near vehicle
if(player distance _vehicle > 7.5) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};

//--- Check if player has fuel can
if (life_inv_fuelF <= 0) exitWith {};

//--- Action
if ( [ 10, "Refuelling Vehicle", nil, { !isNull _this && { [ player, _this, 2 ] call GTA_fnc_boundingCollision } }, _vehicle ] call GTA_fnc_action ) then {

  //--- Remove fuel can
  [false, "fuelF", 1] call life_fnc_handleInv;

 //--- Refuel the vehicle
 switch (true) do {

  	case (_vehicle isKindOF "LandVehicle"):  {

  		if(!local _vehicle) then  {

  		    [[_vehicle,(Fuel _vehicle) + 0.5],"life_fnc_setFuel",_vehicle,false] call GTA_fnc_remoteExec;

  		}	else	{

  		    _vehicle setFuel ((Fuel _vehicle) + 0.5);

  		};
  	};

  	case (_vehicle isKindOf "Air"): {

  		if(!local _vehicle) then	{

  		    [[_vehicle,(Fuel _vehicle) + 0.2],"life_fnc_setFuel",_vehicle,false] call GTA_fnc_remoteExec;

  		}	else	{

  		    _vehicle setFuel ((Fuel _vehicle) + 0.2);

  		};
  	};

  	case (_vehicle isKindOf "Ship"): {

  		if(!local _vehicle) then	{

        [[_vehicle,(Fuel _vehicle) + 0.35],"life_fnc_setFuel",_vehicle,false] call GTA_fnc_remoteExec;

  		}	else	{

  		    _vehicle setFuel ((Fuel _vehicle) + 0.35);

      };
    };
  };

	//--- Refuel message
	titleText [ "Vehicle refuelled", "PLAIN" ];

	//--- Add fatigue
	player setFatigue ( getFatigue player + 0.2 );

	//--- Add empty fuel can
	[true, "fuelE", 1] call life_fnc_handleInv;

} else {

	//--- Cancel
	titleText [ "Refuel interrupted", "PLAIN" ];

};
