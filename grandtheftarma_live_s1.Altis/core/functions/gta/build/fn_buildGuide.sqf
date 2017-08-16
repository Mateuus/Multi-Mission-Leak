/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if ( !isNil "GTA_build_busy" && { GTA_build_busy } ) exitWith {};
GTA_build_busy = true;

private [ "_object", "_exit", "_boundingBox", "_boundingY", "_boundingZ" ];
_object = [ _this, 0, "", ["",objNull] ] call GTA_fnc_param;
_exit = false;

//--- Error checks
if ( typeName _object == typeName "" && { _object == "" } ) exitWith {};
if ( typeName _object == typeName objNull && { isNull _object || !isNull attachedTo _object } ) exitWith {};

//--- Create object if classname is given
if ( typeName _object == typeName "" ) then {

	//--- Convert item handle to classname
	_object = switch _object do {

		case "roadcone": { "RoadCone_F" };
		case "roadcone_l": { "RoadCone_L_F" };
		case "bargate": { "Land_BarGate_F" };
		case "safetybarrier": { "Land_Crash_barrier_F" };
		case "plasticbarrier_l": { "PlasticBarrier_03_orange_F" };
		case "plasticbarrier_m": { "PlasticBarrier_02_yellow_F" };
		case "cargohouse_g": { "Land_Cargo_House_V1_F" };
		case "cargohouse_b": { "Land_Cargo_House_V3_F" };
		case "cargopost_g": { "Land_Cargo_Patrol_V1_F" };
		case "cargopost_b": { "Land_Cargo_Patrol_V3_F" };
		case "cargohq_g": { "Land_Cargo_HQ_V1_F" };
		case "cargohq_b": { "Land_Cargo_HQ_V3_F" };
		case "cargotower_g": { "Land_Cargo_Tower_V1_F" };
		case "cargotower_b": { "Land_Cargo_Tower_V3_F" };
		case "portablelight_s": { "Land_PortableLight_single_F" };
		case "portablelight_d": { "Land_PortableLight_double_F" };
		case "roadsign": { "SignAd_Sponsor_F" };
		case "tapebarrier": { "TapeSign_F" };

		case "streetlamp": { "Land_LampStreet_F" };
		case "concretebarrier_s": { "Land_CncBarrierMedium_F" };
		case "concretebarrier_l": { "Land_CncBarrierMedium4_F" };

		//--- Shooting range equipment for RTO's
		case "target1_pop": { "TargetP_Inf3_F" };
		case "target1": { "TargetP_Inf3_NoPop_F" };
		case "target2_pop": { "TargetP_Inf3_Acc2_F" };
		case "target2": { "TargetP_Inf3_Acc2_NoPop_F" };
		case "target3_pop": { "TargetP_Civ3_F" };
		case "target3": { "TargetP_Civ3_NoPop_F" };
		case "target4_pop": { "Land_Target_Oval_F" };
		case "target4": { "Land_Target_Oval_NoPop_F" };
		case "shoot_house_stand": { "Land_Shoot_House_Tunnel_Stand_F" };
		case "shoot_house_crouch": { "Land_Shoot_House_Tunnel_Crouch_F" };
		case "shoot_house_prone": { "Land_Shoot_House_Tunnel_Prone_F" };

		default { "" };

	};

	//--- Exit if invalid classname
	if ( _object == "" ) exitWith { _exit = true };

	//--- Create the object
	_object = createVehicle [ _object, [ 0, 0, 1000 ], [], 0, "CAN_COLLIDE" ];

	//--- Disable the simulation
	if !( ( toLower typeOf _object ) in [ "roadcone_l_f" ] ) then {

		[ _object, false ] call GTA_fnc_enableSimulation;

	};

	//--- Disable damage for object
	_object allowDamage false;
	[ [ _object, false ], "allowDamage", false ] call GTA_fnc_remoteExec;

};

//--- Exit
if ( _exit ) exitWith {};

//--- Set build variable
_object setVariable [ "build", true, true ];

//--- Retrive the bounding box dimensions
_boundingBox = boundingBoxReal _object;
_boundingY = abs ( ( _boundingBox select 0 ) select 1 ) + 2;
_boundingZ = abs ( ( _boundingBox select 0 ) select 2 );

//--- Attach to player
_object attachTo [ player, [ 0, _boundingY, _boundingZ ] ];

//--- Build place action
GTA_build_placeAction = player addAction [ "<t color='#ff8800'>Assemble</t>", GTA_fnc_buildPlace, _object, 10 ];
