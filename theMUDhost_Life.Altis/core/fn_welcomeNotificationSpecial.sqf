/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
format["Welcome %1,",profileName] hintC
[
	"Cop/Medic Rules: These rules are to be followed as a cop/medic or you will be kicked and/or un-whitelisted! No exceptions.",
	"Check MAP for additional information",
	"Tazing people in a fast moving vehicle is not allowed.",
	"Do not leave your service vehicles all over the place, impound them.",
	"Respect the New Life Rule",
	"You must roleplay. Do not use excessive force unless required.",
	"Make sure you understand the Cop and Medic related rules listed on the map."
];
	