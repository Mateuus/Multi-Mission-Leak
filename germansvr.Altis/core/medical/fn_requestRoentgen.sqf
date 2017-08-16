/*

	Author: Nox
	Description: Magic happens...

*/
if (!(roentgen_request_accepted)) exitWith { hint "Das Roentgengeraet ist noch nicht bereit, bitte warte auf einen Arzt." };
if (roentgen_in_progress) exitWith { hint "Derzeit findet bereits eine Untersuchung statt." };
if (playerside != civilian) exitWith { hint "Du kannst nur Patienten untersuchen!" };
if (vehicle player != player) exitWith {};


[] spawn {
		
		roentgen_in_progress = true;
		publicVariable "roentgen_in_progress";
		
		roentgenmonitor1 setObjectTextureGlobal [0, ""];
		
		player setPos [5789.994,10434.254,1]; 
		player setDir 190; 
		
		sleep 1; 
		
		player playMove "AinjPpneMstpSnonWnonDnon";
		
		sleep 2;
		
		[player,"Device_disassembled_loop"] remoteExec ["life_fnc_globalSound",0];
		sleep 28.6;
		
		player setPos [5790.033,10434.172,1]; 
		player switchMove "";
		
		sleep 2;
		
		roentgenmonitor1 setObjectTextureGlobal [0, "images\med\roentgen1.paa"];
		
		roentgen_in_progress = false;
		publicVariable "roentgen_in_progress";
		roentgen_request_accepted = false;
		publicVariable "roentgen_request_accepted";
		
		sleep 360;
		
		roentgenmonitor1 setObjectTextureGlobal [0, ""];
	};