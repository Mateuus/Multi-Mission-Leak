/*
	ArmA.Network
	Author: Rathbone
	Copyright (c) ArmA.Network 2015 - 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/

with missionNamespace do 
{
	if !(isNil "FinishedSync") exitWith {};

	if (cameraView isEqualTo "Internal") then 
	{
		player switchCamera "External";
	};

	player allowDamage false;
	disableUserInput true;
	showChat false;
	hint "";
	1 fadeSound 0;
	1 fadeMusic 0;
	1 fadeRadio 0;
	1 fadeSpeech 0;
	sleep 1;

	0 = ["<br/><t color='#945C00'>SENDING DATA TO SERVER</t><br/>", 
		0, 
		0.2,
		2, 
		0.5, 
		0, 
		1000 
	] spawn BIS_fnc_dynamicText;

	sleep 1;
	private _queryTime = diag_tickTime;
	[] call life_fnc_voahlerluplugla;
	waitUntil { !(isNil "FinishedSync") };

	0 = [ format [ 
		"<br/><t color='#945C00'>SUCCESSFULLY SAVED DATA</t><br/><br/><t size='0.7'>Time taken - </t><t color='#945C00' size='0.7'>%1 second(s)</t><br/><t size='0.7'>See you soon %2.</t>",
		ceil (diag_tickTime - _queryTime), 
		profileName], 
		0, 
		0.2,
		2, 
		0.5, 
		0, 
		1000 
	] spawn BIS_fnc_dynamicText;
	sleep 3;
	disableUserInput false;
	showChat true;
	FinishedSync = nil;
	[ "Saved", true, false ] call BIS_fnc_endMission;
};