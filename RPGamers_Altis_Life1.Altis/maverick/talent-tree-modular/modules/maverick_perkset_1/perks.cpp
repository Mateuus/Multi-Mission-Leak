// -- Paycheck
class perk_paycheck_1 {
	displayName = "Paycheck";
	requiredPerkPoints = 1;
	requiredLevel = 2;
	requiredPerk = "";
	subtitle = "Level 2 Required";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+25% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_2 {
	displayName = "Paycheck 2";
	requiredPerkPoints = 1;
	requiredLevel = 8;
	requiredPerk = "perk_paycheck_1";
	subtitle = "Level 8 Required";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+50% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_3 {
	displayName = "Paycheck 3";
	requiredPerkPoints = 1;
	requiredLevel = 21;
	requiredPerk = "perk_paycheck_2";
	subtitle = "Level 21 Required";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+100% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

// -- Faster processing
class perk_processing_1 {
	displayName = "Processing Speed";
	requiredPerkPoints = 1;
	requiredLevel = 4;
	requiredPerk = "";
	subtitle = "Level 4 Required";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+10% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_2 {
	displayName = "Processing Speed 2";
	requiredPerkPoints = 1;
	requiredLevel = 7;
	requiredPerk = "perk_processing_1";
	subtitle = "Level 7 Required";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+15% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_3 {
	displayName = "Processing Speed 3";
	requiredPerkPoints = 1;
	requiredLevel = 17;
	requiredPerk = "perk_processing_2";
	subtitle = "Level 17 Required";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+25% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

//repair
class perk_repair_1 {
	displayName = "Grease Monkey";
	requiredPerkPoints = 1;
	requiredLevel = 4;
	requiredPerk = "";
	subtitle = "Level 4 Required";
	description = "Learn to repair more efficiently<br/><br/><t color='#10FF45'>+100% faster repairing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_repairSpeed_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_repair_2 {
	displayName = "Engineer";
	requiredPerkPoints = 1;
	requiredLevel = 16;
	requiredPerk = "perk_repair_1";
	subtitle = "Level 16 Required";
	description = "Learn to repair more efficiently<br/><br/><t color='#10FF45'>+200% faster repairing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_repairSpeed_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_repair_3 {
	displayName = "Mechanic";
	requiredPerkPoints = 1;
	requiredLevel = 25;
	requiredPerk = "perk_repair_2";
	subtitle = "Level 25 Required";
	description = "Learn to repair more efficiently<br/><br/><t color='#10FF45'>+300% faster repairing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_repairSpeed_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

//cpr
class perk_cpr_1 {
	displayName = "Combat Medic";
	requiredPerkPoints = 1;
	requiredLevel = 5;
	requiredPerk = "";
	subtitle = "Level 5 Required";
	description = "Learn to give CPR more efficiently and reduce CPR times on players<br/><br/><t color='#10FF45'>+50% faster CPRing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_cprSpeed_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_cpr_2 {
	displayName = "Advanced Combat Medic";
	requiredPerkPoints = 1;
	requiredLevel = 16;
	requiredPerk = "perk_cpr_1";
	subtitle = "Level 16 Required";
	description = "Learn to give CPR more efficiently and reduce CPR times on players<br/><br/><t color='#10FF45'>+100% faster CPRing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_cprSpeed_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_cpr_3 {
	displayName = "Expert Combat Medic";
	requiredPerkPoints = 1;
	requiredLevel = 25;
	requiredPerk = "perk_cpr_2";
	subtitle = "Level 25 Required";
	description = "Learn to give CPR more efficiently and reduce CPR times on players<br/><br/><t color='#10FF45'>+200% faster CPRing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_cprSpeed_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

// -- Weapon related perks
class perk_gunsspecialist_lessRecoil_1 {
	displayName = "Recoil Compensation";
	requiredPerkPoints = 1;
	requiredLevel = 5;
	requiredPerk = "";
	subtitle = "Level 5 Required";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-5% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_2 {
	displayName = "Recoil Compensation 2";
	requiredPerkPoints = 1;
	requiredLevel = 16;
	requiredPerk = "perk_gunsspecialist_lessRecoil_1";
	subtitle = "Level 16 Required";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-10% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_3 {
	displayName = "Recoil Compensation 3";
	requiredPerkPoints = 1;
	requiredLevel = 25;
	requiredPerk = "perk_gunsspecialist_lessRecoil_2";
	subtitle = "Level 25 Required";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-20% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

// -- Faster lockpicking
class perk_locksmith_1 {
	displayName = "Locksmith";
	requiredPerkPoints = 1;
	requiredLevel = 7;
	requiredPerk = "";
	subtitle = "Level 7 Required";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+10% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_2 {
	displayName = "Locksmith 2";
	requiredPerkPoints = 1;
	requiredLevel = 16;
	requiredPerk = "perk_locksmith_1";
	subtitle = "Level 16 Required";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+15% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_3 {
	displayName = "Locksmith 3";
	requiredPerkPoints = 1;
	requiredLevel = 28;
	requiredPerk = "perk_locksmith_2";
	subtitle = "Level 28 Required";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+25% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};