#include "..\script_macros.hpp"
/*

*       ["EpicSplit"] spawn ES_fnc_ESMoves;

*/
params
[
    ["_ESMoves","",["",0]]
];

switch (_ESMoves) do {

	case "EpicSplit": {

		if(!WOoOoOoW) exitWith {hint "Der WOoOoOoW Move kann nur alle 65 Sekunden ausgeführt werden!";};
		if(WOoOoOoW) then {WOoOoOoW = false;[] spawn {sleep 65;WOoOoOoW = true;};};
		[] spawn {
			[player,"Acts_EpicSplit",true] remoteExec ["ES_fnc_animSync",-2];
			player switchMove "Acts_EpicSplit";  
			player playMoveNow "Acts_EpicSplit";
			sleep 10; 
			[player,"Acts_EpicSplit_out",true] remoteExec ["ES_fnc_animSync",-2];
			player switchMove "Acts_EpicSplit_out";  
			player playMoveNow "Acts_EpicSplit_out";
			sleep 10;
			[player,"Acts_EpicSplit_out",true] remoteExec ["ES_fnc_animSync",-2];
			player switchMove "Acts_EpicSplit_out";  
			player playMoveNow "Acts_EpicSplit_out";
		};

	};

	case "LowGesture": {
		[player,"Acts_CrouchGetLowGesture",true] remoteExec ["ES_fnc_animSync",-2];
		player switchMove "Acts_CrouchGetLowGesture";       
		player playMoveNow "Acts_CrouchGetLowGesture";
	};

	case "gestureHi": {player playAction "gestureHi";};
	
    case "gestureHiB": {player playAction "gestureHiB";};

    case "gestureHiC": {player playAction "gestureHiC";};

	case "gestureNod": {player playAction "gestureNod";};
	
	case "Scared": {player playMove "AmovPercMstpSnonWnonDnon_Scared";};
	
	case "Pissing": {player playMove "Acts_AidlPercMstpSlowWrflDnon_pissing";};
	
	case "Takwondo": {player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";};
	
	case "KneebendSlow": {player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";};
	
	case "KneebendFast": {player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";};
	
    case "Pushup": {player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";};

    default {  };

};