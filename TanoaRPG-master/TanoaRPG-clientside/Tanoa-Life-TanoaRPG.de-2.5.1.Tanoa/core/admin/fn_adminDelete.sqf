#include <macro.h>
/*
	File: fn_adminDelete.sqf
	Author: CooliMC "Marc"
	
	Description:
	Delete CursorTarget or Opens Denied/Accept Delete Dialog
*/
private["_menumode","_type"];

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};
_menumode = _this select 0;
if(_menumode == 0) then
{
	if(!isNull cursorTarget) then
	{
		life_adminToDeleteTarget = CursorTarget;
		[player, objNull, 1, "[ADMIN-Menu]", "Hat ein Ziel zum Löschen anvisiert und muss noch Bestätigen oder Ablehnen"] remoteExec ["TEX_FNC_LOGIT", 2];
		createDialog "life_admin_delete";
	} else {
		life_adminToDeleteTarget = objNull;
		hint 'Kein Ziel anvisiert !';
	};
} else {
	if(!isNull life_adminToDeleteTarget) then
	{
		_type = (typeOf life_adminToDeleteTarget);
		deletevehicle life_adminToDeleteTarget;
		hint parseText format["Erfolgreich gelöscht: <br/> %1", _type];
		[player, objNull, 1, "[ADMIN-Menu]", format["Hat folgendes Objekt gelöscht: %1", _type]] remoteExec ["TEX_FNC_LOGIT", 2];
		closeDialog 26090;
	};
};

