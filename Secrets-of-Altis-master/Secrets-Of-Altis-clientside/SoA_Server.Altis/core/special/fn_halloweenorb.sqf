/*
	fn_halloweenorb.sqf
	Author: G00golplexian
	
	Description: Erstellt ne dunkle Kugel, woooahh magisch!
*/

sleep 2;

_action = [
	"Die dunkle Kugel besitzt große Macht. Sie kann dich beim Tod wiederbeleben und ihr Licht leuchtet dir den Weg! Benutze sie sorgfältig!",
	"Die Kugel leuchtet hell auf!",
	"Kugellicht",
	"Auferstehung"
] call BIS_fnc_guiMessage;

if(_action) then {
		if(life_lightorblight) exitWith {hint "Die Kugel leuchtet bereits den Weg."; player removeaction action_darkorb};

		lightorb = "#lightpoint" createvehicle [0,0,0];
		lightorb setLightBrightness 1;
		lightorb setLightIntensity 40;
		lightorb setLightAmbient [0.2, 0.1, 0.8];
		lightorb setLightColor [0.2, 0.1, 0.8];
		lightorb attachTo [player, [0,0,0], "RightHandMiddle1"];
		lightorb setLightUseFlare true;
		lightorb setLightFlareSize 0.6;
		lightorb setLightFlareMaxDistance 100;
		lightorb setLightDayLight true;
		
		life_lightorblight = true;
		[] spawn {while {life_lightorblight} do {player say3d "darkorb"; sleep 3.2;}};
	
	} else {
	
		if(life_lightorbrevive) exitWith {hint "Die Macht der Kugel ist aufgebraucht!"};
		hint "Die Macht der Kugel überströmt deinen Körper.";
		life_lightorbrevive = true;
		[] spawn {WaitUntil{!alive player}; playsound "hallelujah"; titleText ["", "WHITE OUT"]; sleep 5; titleFadeOut 5; ["",1] spawn life_fnc_revived;}; 
};