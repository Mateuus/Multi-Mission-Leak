#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
/*

	Black Lagoon Altis Life Permission System (perm)

*/

//Schema:
//   0        1         2            3            4                                5      6
// PERMID, PERMNAME, MAXLEVEL, RULECONFIG, MEMBER_CONDITIONS [cop,reb,VIP], LOGO, LEVELNAMES

/*


	RULECONFIG:
	Array of leader rules
	
	[ [LEVEL, [RULESET+] ]

	RULESET = [LEADER, RANKUP, RANKDOWN, SELF, SUPER, VIEW, (CUSTOM PERMS)] 
	
	* SUPER ... CAN CONTROL RANK OF HIGHER LEVELS
	* SELF ... Can set own rank
	* VIEW ... can view list of players
	


*/

EMonkeys_perms = [
	
	["soa", "SOA", 5,[ 
		[0, []],
		[1, ["VIEW"]],
		[2, ["VIEW","RESTRAIN"]],
		[3, ["VIEW","RESTRAIN"]],
		[4, ["VIEW", "RANKUP", "RANKDOWN"]],
		[5, ["LEADER", "RANKUP", "RANKDOWN", "VIEW", "RESTRAIN"]]
	],  
	[], "core\textures\misc\gruppesystem\soa.paa",
	["Kein Mitglied", "Hangaround", "Prospects", "Member", "Unholy Ones","Präsidium"]],
	
	["AP", "AP", 5, [ 
		[0, []],
		[1, ["VIEW"]],
		[2, ["VIEW","RESTRAIN"]],
		[3, ["VIEW","RESTRAIN"]],
		[4, ["VIEW","RESTRAIN"]],
		[5, ["LEADER", "RANKUP", "RANKDOWN", "VIEW", "RESTRAIN"]]
	],  
	[], "core\textures\misc\gruppesystem\ap.paa",
	["Kein Mitglied","Praktikant", "Trainee", "Redaktion", "Chefredaktion", "Verlagsleiter"]],
	
	["KSK", "SOG", 5, [
		[0, ["VIEW"]],
		[1, ["VIEW"]],
		[2, ["VIEW","RESTRAIN"]],
		[3, ["VIEW","RESTRAIN"]],
		[4, ["VIEW","RESTRAIN"]],
		[5, ["LEADER", "RANKUP", "RANKDOWN", "VIEW", "RESTRAIN"]]
	],  
	[], "core\textures\misc\gruppesystem\sog.paa",
	["Kein Mitglied","Gefreiter", "Hauptgefreiter", "Hauptfeldwebel", "Oberstabsfeldwebel", "Brigadegeneral"]],
	
	["PS", "PS", 5, [ 
		[0, ["VIEW"]],
		[1, ["VIEW","RESTRAIN"]],
		[2, ["VIEW","RESTRAIN"]],
		[3, ["VIEW","RESTRAIN"]],
		[4, ["RANKUP", "RANKDOWN", "VIEW", "RESTRAIN"]],
		[5, ["LEADER", "RANKUP", "RANKDOWN", "VIEW", "RESTRAIN"]]
	],  
	[], "core\textures\misc\gruppesystem\ps.paa",
	["Kein Mitglied","Azubi", "Security Guard", "Spezialist", "Instructor", "President"]],
	
	["LOTSE", "LOTSE", 3, [ 
		[0, ["VIEW"]],
		[1, ["VIEW","RESTRAIN"]],
		[2, ["VIEW", "RANKUP", "RANKDOWN", "RESTRAIN"]],
		[3, ["LEADER", "RANKUP", "RANKDOWN", "VIEW", "RESTRAIN"]]
	],  
	[], "core\textures\misc\gruppesystem\lotse.paa",
	["Kein Mitglied", "LOTSE", "Ausbilder", "Chef"]],

	["FF", "FF", 4, [ 
		[0, ["VIEW"]],
		[1, ["VIEW","RESTRAIN"]],
		[2, ["VIEW","RESTRAIN"]],
		[3, ["VIEW", "RANKUP", "RANKDOWN", "RESTRAIN"]],
		[4, ["LEADER", "RANKUP", "RANKDOWN", "VIEW", "RESTRAIN"]]
	],  
	[], "core\textures\misc\gruppesystem\ff.paa",
	["Kein Mitglied", "Auszubildender", "Mitarbeiter", "Führungskraft", "Geschäftsführung"]],

	["DM", "DM", 5, [ 
		[0, ["VIEW"]],
		[1, ["VIEW","RESTRAIN"]],
		[2, ["VIEW","RESTRAIN"]],
		[3, ["VIEW","RESTRAIN"]],
		[4, ["VIEW", "RANKUP", "RANKDOWN", "RESTRAIN"]],
		[5, ["LEADER", "RANKUP", "RANKDOWN", "VIEW", "RESTRAIN"]]
	],  
	[], "core\textures\misc\gruppesystem\dm.paa",
	["Kein Mitglied", "Hefesammler [HS]", "Bierbrauer [BB]", "Schnapsbrenner [SB]", "Absinthbrenner [AB]", "Alkoholdealer [AD]"]],

	["BWA", "BWA", 5, [ 
		[0, ["VIEW"]],
		[1, ["VIEW","RESTRAIN"]],
		[2, ["VIEW","RESTRAIN"]],
		[3, ["VIEW","RESTRAIN"]],
		[4, ["VIEW", "RANKUP", "RANKDOWN", "RESTRAIN"]],
		[5, ["LEADER", "RANKUP", "RANKDOWN", "VIEW", "RESTRAIN"]]
	],  
	[], "core\textures\misc\gruppesystem\bwa.paa",
	["Kein Mitglied", "Mittlerer Dienst", "Gehobener Dienst", "Höherer Dienst", "Ausbilder", "BWA Leitung"]]

];

EMonkeys_dynperms = []; //Dynamic perms, loaded by database


///////////////////////////// Autoconfig
player setVariable["perms",[],true]; //[PERMID, LEVEL]
EMonkeys_dynperm_checkout_running = false;

__CONST__(EMonkeys_perms,EMonkeys_perms);

