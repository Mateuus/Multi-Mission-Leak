/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_filter", "_medRank", "_return" ];
_filter = [ _this, 0, 0, [0] ] call GTA_fnc_param;
_medRank = "GTA_medRank" call GTA_fnc_const;
_return = [];

//--- Shop Title Name
ctrlSetText [ 3103, "NHS Clothing" ];

switch _filter do {

	//--- Uniforms
	case 0:	{

		_return pushBack [ "U_B_CombatUniform_mcam", "NHS Overall", 0 ];

		if ( _medRank >= 2 ) then {

			_return pushBack [ "U_B_CombatUniform_mcam_vest", "NHS Overall (Rolled-up)", 0 ];

		};

		if ( _medRank >= 3 ) then {

			_return pushBack [ "U_I_Wetsuit", "NHS Wetsuit", 0 ];

		};

		if ( _medRank >= 4 ) then {

			_return pushBack [ "U_I_PilotCoveralls", "NHS Pilot Coveralls", 0 ];

		};

	};

	//--- Hats
	case 1: {

		_return pushBack [ "H_Cap_blu", nil, 0 ];
		_return pushBack [ "H_Watchcap_sgg", nil, 0 ];
		_return pushBack [ "H_Cap_marshal", nil, 0 ];
		_return pushBack [ "H_Bandanna_sgg", nil, 0 ];

		if ( _medRank >= 4 ) then {

			_return pushBack [ "H_PilotHelmetHeli_B", nil, 0 ];

		};

	};

	//--- Glasses
	case 2: {

		_return pushBack [ "G_Shades_Black", nil, 0 ];
		_return pushBack [ "G_Shades_Blue", nil, 0 ];
		_return pushBack [ "G_Sport_Blackred", nil, 0 ];
		_return pushBack [ "G_Sport_Checkered", nil, 0 ];
		_return pushBack [ "G_Sport_Blackyellow", nil, 0 ];
		_return pushBack [ "G_Sport_BlackWhite", nil, 0 ];
		_return pushBack [ "G_Squares", nil, 0 ];
		_return pushBack [ "G_Aviator", nil, 0 ];
		_return pushBack [ "G_Lady_Mirror", nil, 0 ];
		_return pushBack [ "G_Lady_Dark", nil, 0 ];
		_return pushBack [ "G_Lady_Blue", nil, 0 ];
		_return pushBack [ "G_Lowprofile", nil, 0 ];
		_return pushBack [ "G_Combat", nil, 0 ];

		if ( _medRank >= 3 ) then {

			_return pushBack [ "G_Diving", nil, 0 ];

		};

	};

	//--- Vest
	case 3: {

		if ( _medRank >= 3 ) then {

			_return pushBack [ "V_RebreatherIA", nil, 0 ];

		};

	};

	//--- Backpacks
	case 4: {

		_return pushBack [ "B_Carryall_khk", nil, 0 ];

		if ( _medRank >= 3 ) then {

			_return pushBack [ "B_Parachute", nil, 0 ];

		};

	};

};

_return
