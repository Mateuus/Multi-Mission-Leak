#include <macro.h>
/*
	File: fn_adminBan.sqf
	Author: CooliMC "Marc"
	
	Description:
	BAN GUID/PLAYERS
	YOU ARE NOT ALLOWED TO STEEL IT !!!!
*/
private["_type","_vars","_data"];

_type = [_this,0,-1] call BIS_fnc_param;

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

if(_type != -1) then
{
	switch(_type) do
	{
		//Open Menu From Main Selected
		case 0:
		{
			_vars = (call compile format["%1", lbData[2902,lbCurSel (2902)]]);

			life_searchGUIDs = "";
			life_waitforGUIDs = true;
			[player, 1, getPlayerUID _vars] remoteExec ["TEX_FNC_AdminBan", 2];
			
			[] spawn 
			{
				waitUntil {!life_waitforGUIDs};
				
				createDialog "life_admin_ban";
				_data = (life_searchGUIDs select 0);
				
				ctrlSetText [36051, (_data select 2)];
				ctrlSetText [35054, parseText format["Name: %1<br/>PlayerID: %2", (_data select 0), (_data select 1)]];
				
				[player, (call compile format["%1", (_data select 1)]), 3, "[ADMIN-Menu]", "Hat den Spieler zum Bannen ausgewählt"] remoteExec ["TEX_FNC_LOGIT", 2];
			};
		};
		
		//Open Menu From Search Selected
		case 1:
		{
			_vars = (call compile format["%1", lbData[35051,lbCurSel (35051)]]);

			createDialog "life_admin_ban";
			ctrlSetText [36051, (_vars select 2)];
			ctrlSetText [35054, parseText format["Name: %1<br/>PlayerID: %2", (_vars select 0), (_vars select 1)]];
			
			[player, (call compile format["%1", (_vars select 1)]), 3, "[ADMIN-Menu]", "Hat den Spieler zum Bannen ausgewählt"] remoteExec ["TEX_FNC_LOGIT", 2];
		};
		
		case 2:
		{
			createDialog "life_admin_ban";
			ctrlSetText [35054, "Bitte alle Felder ausfüllen !!!"];
			[player, objNull, 1, "[ADMIN-Menu]", "Hat das BanMenü geöffnet"] remoteExec ["TEX_FNC_LOGIT", 2];
		};
		
		case 3:
		{
			_vars = format["%1 %2 %3", ctrlText 36051, ctrlText 35052, ctrlText 35053];
			[player, 2, _vars] remoteExec ["TEX_FNC_AdminBan", 2];
			closeDialog 36050;
		};
	};
};