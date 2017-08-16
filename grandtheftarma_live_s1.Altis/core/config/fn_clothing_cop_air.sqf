/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_filter", "_copRank", "_return" ];
_filter = [ _this, 0, 0, [0] ] call GTA_fnc_param;
_copRank = "GTA_copRank" call GTA_fnc_const;
_return = [];

//---Shop Title Name
ctrlSetText [ 3103, "NPAS Clothing" ];


switch _filter do {

	//--- Uniforms
	case 0:	{

		if (["GTA_copRank"] call GTA_fnc_const >= 3 && {license_cop_npas}) then {

			_return pushBack [ "U_I_HeliPilotCoveralls", nil, 0 ];

		};

	};

	//--- Headgear
	case 1: {

		if (["GTA_copRank"] call GTA_fnc_const >= 3 && {license_cop_npas}) then {

			_return pushBack [ "H_PilotHelmetHeli_B", nil, 0 ];

		};

	};

	//--- Glasses
	case 2:	{

	};

	//--- Vest
	case 3:	{

		if (["GTA_copRank"] call GTA_fnc_const >= 3 && {license_cop_npas}) then {

			_return pushBack [ "V_TacVest_blk_POLICE", nil, 0 ];

		};

	};

	//--- Backpacks
	case 4: {

		if (["GTA_copRank"] call GTA_fnc_const >= 1 && {license_cop_npas}) then {
			
			_return pushBack [ "B_parachute", nil, 0 ];		
			
		};
	
		if (["GTA_copRank"] call GTA_fnc_const >= 3 && {!license_cop_npas}) then {
			
			_return pushBack [ "B_parachute", nil, 0 ];
			
		};

	};
	
};

_return
