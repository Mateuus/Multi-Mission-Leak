/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
format["Welcome %1,",profileName] hintC
[
	"Please make sure you read the rules listed on the MAP screen. If you fail to follow any rule, you will receive warnings and eventually a ban for a set amount of time. Ignorance to the rules is not an excuse. Here are basic rules:",
	"Do NOT RDM in any listed Safe Zone.",
	"Do NOT VDM at any point of the game, including war.",
	"Robbing people is not allowed at any ATM location.",
	"Kidnapping people in Safe Zones must be done with strict RP.",
	"War must always be declared before shooting in cities.",
	"Police HQs are safe zones, do not shoot into them.",
	"Medics are not to be killed. No exceptions.",
	"Do NOT use armed Police Vehicles. If you find one, return it."
];
	