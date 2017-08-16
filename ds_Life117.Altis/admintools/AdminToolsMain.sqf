_pathtotools = "admintools\tools\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';

//customise these menus to fit your server
if ((getPlayerUID player) in DS_adminlist1) then { //all admins

	if ((getPlayerUID player) in DS_adminlist1) then { //mods
        adminmenu =
        [ 
			["",true],
				["Tools Menu", [2], "#USER:AdminToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
	if ((getPlayerUID player) in ["999"]) then { //admins
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:AdminToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
	if ((getPlayerUID player) in ["999"]) then { // super admins
		adminmenu =
		[
			["",true],
				["Tools Menu", [2], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};
};
//customise to fit
ModToolsMenu =
[
	["tOOLS",true],
		["God Mode", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Car God", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Spectate Player", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Teleport To Me", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleport", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//customise to fit
AdminToolsMenu =
[
		["Tools - Players",true],
	  	 ["Clean Up Vehicle", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
       	 ["Building Repair", [4],  "", -5, [["expression", format[_EXECscript1,"repairbuild.sqf"]]], "1", "1"],
		["Unlock Keys", [4],  "", -5, [["expression", format[_EXECscript1,"TPtoME.sqf"]]], "1", "1"],
		["TS Info", [4],  "", -5, [["expression", format[_EXECscript1,"sideChat.sqf"]]], "1", "1"],
		["BETA Version WArning", [4],  "", -5, [["expression", format[_EXECscript1,"safeZone.sqf"]]], "1", "1"],
		["SideChat Warning", [4],  "", -5, [["expression", format[_EXECscript1,"Tele.sqf"]]], "1", "1"],
	    ["", [-1], "", -5, [["expression", ""]], "1", "0"],
	    ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenu =
[
	["Tools",true],
	["Spectate Player", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
	["Teleport", [2], "#USER:ToolsMenuTeleport", -5, [["expression", ""]], "1", "1"],
	["Players", [3], "#USER:ToolsMenuPlayers", -5, [["expression", ""]], "1", "1"],
	["Miscellaneous", [4], "#USER:ToolsMenuMiscellaneous", -5, [["expression", ""]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenuTeleport =
[
	["Tools - Teleport",true],
        ["Teleport Self", [2],  "", -5, [["expression", format[_EXECscript1,"teleport.sqf"]]], "1", "1"],
        ["Teleport Self to Player", [3],  "", -5, [["expression", format[_EXECscript1,"teleport_to.sqf"]]], "1", "1"],
        ["Teleport Player(s) to Location", [4],  "", -5, [["expression", format[_EXECscript1,"teleportp.sqf"]]], "1", "1"],
        ["Teleport Player(s) to Me", [5],  "", -5, [["expression", format[_EXECscript1,"teleportp_to.sqf"]]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenuPlayers =
[
	["Tools - Players",true],
	["Heal Self", [6],  "", -5, [["expression", format[_EXECscript1,"heal.sqf"]]], "1", "1"],
	["Heal Player(s)", [7],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
        ["Add Money (10,000)", [8],  "", -5, [["expression", format[_EXECscript1,"add_money10000.sqf"]]], "1", "1"],
        ["Add Money (100,000)", [9],  "", -5, [["expression", format[_EXECscript1,"add_money100000.sqf"]]], "1", "1"],
        ["Add Money (1,000,000)", [10],  "", -5, [["expression", format[_EXECscript1,"add_money1000000.sqf"]]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenuMiscellaneous =
[
	["Tools - Miscellaneous",true],
	["Building Repair", [4],  "", -5, [["expression", format[_EXECscript1,"repairbuild.sqf"]]], "1", "1"],
	["Delete Vehicle", [2],  "", -5, [["expression", format[_EXECscript1,"veh_delete.sqf"]]], "1", "1"],
	["Repair Vehicle(s)", [8], "", -5, [["expression", format[_EXECscript1,"repairflip.sqf"]]], "1", "1"],
	["Kill Player", [3],  "", -5, [["expression", format[_EXECscript1,"kill.sqf"]]], "1", "1"],
	["Markers On", [4],  "", -5, [["expression", format[_EXECscript1,"adminMarkers.sqf"]]], "1", "1"],
	["Markers Off", [5],  "", -5, [["expression", format[_EXECscript1,"adminMarkersOff.sqf"]]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:adminmenu";