/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_PlayerInteracting.sqf

Description:
Interact with other players
*/
["RPP_Interacting_Commands", {
	RPP_Civ_Interacting =
	[
		['Rob Player','RPP_Civilian_Rob'],
		['Cablecuff Player','RPP_Civilian_CabelCuff'],
		['Drag/UnDrag Player','RPP_Civilian_Drag'],
		['Ask For Name','RPP_Civilian_AskforName']
	];
	publicVariable 'RPP_Civ_Interacting';

	RPP_Cop_Interacting = 
	[
		['Handcuff/UnHandcuff','RPP_Police_Handcuff'],
		['Legcuff/UnLegcuff','RPP_Police_LegCuff'],
		['Ticket Menu','RPP_Police_Ticket'],
		['Drag/UnDrag Player','RPP_Police_Drag'],
		['Licenses','RPP_Police_CheckLic'],
		['Ask for ID','RPP_Police_AskforName'],
		['Remove all weapons','RPP_Police_RemoveWeapons'],
		['Search Player','RPP_Police_Search'],
		['Jail','RPP_Police_JailMenu'],
		['Place in Vehicle','RPP_Police_Place'],
		['Pull out','RPP_Police_Pullout']
	];
	publicVariable 'RPP_Cop_Interacting';

	RPP_EMT_Interacting = 
	[
		['Revive Menu','RPP_EMT_CreateDialog'],
		['Drag/UnDrag Player','RPP_EMT_Drag'],
		['Place in vehicle','RPP_Police_Place'],
		['Pull out','RPP_Police_Pullout']
	];
	publicVariable 'RPP_EMT_Interacting';
}] call RPP_Function;
publicVariable 'RPP_Interacting_Commands';

[] call RPP_Interacting_Commands;

["RPP_Interacting_Dialog", {
	private ['_p'];
	_P = cursorTarget;
	if (player distance _p > 15) exitWith {};
	if(isNull _P) exitWith {};
	createDialog 'RPP_PlayerInteractingMenu';
	buttonSetAction [1600, '[] call RPP_Interacting_Use;'];

	if (RPP_isCiv) then {
		{
			lbAdd [1500, format ['%1',_x select 0]];
		} foreach RPP_Civ_Interacting;
	};
	if (RPP_isCop) then {
		{
			lbAdd [1500, format ['%1',_x select 0]];
		} foreach RPP_Cop_Interacting;
	};
	if (RPP_isEMT) then {
		{
			lbAdd [1500, format ['%1',_x select 0]];
		} foreach RPP_EMT_Interacting;
	};
}] call RPP_Function;
publicVariable 'RPP_Interacting_Dialog';

["RPP_Interacting_Use", {
	private ['_Array','_call'];
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = 'Please select a command.';
		_Color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	closeDialog 1;
	
	if (RPP_isCiv) exitWith {
		_Array = RPP_Civ_Interacting select (lbCurSel 1500);
		_call = _Array select 1;

		call compile format ['[] call %1;',_call];
		closeDialog 1;
	};
	if (RPP_isCop) exitWith {
		_Array = RPP_Cop_Interacting select (lbCurSel 1500);
		_call = _Array select 1;

		call compile format ['[] call %1;',_call];
	};
	if (RPP_isEMT) exitWith {
		_Array = RPP_EMT_Interacting select (lbCurSel 1500);
		_call = _Array select 1;

		closeDialog 1;
		call compile format ['[] call %1;',_call];
	};
}] call RPP_Function;
publicVariable 'RPP_Interacting_Use';