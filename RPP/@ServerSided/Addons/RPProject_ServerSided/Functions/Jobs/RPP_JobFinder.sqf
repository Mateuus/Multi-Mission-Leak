/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_JobFinder.sqf

Description:
Help players finde the right job
*/
["RPP_JobFinder_Dialog",{
	createDialog "RPP_JobFinder_Menu";
	buttonSetAction [1600, "[] call RPP_JobFinder_ViewInfo;"];
	buttonSetAction [1601, "[] call RPP_JobFinder_TakeJob;"];

	{
		_text = _x select 0;
		lbAdd [1500, format ["%1",_text]];
	} foreach RPP_JobFinder_Array;
}] call RPP_Function;
publicVariable "RPP_JobFinder_Dialog";

["RPP_JobFinder_ViewInfo", {
	private ["_Array","_job","_info"];
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = "Please Select a job to view info on first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_Array = RPP_JobFinder_Array select (lbCurSel 1500);
	_job = _Array select 0;
	_info = _Array select 3;

	if (_info isEqualTo "") exitWith {
		_msg = "There is no info to view on this job.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_msg = format ["%1 Here is some info about %2 <br /> <br /> %3",name player,_job,_info];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_JobFinder_ViewInfo";

["RPP_JobFinder_TakeJob", {
	private ["_Array","_job","_canTake","_call"];
	if (lbCurSel 1500 == -1) exitWith {
		_msg = "Please Select a job first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_Array = RPP_JobFinder_Array select (lbCurSel 1500);
	_job = _Array select 0;
	_canTake = _Array select 1;
	_call = _Array select 2;

	if (!(_canTake)) exitWith {
		_msg = "You may not take this job here, Click view info for more informasion.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	call compile format ["[] call %1",_call];
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_JobFinder_TakeJob";