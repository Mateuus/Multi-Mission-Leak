#include "..\..\script_macros.hpp"
/*
	File: fn_arm.sqf
	Author: RPGforYOU
	Website: www.outlawed-veterans.com
	Version: 2.0
	PATCHNOTES:
	- Simplified the file structure and combined vehicles and player side checks for the easiness.
	
	Description:
	Add Ammo to specific armed vehicles, jets and helicopters fully customizable.
*/
private["_vehicle","_vehiclename","_action","_armamentcost"];
_vehicle = (vehicle player);
_armamentcost = 0;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// CHECKS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if(!alive player) exitWith {};
if(playerSide in [independent,east]) exitWith {}; 

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SETUP ACTIONS - fn_setupActions.sqf
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// life_actions = 
//[player addAction["<img image='\A3\UI_F_Curator\Data\CfgMarkers\kia_ca.paa' size='1'></img>
// Purchase Armament",life_fnc_arm,"",0,false,false,"",
//'(typeOf(vehicle player) in 
//["O_MRAP_02_hmg_F","B_G_Offroad_01_armed_F","I_Plane_Fighter_03_CAS_F","B_Heli_Light_01_armed_F","B_Plane_CAS_01_F","O_Plane_CAS_02_F","O_APC_Wheeled_02_rcws_F","B_APC_Tracked_01_AA_F","I_MRAP_03_hmg_F","I_Heli_light_03_F"])
//&& speed (vehicle player) < 2 
//&& speed (vehicle player) > -1 
//&& playerSide in [west,civilian]']];
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//life_actions = [player addAction["<img image='\A3\UI_F_Curator\Data\CfgMarkers\kia_ca.paa' size='1'></img> Purchase Armament",life_fnc_arm,"",0,false,false,"",'(typeOf(vehicle player) in ["O_MRAP_02_hmg_F","B_G_Offroad_01_armed_F","I_Plane_Fighter_03_CAS_F","B_Heli_Light_01_armed_F","B_Plane_CAS_01_F","O_Plane_CAS_02_F","O_APC_Wheeled_02_rcws_F","B_APC_Tracked_01_AA_F","I_MRAP_03_hmg_F","I_Heli_light_03_F"]) && speed (vehicle player) < 2 && speed (vehicle player) > -1 && playerSide in [west,civilian]']];
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// CIVILIANS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if(playerSide isEqualTo civilian) then {
if (((getMarkerPos "campnorth") distance player) < 300 || ((getMarkerPos "campsouth") distance player) < 300 || ((getMarkerPos "Donator_Zone_1") distance player) < 280 || ((getMarkerPos "BlackMarket") distance player) < 100 || ((getMarkerPos "gang_area_2") distance player) < 50 || ((getMarkerPos "gang_area_5") distance player) < 50 || ((getMarkerPos "gang_area_1") distance player) < 50 || ((getMarkerPos "gang_area_3") distance player) < 60 ) then {

//Defining
if (typeOf(_vehicle) isEqualTo "I_Plane_Fighter_03_CAS_F") then {
_vehiclename = "A-143 Buzzard";
_armamentcost = 125000;
	} else {
	if (typeOf(_vehicle) isEqualTo "B_Plane_CAS_01_F") then {
	_vehiclename = "A-164 Wipeout";
	_armamentcost = 225000;
		} else {
		if (typeOf(_vehicle) isEqualTo "O_Plane_CAS_02_F") then {
		_vehiclename = "To-199 Neophron";
		_armamentcost = 175000;
		   } else {
				if (typeOf(_vehicle) isEqualTo "B_T_VTOL_01_armed_F") then {
				_vehiclename = "Blackfish";
				_armamentcost = 250000;
				} else {
					if (typeOf(_vehicle) isEqualTo "B_Heli_Light_01_armed_F") then {
					_vehiclename = "AH-9 Pawnee";
					_armamentcost = 115000;
							} else {
							if (typeOf(_vehicle) isEqualTo "I_G_Offroad_01_armed_F") then {
							_vehiclename = "Offroad (Armed)";
							_armamentcost = 25000;
							} else {
							if (typeOf(_vehicle) isEqualTo "I_APC_tracked_03_cannon_F") then {
							_vehiclename = "FV-720 Mora";
							_armamentcost = 150000;
									} else {
										if (typeOf(_vehicle) isEqualTo "O_MRAP_02_hmg_F") then {
										_vehiclename = "Ifrit HMG";
										_armamentcost = 75000;
										} else {
										if (typeOf(_vehicle) isEqualTo "O_Heli_Light_02_F") then {
										_vehiclename = "PO-30 Orca";
										_armamentcost = 130000;
										} else {
										if (typeOf(_vehicle) isEqualTo "O_APC_Wheeled_02_rcws_F") then {
										_vehiclename = "Madrid";
										_armamentcost = 100000;
										} else {
										if (typeOf(_vehicle) isEqualTo "O_Heli_Attack_02_F") then {
										_vehiclename = "Mi-48 Kajman";
										_armamentcost = 80000;
										} else {
											_vehiclename = "#ERROR# Alert Admin";
											_armamentcost = 0;
											};
		
				};
			};				
			};	
		};	
	};
	};
};
};
};
};


// Money check
if(BANK < _armamentcost) exitWith {hint format[localize "STR_House_NotEnough"];};


// Dialog opening
_action = [
			format["Armament will cost you $%2 taken from your bank account!
			<br/><t color='#ff0000'>Would you like to rearm %1!</t>",_vehiclename,[_armamentcost] call life_fnc_numberText],
			"Armament Service - Outlawed Veterans",
			"ARM it!",
			"No."
		] call BIS_fnc_guiMessage;
if(_action) then {
//Add ammo types
if (typeOf(_vehicle) isEqualTo "O_MRAP_02_hmg_F") then {
_vehicle setVehicleAmmoDef 1;
_vehicle setVehicleAmmo 0;
_vehicle addMagazineTurret ["200Rnd_127x99_mag_Tracer_Green",[0]];
_vehicle addMagazineTurret ["200Rnd_127x99_mag_Tracer_Green",[0]];
_vehicle setFuel 1;
	} else {
	if (typeOf(_vehicle) isEqualTo "I_G_Offroad_01_armed_F") then {
	_vehicle setVehicleAmmoDef 1;
	_vehicle setVehicleAmmo 0;
	_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
	_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
	_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
	_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
	_vehicle setFuel 1;
		} else {
	if (typeOf(_vehicle) isEqualTo "B_Plane_CAS_01_F") then {
	_vehicle setVehicleAmmoDef 1;
	_vehicle setVehicleAmmo 0;
	_vehicle addMagazineTurret ["1000Rnd_Gatling_30mm_Plane_CAS_01_F",[-1],300];
	_vehicle addMagazineTurret ["7Rnd_Rocket_04_HE_F",[-1],2];
	_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1],90];
	_vehicle addMagazineTurret ["4Rnd_Bomb_04_F",[-1],2];
	_vehicle setFuel 1;
		} else {
		if (typeOf(_vehicle) isEqualTo "O_Plane_CAS_02_F") then {
		_vehicle setVehicleAmmoDef 1;
		_vehicle setVehicleAmmo 0;
		_vehicle addMagazineTurret ["500Rnd_Cannon_30mm_Plane_CAS_02_F",[-1],200];
		_vehicle addMagazineTurret ["20Rnd_Rocket_03_HE_F",[-1],4];
		_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1],90];
		_vehicle addMagazineTurret ["2Rnd_Bomb_03_F",[-1],1];
		_vehicle setFuel 1;
		} else {
		if (typeOf(_vehicle) isEqualTo "I_Plane_Fighter_03_CAS_F") then {
		_vehicle setVehicleAmmoDef 1;
		_vehicle setVehicleAmmo 0;
		_vehicle addMagazineTurret ["300Rnd_20mm_shells",[-1],200];
		_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1],90];
		_vehicle addMagazineTurret ["2Rnd_GBU12_LGB_MI10",[-1],1];
		_vehicle setFuel 1;
		} else {
	    if (typeOf(_vehicle) isEqualTo "B_T_VTOL_01_armed_F") then {
	    _vehicle setVehicleAmmoDef 1;
        _vehicle setVehicleAmmo 0;
        _vehicle addMagazineTurret ["100Rnd_105mm_HEAT_MP",[1],10];
        _vehicle addMagazineTurret ["4000Rnd_20mm_Tracer_Red_shells",[1],100];
        _vehicle addMagazineTurret ["240Rnd_40mm_GPR_Tracer_Red_shells",[2],50];
        _vehicle addMagazineTurret ["160Rnd_40mm_APFSDS_Tracer_Red_shells",[2],50];
        _vehicle addMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1],90];
	    _vehicle setFuel 1;
		} else {
		if (typeOf(_vehicle) isEqualTo "O_APC_Wheeled_02_rcws_F") then {
		_vehicle setVehicleAmmoDef 1;
		_vehicle setVehicleAmmo 0;
		_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0],250];
		_vehicle addMagazineTurret ["96Rnd_40mm_G_belt",[0],10];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle setFuel 1;
		} else {
		if (typeOf(_vehicle) isEqualTo "I_APC_tracked_03_cannon_F") then {
		_vehicle setVehicleAmmoDef 1;
		_vehicle setVehicleAmmo 0;
		_vehicle addMagazineTurret ["140Rnd_30mm_MP_shells_Tracer_Yellow",[0],35];
		_vehicle addMagazineTurret ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[0],10];
		_vehicle addMagazineTurret ["1000Rnd_762x51_Belt_Yellow",[0],500];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle setFuel 1;
		} else {
		if (typeOf(_vehicle) isEqualTo "O_Heli_Attack_02_F") then {
		_vehicle setVehicleAmmoDef 1;
		_vehicle setVehicleAmmo 0;
		_vehicle addMagazineTurret ["192Rnd_CMFlare_Chaff_Magazine",[0],90];
		_vehicle addMagazineTurret ["250Rnd_30mm_HE_shells",[0],75];
		_vehicle setFuel 1;
		} else {
		if (typeOf(_vehicle) isEqualTo "O_Heli_Light_02_F") then {
		_vehicle setVehicleAmmoDef 1;
		_vehicle setVehicleAmmo 0;
		_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1],1000];
		_vehicle addMagazineTurret ["12Rnd_PG_missiles",[-1],6];
		_vehicle addMagazineTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1],90];
		_vehicle setFuel 1;
			} else {
			if (typeOf(_vehicle) isEqualTo "B_Heli_Light_01_armed_F") then {
			_vehicle setVehicleAmmoDef 1;
			_vehicle setVehicleAmmo 0;
			_vehicle addMagazineTurret ["5000Rnd_762x51_Belt",[-1],2500];
			_vehicle addMagazineTurret ["24Rnd_missiles",[-1],8];
			_vehicle setFuel 1;
			} else {
			hint "ERROR INFORM ADMIN";
};
};
};
};
};
};
};
};
};
};
};

