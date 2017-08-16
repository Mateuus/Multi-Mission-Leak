/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up medic scripts
*/

//Actions
DS_sec_securityLoadout = compile preprocessFileLineNumbers "player\whitelistcivilian\security\fn_securityLoadout.sqf";
DS_sec_markers = compile preprocessFileLineNumbers "player\whitelistcivilian\security\fn_markers.sqf";
DS_sec_sendCriminal = compile preprocessFileLineNumbers "player\whitelistcivilian\security\fn_sendCriminal.sqf";
DS_sec_shopInfo = compile preprocessFileLineNumbers "player\whitelistcivilian\security\fn_shopInfo.sqf";
DS_sec_vehImpound = compile preprocessFileLineNumbers "player\whitelistcivilian\security\fn_vehImpound.sqf";
DS_sec_askForPayment = compile preprocessFileLineNumbers "player\whitelistcivilian\security\fn_askForPayment.sqf";
DS_sec_requestPayment = compile preprocessFileLineNumbers "player\whitelistcivilian\security\fn_requestPayment.sqf";