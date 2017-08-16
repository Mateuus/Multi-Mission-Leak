/*
	File: fn_revokeLicenceAction.sqf
	
	Description:
	Handles the removal of any license
*/
private["_type","_cop"];
_type = _this select 0;
_cop = _this select 1;

switch (_type) do {
	case "drivers": {
		license_civ_driver = false;
		hint format["Your Drivers License was revoked by %1.",name _cop];
		systemChat format["Your Drivers License was revoked by %1.",name _cop];
	};
	case "bounty": {
		license_civ_bounty = false;
		hint format["Your Bounty Hunter License was revoked by %1.",name _cop];
		systemChat format["Your Bounty Hunter License was revoked by %1.",name _cop];
	};
};