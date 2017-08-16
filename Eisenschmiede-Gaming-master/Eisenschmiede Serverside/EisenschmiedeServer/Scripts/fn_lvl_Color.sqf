PlayerXpStat = "Neuling";
lbSetColor [2000, 0, [1, 0, 0, 1]];
lbSetColor [2000, 1, [1, 0, 0, 1]];
lbSetColor [2000, 2, [1, 0, 0, 1]];
lbSetColor [2000, 3, [1, 0, 0, 1]];
lbSetColor [2000, 4, [1, 0, 0, 1]];
lbSetColor [2000, 5, [1, 0, 0, 1]];
lbSetColor [2000, 6, [1, 0, 0, 1]];
lbSetColor [2000, 7, [1, 0, 0, 1]];
lbSetColor [2000, 8, [1, 0, 0, 1]];
lbSetColor [2000, 9, [1, 0, 0, 1]];
lbSetColor [2000, 10, [1, 0, 0, 1]];
lbSetColor [2000, 11, [1, 0, 0, 1]];
lbSetColor [2000, 12, [1, 0, 0, 1]];
lbSetColor [2000, 13, [1, 0, 0, 1]];
lbSetColor [2000, 14, [1, 0, 0, 1]];
lbSetColor [2000, 15, [1, 0, 0, 1]];
lbSetColor [2000, 16, [1, 0, 0, 1]];
lbSetColor [2000, 17, [1, 0, 0, 1]];
lbSetColor [2000, 18, [1, 0, 0, 1]];
lbSetColor [2000, 19, [1, 0, 0, 1]];
lbSetColor [2000, 20, [1, 0, 0, 1]];
lbSetColor [2000, 21, [1, 0, 0, 1]];

