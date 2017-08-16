/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_filter", "_milRank", "_return" ];
_filter = [ _this, 0, 0, [0] ] call GTA_fnc_param;
_milRank = "GTA_milRank" call GTA_fnc_const;
_return = [];

//---Shop Title Name
ctrlSetText [ 3103, "NATO Clothing" ];


switch _filter do {

	//--- Uniforms
	case 0:	{

		_return pushBack [ "U_B_HeliPilotCoveralls", nil, 0 ];
		_return pushBack [ "U_B_PilotCoveralls", nil, 0 ];

	};

	//--- Headgear
	case 1: {

		_return pushBack [ "H_PilotHelmetHeli_B", nil, 0 ];
		_return pushBack [ "H_CrewHelmetHeli_B", nil, 0 ];
		_return pushBack [ "H_PilotHelmetFighter_B", nil, 0 ];

	};

	//--- Glasses
	case 2:	{

		_return pushBack [ "G_Combat", nil, 0 ];
		_return pushBack [ "G_Lowprofile", nil, 0 ];
		_return pushBack [ "G_Tactical_Clear", nil, 0 ];
		_return pushBack [ "G_Tactical_Black", nil, 0 ];
		_return pushBack [ "G_Spectacles_Tinted", nil, 0 ];
		_return pushBack [ "G_Diving", nil, 0 ];

	};

	//--- Vest
	case 3:	{

		_return pushBack [ "V_TacVest_blk", nil, 0 ];

	};

	//--- Backpacks
	case 4: {

		_return pushBack [ "B_parachute", nil, 0 ];

	};
};

_return
