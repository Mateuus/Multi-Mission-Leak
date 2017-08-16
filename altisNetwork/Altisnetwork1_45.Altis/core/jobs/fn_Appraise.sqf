private ["_potteryage","_artifacts"];
_potteryage = ["10,000AD","12,000AD","15,000BC","17,000BC"] call BIS_fnc_selectRandom;

	If (life_inv_artifactold == 1) then {
	hintC format ["This is some kind of ancient artifact that was damaged, I would estimate this would be worth approximately �115000."];
	life_inv_artifactold = 0;
	life_inv_artifactoldp = 1; //Swaps the unknown item for a known one
	life_wreck_searched = false;
	life_explorer_task setTaskState "Succeeded";
	player removeSimpleTask life_explorer_task;
	deleteVehicle life_explorer_wreck;
	sleep 1; 
	["TaskSucceeded", ["Treasure Hunting", "Your items were washed! You can now sell them at the market."]] call bis_fnc_showNotification;
	};
	
	If (life_inv_artifactnew == 1) then {
	hintC format ["This is some kind of ancient artifact that was perserved, I would estimate this would be worth approximately �150000."];
	life_inv_artifactnew = 0;
	life_inv_artifactnewp = 1; //Swaps the unknown item for a known one
	life_wreck_searched = false;
	life_explorer_task setTaskState "Succeeded";
	player removeSimpleTask life_explorer_task;
	deleteVehicle life_explorer_wreck;
	sleep 1;
	["TaskSucceeded", ["Treasure Hunting", "Your items were washed! You can now sell them to the market."]] call bis_fnc_showNotification;
	};
	
	If (life_inv_gold == 1) then {
	hintC format ["This is extremely rare gold, It is probably worth around �250000 as it looks to be from around " + _potteryage]; 
	life_inv_gold = 0;
	life_inv_goldp = 1; //Swaps the unknown item for a known one
	life_wreck_searched = false;
	life_explorer_task setTaskState "Succeeded";
	player removeSimpleTask life_explorer_task;
	deleteVehicle life_explorer_wreck;
	sleep 1; 
	["TaskSucceeded", ["Treasure Hunting", "Your items were washed! You can now sell them to the market."]] call bis_fnc_showNotification;
	};
	
	