switch (playerSide) do {
	case west: {

		if(ES_xp_lvl >= 3) then { lbSetColor [2000, 0, [0,0.8,0,1]]; PlayerXpStat = "Nooby"; };
		if(ES_xp_lvl >= 5) then { lbSetColor [2000, 1, [0,0.8,0,1]]; PlayerXpStat = "Booby"; };
		if(ES_xp_lvl >= 6) then { lbSetColor [2000, 2, [0,0.8,0,1]]; PlayerXpStat = "Gooby"; };
		if(ES_xp_lvl >= 7) then { lbSetColor [2000, 3, [0,0.8,0,1]]; PlayerXpStat = "Rooby"; };
		if(ES_xp_lvl >= 8) then { lbSetColor [2000, 4, [0,0.8,0,1]]; PlayerXpStat = "Pooby"; };
		if(ES_xp_lvl >= 9) then { lbSetColor [2000, 5, [0,0.8,0,1]]; PlayerXpStat = "Tooby"; };
		if(ES_xp_lvl >= 12) then { lbSetColor [2000, 6, [0,0.8,0,1]]; PlayerXpStat = "Qooby"; };
		if(ES_xp_lvl >= 15) then { lbSetColor [2000, 7, [0,0.8,0,1]]; PlayerXpStat = "Hooby"; };
		if(ES_xp_lvl >= 16) then { lbSetColor [2000, 8, [0,0.8,0,1]]; PlayerXpStat = "Looby"; };
		if(ES_xp_lvl >= 18) then { lbSetColor [2000, 9, [0,0.8,0,1]]; PlayerXpStat = "Dooby"; };
		if(ES_xp_lvl >= 20) then { lbSetColor [2000, 10, [0,0.8,0,1]]; PlayerXpStat = "Legende"; };

	};

	case independent: {

		if(ES_xp_lvl >= 3) then { lbSetColor [2000, 0, [0,0.8,0,1]]; PlayerXpStat = "Nooby"; };
		if(ES_xp_lvl >= 5) then { lbSetColor [2000, 1, [0,0.8,0,1]]; PlayerXpStat = "Booby"; };
		if(ES_xp_lvl >= 6) then { lbSetColor [2000, 2, [0,0.8,0,1]]; PlayerXpStat = "Gooby"; };
		if(ES_xp_lvl >= 8) then { lbSetColor [2000, 3, [0,0.8,0,1]]; PlayerXpStat = "Rooby"; };
		if(ES_xp_lvl >= 10) then { lbSetColor [2000, 4, [0,0.8,0,1]]; PlayerXpStat = "Pooby"; };
		if(ES_xp_lvl >= 11) then { lbSetColor [2000, 5, [0,0.8,0,1]]; PlayerXpStat = "Tooby"; };
		if(ES_xp_lvl >= 15) then { lbSetColor [2000, 6, [0,0.8,0,1]]; PlayerXpStat = "Qooby"; };
		if(ES_xp_lvl >= 18) then { lbSetColor [2000, 7, [0,0.8,0,1]]; PlayerXpStat = "Hooby"; };
		if(ES_xp_lvl >= 20) then { lbSetColor [2000, 8, [0,0.8,0,1]]; PlayerXpStat = "Legende"; };

	};

	case civilian: {

		if(ES_xp_lvl >= 3) then { lbSetColor [2000, 0, [0,0.8,0,1]]; PlayerXpStat = "Nooby"; };
		if(ES_xp_lvl >= 4) then { lbSetColor [2000, 1, [0,0.8,0,1]]; PlayerXpStat = "Booby"; };
		if(ES_xp_lvl >= 5) then { lbSetColor [2000, 2, [0,0.8,0,1]]; PlayerXpStat = "Gooby"; };
		if(ES_xp_lvl >= 6) then { lbSetColor [2000, 3, [0,0.8,0,1]]; PlayerXpStat = "Rooby"; };
		if(ES_xp_lvl >= 7) then { lbSetColor [2000, 4, [0,0.8,0,1]]; PlayerXpStat = "Tooby"; };
		if(ES_xp_lvl >= 8) then { lbSetColor [2000, 5, [0,0.8,0,1]]; PlayerXpStat = "Hooby"; };
		if(ES_xp_lvl >= 9) then { lbSetColor [2000, 6, [0,0.8,0,1]]; PlayerXpStat = "Dooby"; };
		if(ES_xp_lvl >= 10) then { lbSetColor [2000, 7, [0,0.8,0,1]]; PlayerXpStat = "Pooby"; };
		if(ES_xp_lvl >= 12) then { lbSetColor [2000, 8, [0,0.8,0,1]]; PlayerXpStat = "Looby"; };
		if(ES_xp_lvl >= 13) then { lbSetColor [2000, 9, [0,0.8,0,1]]; PlayerXpStat = "Qooby"; };
		if(ES_xp_lvl >= 14) then { lbSetColor [2000, 10, [0,0.8,0,1]]; PlayerXpStat = "Keks"; };
		if(ES_xp_lvl >= 15) then { lbSetColor [2000, 11, [0,0.8,0,1]]; PlayerXpStat = "Muffin"; };
		if(ES_xp_lvl >= 16) then { lbSetColor [2000, 12, [0,0.8,0,1]]; PlayerXpStat = "Gemüse"; };
		if(ES_xp_lvl >= 18) then { lbSetColor [2000, 13, [0,0.8,0,1]]; PlayerXpStat = "Orange"; };
		if(ES_xp_lvl >= 20) then { lbSetColor [2000, 14, [0,0.8,0,1]]; PlayerXpStat = "Banane"; };
		if(ES_xp_lvl >= 22) then { lbSetColor [2000, 15, [0,0.8,0,1]]; PlayerXpStat = "Gurke mit Gfühl"; };
		if(ES_xp_lvl >= 25) then { lbSetColor [2000, 16, [0,0.8,0,1]]; PlayerXpStat = "Eisen"; };
		if(ES_xp_lvl >= 28) then { lbSetColor [2000, 17, [0,0.8,0,1]]; PlayerXpStat = "Schmiede"; };
		if(ES_xp_lvl >= 32) then { lbSetColor [2000, 18, [0,0.8,0,1]]; PlayerXpStat = "Ballon"; };
		if(ES_xp_lvl >= 34) then { lbSetColor [2000, 19, [0,0.8,0,1]]; PlayerXpStat = "Eisenschmiede Noob"; };
		if(ES_xp_lvl >= 36) then { lbSetColor [2000, 20, [0,0.8,0,1]]; PlayerXpStat = "Eisenschmiede Profi"; };
		if(ES_xp_lvl >= 40) then { lbSetColor [2000, 21, [0,0.8,0,1]]; PlayerXpStat = "AltisLife Legende"; };

	};
	
	default { PlayerXpStat = "ERROR"; };
};