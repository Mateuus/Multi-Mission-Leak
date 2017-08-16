/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_filter", "_return" ];
_filter = [ _this, 0, 0, [0] ] call GTA_fnc_param;
_return = [];

//Shop Title Name
ctrlSetText [ 3103, "HATO Clothing" ];


switch _filter do {

	//--- Uniforms
	case 0:	{

		_return pushBack [ "U_B_CombatUniform_mcam", "HATO Overall", 0 ];
		_return pushBack [ "U_B_CombatUniform_mcam_vest", "HATO Overall (Rolled-up)", 0 ];

	};

	//--- Headgear
	case 1: {

		_return pushBack [ "H_Cap_headphones", nil, 0 ];

	};

	//--- Glasses
	case 2:	{

		_return pushBack [ "G_Tactical_Clear", nil, 0 ];
		_return pushBack [ "G_Spectacles_Tinted", nil, 0 ];
		_return pushBack [ "G_Aviator", nil, 0 ];
		_return pushBack [ "G_Shades_Green", nil, 0 ];
		_return pushBack [ "G_Shades_Blue", nil, 0 ];
		_return pushBack [ "G_Shades_Black", nil, 0 ];
		_return pushBack [ "G_Shades_Red", nil, 0 ];

	};

	//--- Vest
	case 3:	{

		_return pushBack [ "V_Rangemaster_belt", nil, 0 ];

	};

	//--- Backpacks
	case 4: {

		_return pushBack [ "B_Carryall_khk", nil, 0 ];

	};
};

_return
