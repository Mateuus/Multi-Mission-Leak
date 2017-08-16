/*
	Author: MrKraken
	filename: fn_surrender.sqf
	Description: places player into a surrendered state!
	edit by Lost of Paradise -> Speed Farmbug with Surrender Animation fixed
*/

player setVariable ["surrender", true, true]; //Set surrender to true
		[[0,"ergeben",true,[profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		[[0,"ergeben",true,[profileName]],"life_fnc_broadcast",independent,false] spawn life_fnc_MP;
		[[0,"ergeben",true,[profileName]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
		hint "Du hast dich ergeben! Wir weisen daraufhin, wenn du diese Funktion spammst, das dies zu einem Bann führen kann!";
while { player getVariable ["surrender", false] }  do { 
life_pickAxeAllowed = false; // blocked pickaxe
life_action_gather = true; // blocked space
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"; //Animation in
	
	// Check if player is alive.
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"; //Animation out
sleep 10;
life_action_gather = false; // enable space
life_pickAxeAllowed = true; // enable pickaxe