#include <macro.h>
/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
params [
	["_state",1,[0]]
];

switch (_state) do {
	//Death while being wanted
	case 0: {
		SVAR_MNS [LICENSE_VARNAME("rebel"),false];
		SVAR_MNS [LICENSE_VARNAME("driver"),false];
		SVAR_MNS [LICENSE_VARNAME("passport"),false];
	};

	//Jail licenses
	case 1: {
		SVAR_MNS [LICENSE_VARNAME("gun"),false];
		SVAR_MNS [LICENSE_VARNAME("hunt"),false];
		SVAR_MNS [LICENSE_VARNAME("driver"),false];
		SVAR_MNS [LICENSE_VARNAME("rebel"),false];
		SVAR_MNS [LICENSE_VARNAME("passport"),false];
	};

	//Remove motor vehicle licenses
	case 2: {
		if(GVAR_MNS LICENSE_VARNAME("driver") OR GVAR_MNS LICENSE_VARNAME("air") OR GVAR_MNS LICENSE_VARNAME("truck") OR GVAR_MNS LICENSE_VARNAME("boat")) then {
			SVAR_MNS [LICENSE_VARNAME("air"),false];
			SVAR_MNS [LICENSE_VARNAME("driver"),false];
			SVAR_MNS [LICENSE_VARNAME("truck"),false];
			SVAR_MNS [LICENSE_VARNAME("boat"),false];
			hintSilent localize "STR_Civ_LicenseRemove_1";
		};
	};

	//Killing someone while owning a gun license
	case 3: {
		if(GVAR_MNS LICENSE_VARNAME("gun")) then {
			SVAR_MNS [LICENSE_VARNAME("gun"),false];
			SVAR_MNS [LICENSE_VARNAME("hunt"),false];
			hintSilent localize "STR_Civ_LicenseRemove_2";
		};
	};
};
