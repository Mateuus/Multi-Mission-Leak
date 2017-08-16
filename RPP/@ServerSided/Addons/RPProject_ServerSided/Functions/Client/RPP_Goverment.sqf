/*
Script File Author: Lifeman
Script File Mod: Life Server
Script File: RPP_Goverment.sqf

Description:
Vote for governor,edit prices ect
*/
["RPP_Goverment_MainMenu", {
	createDialog "RPP_Vote_Governor";
	disableSerialization;
	buttonSetAction [1600, "[] call RPP_Goverment_LawsMenu;"];
	buttonSetAction [1601, "[] call RPP_Goverment_BodyMenu;"];
	buttonSetAction [1603, "[] call RPP_Goverment_Vote;"];

	_text = uiNameSpace getVariable ["RPP_Vote_Governor",displayNull];
	_Governor = _text displayCtrl 1000;

	if (!(RPP_Governors_Name isEqualTo "")) then {
		_Governor ctrlSetText format["Current Governor: %1",RPP_Governors_Name];
	} else {
		_Governor ctrlSetText "There is currenly no Governor";
	};

	{
		if (side _x == civilian) then {
			_uid = getPlayerUID _x;
			_name = name _x;
			_data = lbAdd [2100, format ["%1",_name]];
			lbSetData [2100,_data,_uid];
		};
	} foreach playableUnits;

	lbAdd [1500, "=== Governor Votting logs ==="];
	lbAdd [1500, ""];

	_PreGovernor_Amount = 0;
	{
		_PreGovernor = _x;
		lbAdd [1500, format ["Someone voted %1 for Governor",_PreGovernor]];
	} foreach RPP_Governor_VottingLog;
}] call RPP_Function;
publicVariable "RPP_Goverment_MainMenu";

["RPP_Goverment_BodyMenu", {
	closeDialog 1;
	createDialog "RPP_BodyGuards_Governor";
	buttonSetAction [1600, "[] call RPP_Goverment_Hire;"];
	buttonSetAction [1601, "[] call RPP_Goverment_Fire;"];

	{
		_data1 = lbAdd [2100, format ["%1",name _x]];
		lbSetData [2100,_data1,name _x];
	} foreach playableUnits;
	{
		_data2 = lbAdd [1500, format ["%1",_x]];
		lbSetData [1500,_data2,_x];
	} foreach RPP_Governors_BodyGuards;
}] call RPP_Function;
publicVariable "RPP_Goverment_BodyMenu";

