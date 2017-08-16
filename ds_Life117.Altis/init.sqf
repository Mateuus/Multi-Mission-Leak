enableSaving [false, false];
enableSentences false;
enableRadio false;

//X_Server = false;
//X_Client = false;
//X_JIP = false;
//StartProgress = false;

//if(!isDedicated) then { X_Client = true;};


//life_versionInfo = "Altis Life RPG v3.1.3.5";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\weather.sqf";
[] execVM "scripts\markerChecker.sqf";
//StartProgress = true;

/*

		[] spawn {
			scriptName "initMission.hpp: mission start";
			["rsc\ARMA_3.ogv", false] spawn BIS_fnc_titlecard;	
			waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
			[[2879.289,5618.516,0],"Welcome to the darkside!"] spawn BIS_fnc_establishingShot;	
			//OR , The above is a bit more user friendly and easier to control.
			//[getPos orbit1,"Alpha and Bravo have been engaged by hostile forces, provide backup",300,200,180,0,[]] spawn BIS_fnc_establishingShot;   
		};
*/

//SERVER VARIABLES

