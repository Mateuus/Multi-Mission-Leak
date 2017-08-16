/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Init.sqf

Description:
Run all the server loops
*/
["RPP_Server_Bank_Loop_Start", {
	[] spawn {
		waitUntil {!RPP_isBankBehingRobbed};
		[] call RPP_Server_Bank_Loop;
	};
}] call RPP_Function;
publicVariable "RPP_Server_Bank_Loop_Start";

["RPP_Server_Cleaner_Bodys", {
	if (isServer) then {
		[] spawn {
			while {true} do {
				sleep 5;
				{
					if (_x isKindOf "Man") then {
						_remove = _x getVariable "RPP_Corpse_Player";
						if (_remove) exitWith {};
						deleteVehicle _x;
					};
				} forEach allDead;
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Server_Cleaner_Bodys";

["RPP_Server_Cleaner_Objects", {
	[] spawn {
		while {true} do

		{
			_msg = "::SERVER CLEANER:: Server Cleaner Will start in 10 Minutes";
			[_msg] call RPP_Message_Global;

			sleep (5 * 60); //sleep for 5 minutes

			_msg = "::SERVER CLEANER:: Server Cleaner Will start in 5 Minutes";
			[_msg] call RPP_Message_Global;

			sleep (5 * 60); //sleep for 5 minutes

			_msg = "::SERVER CLEANER:: Server Cleaner started.";
			[_msg] call RPP_Message_Global;

			sleep 0.5;
			{
				if(!alive _x) then
				{
					deleteVehicle _x;
				};
			} foreach allMissionObjects "LandVehicle";

			{
				if (_x isKindOf "Man") then {
					deleteVehicle _x;
				};
			} forEach allDead;

			{
				if(!alive _x) then
				{
					deleteVehicle _x;
				};
			} foreach allMissionObjects "Air";

			_msg = "::SERVER CLEANER:: Server Cleaner Finished";
			[_msg] call RPP_Message_Global;
			
			sleep 30;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Server_Cleaner_Objects";

["RPP_Goverment_PickGovernor", {
	[] spawn {
		if (!(isServer)) exitWith {};
		while {true} do {
			sleep 10;
			sleep (10 * 60);

			_msg = "::GOVERMENT:: The next Governor will be picked in 15 Min Make sure you vote!";
			[_msg] call RPP_Message_Global;

			sleep (5 * 60);

			_msg = "::GOVERMENT:: The next Governor will be picked in 10 Min Make sure you vote!";
			[_msg] call RPP_Message_Global;

			sleep (5 * 60);

			_msg = "::GOVERMENT:: The next Governor will be picked in 5 Min Make sure you vote!";
			[_msg] call RPP_Message_Global;

			sleep (4 * 60);

			_msg = "::GOVERMENT:: The next Governor will be picked in 1 Min Make sure you vote!";
			[_msg] call RPP_Message_Global;

			sleep 1;

			_msg = "::GOVERMENT:: The next Governor will be picked in 10 Seconds!";
			[_msg] call RPP_Message_Global;

			sleep 1;

			{
				_name = _x;
				_Amount = 0;
				if (_name == _x) then {
					{
						if (_name == name _X) exitWith {
							_uid = getPlayerUID _x;
							_player = _x;
							RPP_Governors = RPP_Governors + [[_name,_uid,_player]];
						};
					} count playableUnits;
					publicVariable "RPP_Governors";
				};
			} foreach RPP_Governor_VottingLog;

			_Array = [];

			{
				_Votes = _x getVariable "RPP_GovernorVotes";
				_Array = _Array + [_Votes];
			} foreach playableUnits;
			_getWinner = _Array call BIS_fnc_greatestNum;

			if (_getWinner <= 0) then {
				if (RPP_Governors_Name isEqualTo "") then {
					_msg = "No one was voted for Governor!";
					[_msg] call RPP_Message_Global;
				} else {
					_msg = format ["%1 is still the Governor",RPP_Governors_Name];
					[_msg] call RPP_Message_Global;
				};
			} else {

				_Winner_Name = "";
				_Winner = "";
				_Winner_UID = "";
				{
					_Votes = _x getVariable "RPP_GovernorVotes";
					if (_Votes isEqualTo _getWinner) exitWith {
						_Winner_Name = name _x;
						_Winner = _x;
						_Winner_UID = getPlayerUID _x;
						[[], "RPP_Goverment_Winner",_Winner] call BIS_FNC_MP;
					};
				} foreach playableUnits;

				if (RPP_Governors_Name == _Winner_Name) then {
					_msg = format ["%1 is still the Governor",_Winner_Name];
					[_msg] call RPP_Message_Global;
				} else {
					_msg = format ["Our new Governor is: %1",_Winner_Name];
					[_msg] call RPP_Message_Global;
				};

				RPP_Governors_Name = _Winner_Name;
				RPP_Governors_UID = _Winner_UID;
				publicVariable "RPP_Governors_Name";
				publicVariable "RPP_Governors_UID";
			};

			RPP_Governor_Votes = 0;
			RPP_Governor_VottingLog = [];
			RPP_Governors = [];
			RPP_Governors_TotalVotes = 0;
			RPP_Governor_CanVote = true;
			publicVariable "RPP_Governor_CanVote";
			publicVariable "RPP_Governors_TotalVotes";
			publicVariable "RPP_Governors";
			publicVariable "RPP_Governor_VottingLog";
			publicVariable "RPP_Governor_Votes";

			{
				_x setVariable ["RPP_GovernorVotes",RPP_Governor_Votes,true];
			} foreach playableUnits;

			sleep (5 * 60);
			_msg = "::GOVERMENT:: New election is already started make sure you vote for your Governor! 30 min until next Governor will be picked";
			[_msg] call RPP_Message_Global;
			sleep (5 * 60);
		};
	};
}] call RPP_Function;
publicVariable "RPP_Goverment_PickGovernor";


[] call RPP_Server_Cleaner_Bodys;

[] call RPP_Server_Cleaner_Objects;

[] call RPP_Goverment_PickGovernor;