//deducted money from bank account
BANK = BANK - _armamentcost;
[1] call SOCK_fnc_updatePartial;
hint format["Your %1 has been armed for: \n\n %2",_vehiclename,[_armamentcost] call life_fnc_numberText];
} else {
			hint"Why bother to click the button in the first place then if you don't want some armament?!";
};
} else {
hint "You are not in Rebelcamp, Donator port, Gang Hideouts or BlackMarket";
};
};







///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// COPS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

If(playerside isEqualTo west) then {
if (((getMarkerPos "armybase") distance player) < 80 || ((getMarkerPos "police_hq_5") distance player) < 100 || ((getMarkerPos "police_hq_1") distance player) < 110 || ((getMarkerPos "police_hq_3") distance player) < 90 || ((getMarkerPos "army_jet1") distance player) < 80 || ((getMarkerPos "swat_spawn") distance player) < 40 || ((getMarkerPos "ChekpointAlpha") distance player) < 40 || ((getMarkerPos "police_hq_2") distance player) < 60 || ((getMarkerPos "Boat_cop") distance player) < 50) then {

//Defining
if (typeOf(_vehicle) isEqualTo "I_Plane_Fighter_03_CAS_F") then {
_vehiclename = "A-143 Buzzard";
_armamentcost = 150000;
	} else {
	if (typeOf(_vehicle) isEqualTo "B_Plane_CAS_01_F") then {
	_vehiclename = "A-164 Wipeout";
	_armamentcost = 150000;
		} else {
		if (typeOf(_vehicle) isEqualTo "O_Plane_CAS_02_F") then {
		_vehiclename = "To-199 Neophron";
		_armamentcost = 150000;
			} else {
			if (typeOf(_vehicle) isEqualTo "B_Heli_Light_01_armed_F") then {
			_vehiclename = "AH-9 Pawnee";
			_armamentcost = 75000;
				} else {
				if (typeOf(_vehicle) isEqualTo "I_Heli_light_03_F") then {
				_vehiclename = "WY-55 Hellcat";
				_armamentcost = 100000;
						} else {
						if (typeOf(_vehicle) isEqualTo "B_G_Offroad_01_armed_F") then {
						_vehiclename = "Offroad (Armed)";
						_armamentcost = 25000;
										} else {
										if (typeOf(_vehicle) isEqualTo "B_APC_Tracked_01_AA_F") then {
										_vehiclename = "Cheetah Anti-Air";
										_armamentcost = 75000;
											} else {
											if (typeOf(_vehicle) isEqualTo "I_MRAP_03_hmg_F") then {
											_vehiclename = "Armed SWAT Strider";
											_armamentcost = 25000;
												} else {
												if (typeOf(_vehicle) isEqualTo "O_APC_Wheeled_02_rcws_F") then {
												_vehiclename = "Madrid";
												_armamentcost = 70000;
													} else {
													if (typeOf(_vehicle) isEqualTo "B_Boat_Armed_01_minigun_F") then {
													_vehiclename = "Armed Mini Gun Boat";
													_armamentcost = 75000;
													} else {
														if (typeOf(_vehicle) isEqualTo "B_MRAP_01_hmg_F") then {
														_vehiclename = "Hunter HMG";
														_armamentcost = 25000;
														} else {
														if (typeOf(_vehicle) isEqualTo "O_T_LSV_02_armed_black_F") then {
														_vehiclename = "Quillin";
														_armamentcost = 25000;
														} else {
														if (typeOf(_vehicle) isEqualTo "B_APC_Wheeled_01_cannon_F") then {
														_vehiclename = "AMV-7 Marshall";
														_armamentcost = 100000;
														} else {
														if ((typeOf(_vehicle) isEqualTo "B_Heli_Transport_01_camo_F") || (typeOf(_vehicle) isEqualTo "B_CTRG_Heli_Transport_01_sand")) then {
														_vehiclename = "SWAT GhostHawk";
														_armamentcost = 35000;
															} else {
																_vehiclename = "#ERROR# Alert Admin";
																_armamentcost = 0;
																};					
				};
				};
				};
			};	
			};
		};	
	};
};
};
};
};
};
};


// Money check
if(BANK < _armamentcost) exitWith {hint format[localize "STR_House_NotEnough"];};


// Dialog opening
_action = [
			format["Armament will cost you $%2 taken from your bank account!
			<br/><t color='#ff0000'>Would you like to rearm %1!</t>",_vehiclename,[_armamentcost] call life_fnc_numberText],
			"Armament Service - Outlawed Veterans",
			"ARM it!",
			"No."
		] call BIS_fnc_guiMessage;
if(_action) then {
//Add ammo types
if (typeOf(_vehicle) isEqualTo "I_Heli_light_03_F") then {
_vehicle setVehicleAmmoDef 1;
_vehicle setVehicleAmmo 0;
_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1],3000];
_vehicle addMagazineTurret ["24Rnd_missiles",[-1],8];
_vehicle addMagazineTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1],90];
_vehicle setFuel 1;
			} else {
			if (typeOf(_vehicle) isEqualTo "B_Heli_Light_01_armed_F") then {
			_vehicle setVehicleAmmoDef 1;
			_vehicle setVehicleAmmo 0;
			_vehicle addMagazineTurret ["5000Rnd_762x51_Belt",[-1],1250];
			_vehicle addMagazineTurret ["24Rnd_missiles",[-1],6];
			_vehicle setFuel 1;
				} else {
				if (typeOf(_vehicle) isEqualTo "O_APC_Wheeled_02_rcws_F") then {
				_vehicle setVehicleAmmoDef 1;
				_vehicle setVehicleAmmo 0;
				_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0],400];
				_vehicle addMagazineTurret ["96Rnd_40mm_G_belt",[0],16];
				_vehicle addMagazineTurret ["SmokeLauncherMag",[0],1];
				_vehicle setFuel 1;
					} else {
					if (typeOf(_vehicle) isEqualTo "I_Plane_Fighter_03_CAS_F") then {
					_vehicle setVehicleAmmoDef 1;
					_vehicle setVehicleAmmo 0;
					_vehicle addMagazineTurret ["300Rnd_20mm_shells",[-1],200];
					_vehicle addMagazineTurret ["2Rnd_LG_scalpel",[-1],1];
					_vehicle addMagazineTurret ["2Rnd_AAA_missiles",[-1],2];
					_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1],90];
					_vehicle setFuel 1;
							} else {
							if (typeOf(_vehicle) isEqualTo "B_G_Offroad_01_armed_F") then {
							_vehicle setVehicleAmmoDef 1;
							_vehicle removeMagazinesTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
							_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
							_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
							_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
							_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
							_vehicle setFuel 1;
								} else {
								if (typeOf(_vehicle) isEqualTo "I_MRAP_03_hmg_F") then {
								_vehicle setVehicleAmmoDef 1;
								_vehicle setVehicleAmmo 0;
								_vehicle addMagazineTurret ["200Rnd_127x99_mag_Tracer_Yellow",[0],200];
								_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
								_vehicle setFuel 1;
									} else {
								if (typeOf(_vehicle) isEqualTo "B_Boat_Armed_01_minigun_F") then {
								_vehicle setVehicleAmmoDef 1;
								_vehicle setVehicleAmmo 0;
								_vehicle addMagazineTurret ["2000Rnd_65x39_belt_Tracer_Red",[1],1250];
								_vehicle addMagazineTurret ["200Rnd_40mm_G_belt",[0],25];
								_vehicle addMagazineTurret ["SmokeLauncherMag_boat",[-1],5];
								_vehicle setFuel 1;
									} else {
										if (typeOf(_vehicle) isEqualTo "B_APC_Tracked_01_AA_F") then {
										_vehicle setVehicleAmmoDef 1;
										_vehicle setVehicleAmmo 0;
										_vehicle addMagazineTurret ["680Rnd_35mm_AA_shells_Tracer_Red",[0],300];
										_vehicle addMagazineTurret ["4Rnd_Titan_long_missiles",[0],6];
										_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
										_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
										_vehicle setFuel 1;
										} else {
										if (typeOf(_vehicle) isEqualTo "B_MRAP_01_hmg_F") then {
										_vehicle setVehicleAmmoDef 1;
										_vehicle setVehicleAmmo 0;
										_vehicle addMagazineTurret ["200Rnd_127x99_mag_Tracer_Red",[0],300];
										_vehicle setFuel 1;
										} else {
										if (typeOf(_vehicle) isEqualTo "B_APC_Wheeled_01_cannon_F") then {
										_vehicle setVehicleAmmoDef 1;
										_vehicle setVehicleAmmo 0;
										_vehicle addMagazineTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0],10];
										_vehicle addMagazineTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0],20];
										_vehicle addMagazineTurret ["2000Rnd_65x39_belt",[0],1000];
										_vehicle setFuel 1;
										} else {
										if (typeOf(_vehicle) isEqualTo "O_T_LSV_02_armed_black_F") then {
										_vehicle setVehicleAmmoDef 1;
										_vehicle setVehicleAmmo 0;
										_vehicle addMagazineTurret ["500Rnd_65x39_Belt_Tracer_Green_Splash",[0],500];
										_vehicle setFuel 1;
										} else {
										if (typeOf(_vehicle) isEqualTo "B_Heli_Transport_01_camo_F") then {
										_vehicle setVehicleAmmoDef 1;
										_vehicle setVehicleAmmo 0;
										_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1],500];
										_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2],500];
										_vehicle addMagazineTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1],90];
										_vehicle setFuel 1;
										} else {
										hint "ERROR INFORM ADMIN";
			};
			};
		};
	};
};
};
};
};
};
};
};
};

//deducted money from bank account
BANK = BANK - _armamentcost;
[1] call SOCK_fnc_updatePartial;
hint format["Your %1 has been armed for: \n\n %2",_vehiclename,[_armamentcost] call life_fnc_numberText];
} else {
hint"Why bother to click the button in the first place then if you don't want some armament?!";
};
} else {
 hint "You are not in the Army base or any Police HQ!";
};
};




