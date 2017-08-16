/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
[] spawn {


sleep 2;
[
	[
		["Willkommen ","align = 'center' shadow = '1' size = '0.5' font='PuristaBold'","#FF9900"],
		["auf dem Altis Life Server der Michecortes Gaming Community ","align = 'center' shadow = '1' size = '0.5'","#FFFFFF"],
		[". "," align = 'center' shadow = '1' size = '0.5'","#FF9900"]
	]
] spawn BIS_fnc_typeText2;
sleep 15;
[
	[
		["Besuche uns auf unserem Teamspeak Server: ","align = 'center' shadow = '1' size = '0.5' font='PuristaBold'","#FF9900"],
		["michecortes.teamspeak.de ","align = 'center' shadow = '1' size = '0.5'","#FFFFFF"],
		[". "," align = 'center' shadow = '1' size = '0.5'","#FF9900"]
	]
] spawn BIS_fnc_typeText2;
sleep 15;
[
	[
		["Oder auf unserer Webseite: ","align = 'center' shadow = '1' size = '0.5' font='PuristaBold'","#FF9900"],
		["www.michecortes.de ","align = 'center' shadow = '1' size = '0.5'","#FFFFFF"],
		[". "," align = 'center' shadow = '1' size = '0.5'","#FF9900"]
	]
] spawn BIS_fnc_typeText2;
sleep 10;
[
	[
		["Beachte immer die Regeln! ","align = 'center' shadow = '1' size = '0.5' font='PuristaBold'","#FF9900"],
		["Diese findest du auf unserem Forum ","align = 'center' shadow = '1' size = '0.5'","#FFFFFF"],
		[". "," align = 'center' shadow = '1' size = '0.5'","#FF9900"]
	]
] spawn BIS_fnc_typeText2;
sleep 10;
[
	[
		["Viel Spaß ","align = 'center' shadow = '1' size = '0.5' font='PuristaBold'","#FF9900"],
		["wünscht dir das ","align = 'center' shadow = '1' size = '0.5'","#FFFFFF"],
		["michecortes Server-Team  "," align = 'center' shadow = '1' size = '0.5'","#FF9900"]
	]
] spawn BIS_fnc_typeText2;
};
