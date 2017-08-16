/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_object", "_type", "_item" ];
_object = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _object ) exitWith {};
if ( !isNull attachedTo _object ) exitWith {};

//--- Retrive object classname
_type = typeOf _object;

//--- Add object's item to player
_item = switch _type do {

	case "RoadCone_F": { "roadcone" };
	case "RoadCone_L_F": { "roadcone_l" };
	case "Land_BarGate_F": { "bargate" };
	case "Land_Crash_barrier_F": { "safetybarrier" };
	case "PlasticBarrier_03_orange_F": { "plasticbarrier_l" };
	case "PlasticBarrier_02_yellow_F": { "plasticbarrier_m" };
	case "Land_Cargo_House_V1_F": { "cargohouse_g" };
	case "Land_Cargo_House_V3_F": { "cargohouse_b" };
	case "Land_Cargo_Patrol_V1_F": { "cargopost_g" };
	case "Land_Cargo_Patrol_V3_F": { "cargopost_b" };
	case "Land_Cargo_HQ_V1_F": { "cargohq_g" };
	case "Land_Cargo_HQ_V3_F": { "cargohq_b" };
	case "Land_Cargo_Tower_V1_F": { "cargotower_g" };
	case "Land_Cargo_Tower_V3_F": { "cargotower_b" };
	case "Land_PortableLight_single_F": { "portablelight_s" };
	case "Land_PortableLight_double_F": { "portablelight_d" };
	case "SignAd_Sponsor_F": { "roadsign" };
	case "TapeSign_F": { "tapebarrier" };

	case "Land_LampStreet_F": { "streetlamp" };
	case "Land_CncBarrierMedium_F": { "concretebarrier_s" };
	case "Land_CncBarrierMedium4_F": { "concretebarrier_l" };

	//--- Shooting range equipment for RTO's
	case "TargetP_Inf3_F": { "target1_pop" };
	case "TargetP_Inf3_NoPop_F": { "target1" };
	case "TargetP_Inf3_Acc2_F": { "target2_pop" };
	case "TargetP_Inf3_Acc2_NoPop_F": { "target2" };
	case "TargetP_Civ3_F": { "target3_pop" };
	case "TargetP_Civ3_NoPop_F": { "target3" };
	case "Land_Target_Oval_F": { "target4_pop" };
	case "Land_Target_Oval_NoPop_F": { "target4" };
	case "Land_Shoot_House_Tunnel_Stand_F": { "shoot_house_stand" };
	case "Land_Shoot_House_Tunnel_Crouch_F": { "shoot_house_crouch" };
	case "Land_Shoot_House_Tunnel_Prone_F": { "shoot_house_prone" };

	default { "" };

};

if ( _item == "" ) exitWith { deleteVehicle _object };

if ( [ true, _item, 1 ] call life_fnc_handleInv ) then {

	//--- Delete the object
	deleteVehicle _object;

} else {

	hint "You do not have enough room in your inventory to dismantle this object.";

};
