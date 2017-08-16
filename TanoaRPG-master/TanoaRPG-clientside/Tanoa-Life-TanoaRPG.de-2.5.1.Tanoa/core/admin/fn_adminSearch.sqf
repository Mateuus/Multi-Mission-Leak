#include <macro.h>
/*
	File: fn_adminSearch.sqf
	Author: CooliMC "Marc"
	
	Description:
	Search for Name/PID/GUID
	YOU ARE NOT ALLOWED TO STEEL IT !!!!
*/
private["_type","_pid","_guid","_name","_tempvar"];
_type = [_this,0,-1] call BIS_fnc_param;

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

if(_type != -1) then
{
	switch(_type) do
	{
		//SearchPID
		case 0:
		{
			life_searchGUIDs = [];
			life_waitforGUIDs = true;
			_pid = (ctrlText 35055);
			[player, 1, _pid] remoteExec ["TEX_FNC_AdminBan", 2];
			
			lbAdd [35051, "Querying ..."];
			{ ctrlSetText [_x, "Querying ..."]; } foreach [35052, 35053, 35054];
			[] spawn {
				waitUntil{!life_waitforGUIDs};
				
				lbClear 35051;
				{
					lbAdd [35051, (_x select 0)];
					lbSetData [35051, ((lbSize 35051) - 1), str(_x)];
				} foreach life_searchGUIDs;
				
				if((count life_searchGUIDs) == 0) then {lbAdd [35051, "Kein Ergebnis"];};
				{ ctrlSetText [_x, "Select Player"]; } foreach [35052, 35053, 35054];
			};
		};
		
		//SearchGUID
		case 1:
		{
			life_searchGUIDs = [];
			life_waitforGUIDs = true;
			_guid = (ctrlText 35055);
			[player, 3, _guid] remoteExec ["TEX_FNC_AdminBan", 2];
			
			lbAdd [35051, "Querying ..."];
			{ ctrlSetText [_x, "Querying ..."]; } foreach [35052, 35053, 35054];
			[] spawn {
				waitUntil{!life_waitforGUIDs};
				
				lbClear 35051;
				{
					lbAdd [35051, (_x select 0)];
					lbSetData [35051, ((lbSize 35051) - 1), str(_x)];
				} foreach life_searchGUIDs;
				
				if((count life_searchGUIDs) == 0) then {lbAdd [35051, "Kein Ergebnis"];};
				{ ctrlSetText [_x, "Select Player"]; } foreach [35052, 35053, 35054];
			};
		};
		
		//SearchName
		case 2:
		{
			life_searchGUIDs = [];
			life_waitforGUIDs = true;
			_name = (ctrlText 35055);
			[player, 4, _name] remoteExec ["TEX_FNC_AdminBan", 2];
			
			lbAdd [35051, "Querying ..."];
			{ ctrlSetText [_x, "Querying ..."]; } foreach [35052, 35053, 35054];
			[] spawn {
				waitUntil{!life_waitforGUIDs};
				
				lbClear 35051;
				{
					lbAdd [35051, (_x select 0)];
					lbSetData [35051, ((lbSize 35051) - 1), str(_x)];
				} foreach life_searchGUIDs;
				
				if((count life_searchGUIDs) == 0) then {lbAdd [35051, "Kein Ergebnis"];};
				{ ctrlSetText [_x, "Select Player"]; } foreach [35052, 35053, 35054];
			};
		};
		
		//LB Selected
		case 3:
		{
			_tempvar = lbData [35051, lbCurSel 35051];
			_tempvar = call compile format["%1", _tempvar];
			
			if((count _tempvar) > 0) then
			{
				ctrlSetText [35052, (_tempvar select 1)];
				ctrlSetText [35053, (_tempvar select 2)];
				ctrlSetText [35054, (_tempvar select 0)];
			};
		};
	};
};