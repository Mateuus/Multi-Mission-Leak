/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;
showCommandingMenu "";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "statusBar.sqf";
[] execVM "safezone.sqf";
[] execVM "fastrope.sqf";
[] execVM "teargas.sqf";

//Fog and rain shit
[] spawn {
	while{true} do {
		uiSleep 10;
		0 setRain 0;
		0 setFog 0;
		uiSleep 590;
	};
};

enableRadio false;
enableSentences false;
setCurrentChannel 5;

StartProgress = true;