["RPP_Goverment_Hire", {
	if (!(RPP_isGovernor)) exitWith {
		_msg = "Only the Governor is allowed to do this.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (lbCurSel 2100 isEqualTo -1) exitWith {
		_msg = "Please Select a player";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_selected = lbData [ 2100, ( lbCurSel 2100 ) ];

	if (_selected in RPP_Governors_BodyGuards) exitWith {
		_msg = format ["%1 is already your body guard",_selected];
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Governors_BodyGuards = RPP_Governors_BodyGuards + [_selected];

	_msg = format ["You hiered %1 as your body guard.",_selected];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	_msg = format ["The Governor just Hired %1 as his new Body guard",_selected];
	[_msg] call RPP_Message_Global;

	[] call RPP_Goverment_BodyMenu;
}] call RPP_Function;
publicVariable "RPP_Goverment_Hire";

["RPP_Goverment_Fire", {
	if (!(RPP_isGovernor)) exitWith {
		_msg = "Only the Governor is allowed to do this.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = "Please Select a Body guard";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_selected = lbData [ 1500, ( lbCurSel 1500 ) ];
	RPP_Governors_BodyGuards = RPP_Governors_BodyGuards - [_selected];

	_msg = format ["You Fiered %1 as your body guard.",_selected];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	_msg = format ["The Governor just Fiered %1 as a Body guard",_selected];
	[_msg] call RPP_Message_Global;

	[] call RPP_Goverment_BodyMenu;
}] call RPP_Function;
publicVariable "RPP_Goverment_Hire";

["RPP_Goverment_LawsMenu", {
	closeDialog 1;
	createDialog "RPP_Laws_Governor";
	buttonSetAction [1600, "[] call RPP_Goverment_AddLaw;"];
	buttonSetAction [1601, "[] call RPP_Goverment_DeleteLaw;"];
	buttonSetAction [1602, "[] call RPP_Goverment_EditLaw;"];

	{
		_data = lbAdd [1500, format ["%1",_x]];
		lbSetData [1500,_data,_x];
	} foreach RPP_Governor_Laws;
}] call RPP_Function;
publicVariable "RPP_Goverment_LawsMenu";

["RPP_Goverment_AddLaw", {
	private ["_law"];
	if (!(RPP_isGovernor)) exitWith {
		_msg = "Only the Governor is allowed to do this.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Law = ctrlText 1400;

	if (_Law isEqualTo "") exitWith {
		_msg = "Please type in a law first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Governor_Laws = RPP_Governor_Laws + [_law];
	publicVariable "RPP_Governor_Laws";

	_msg = format ["The Governor just added a new law: %1",_law];
	[_msg] call RPP_Message_Global;

	[] call RPP_Goverment_LawsMenu;
}] call RPP_Function;
publicVariable "RPP_Goverment_AddLaw";

["RPP_Goverment_DeleteLaw", {
	private ["_law"];
	if (!(RPP_isGovernor)) exitWith {
		_msg = "Only the Governor is allowed to do this.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_law = lbData [ 1500, ( lbCurSel 1500 ) ];

	if (_Law isEqualTo "") exitWith {
		_msg = "Please Select a law to delete.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Governor_Laws = RPP_Governor_Laws - [_law];
	publicVariable "RPP_Governor_Laws";

	_msg = format ["The Governor just removed a law: %1",_law];
	[_msg] call RPP_Message_Global;

	[] call RPP_Goverment_LawsMenu;
}] call RPP_Function;
publicVariable "RPP_Goverment_DeleteLaw";

["RPP_Goverment_SelectLaw", {
	private ["_law"];
	if (!(RPP_isGovernor)) exitWith {};
	_law_Selected = lbData [ 1500, ( lbCurSel 1500 ) ];
	ctrlSetText [1400, _law_Selected];
}] call RPP_Function;
publicVariable "RPP_Goverment_SelectLaw";

["RPP_Goverment_EditLaw", {
	private ["_law"];
	if (!(RPP_isGovernor)) exitWith {
		_msg = "Only the Governor is allowed to do this.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_law_Selected = lbData [ 1500, ( lbCurSel 1500 ) ];
	_law_edit = ctrlText 1400;
	if (_law_Selected isEqualTo "") exitWith {
		_msg = "Please Select a law to delete.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_law_edit isEqualTo "") exitWith {
		_msg = "You can't leave it empty";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	RPP_Governor_Laws = RPP_Governor_Laws - [_law_Selected];
	RPP_Governor_Laws = RPP_Governor_Laws + [_law_edit];
	publicVariable "RPP_Governor_Laws";

	_msg = format ["The Governor just Edited a law: %1 to %2",_law_Selected,_law_edit];
	[_msg] call RPP_Message_Global;

	[] call RPP_Goverment_LawsMenu;
}] call RPP_Function;
publicVariable "RPP_Goverment_EditLaw";

["RPP_Goverment_Winner", {
	_msg = "You are now the Governor.";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	RPP_isGovernor = true;
}] call RPP_Function;
publicVariable "RPP_Goverment_Winner";

["RPP_Goverment_VoteGet", {
	RPP_Governor_Votes = RPP_Governor_Votes + 1;
	player setVariable ["RPP_GovernorVotes",RPP_Governor_Votes,true];
}] call RPP_Function;
publicVariable "RPP_Goverment_VoteGet";

["RPP_Goverment_Vote", {
	[] spawn {
		private ["_data","_Governor_Name","_c"];
		if (lbCurSel 2100 isEqualTo "") exitWith {
			_msg = "Error 2100: Field Empty";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (!(RPP_Governor_CanVote)) exitWith {
			_msg = "You have already voted!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};

		_data = lbData [ 2100, ( lbCurSel 2100 ) ];

	/*	if (_data isEqualTo getPlayerUID player) exitWith {
			_msg = "You are not allowed to vote for your self as the Governor.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
*/
		_Governor_Name = "";
		_c = false;

		{
			if (_data isEqualTo getPlayerUID _x) exitWith {
				_Governor_Name = name _x;
				[[], "RPP_Goverment_VoteGet",_x] call BIS_FNC_MP;
				_c = true;
			};
		} count playableUnits;

		sleep 0.2;

		if (!(_c)) exitWith {
			_msg = "Error no player found.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};

		RPP_Governor_VottingLog = RPP_Governor_VottingLog + [_Governor_Name];
		publicVariable "RPP_Governor_VottingLog";

		_msg = format ["%1 You just voted for %2 to be the Governor",name player,_Governor_Name];
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		RPP_Governor_CanVote = false;

		closeDialog 1;
		[] call RPP_Goverment_MainMenu;
	};
}] call RPP_Function;
publicVariable "RPP_Goverment_Vote";