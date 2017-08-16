#include <macro.h>
/*	
	File: fn_surrender.sqf
	Author: MrKraken
	
	Description: 
	places player into a surrendered state!
*/

player SVAR ["surrender", true, true]; //Set surrender to true

while { player GVAR ["surrender", false] }  do { 
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"; //Animation in
	
	// Check if player is alive.
	if (!alive player) then {
		player SVAR ["surrender", false, true];
	};
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"; //Animation out