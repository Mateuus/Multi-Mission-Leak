// -- Police Perks
class Spacer_1 {
	displayName = "===| Police Perks |===";
	requiredPerkPoints = 100;
	requiredLevel = 100;
	requiredPerk = "";
	subtitle = "";
	description = "";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
// -- Weapon related perks
class perk_gunsspecialist_lessRecoil_1 {
	displayName = "Recoil Compensation";
	requiredPerkPoints = 5;
	requiredLevel = 5;
	requiredPerk = "";
	subtitle = "Level 5 Required, 5 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-5% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_1.sqf";
	limitToSides[] = {WEST};
	color[] = {1,1,1,1};
};
class perk_gunsspecialist_lessRecoil_2 {
	displayName = "Recoil Compensation 2";
	requiredPerkPoints = 6;
	requiredLevel = 16;
	requiredPerk = "perk_gunsspecialist_lessRecoil_1";
	subtitle = "Level 16 Required, 6 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-10% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_2.sqf";
	limitToSides[] = {WEST};
	color[] = {1,1,1,1};
};
class perk_gunsspecialist_lessRecoil_3 {
	displayName = "Recoil Compensation 3";
	requiredPerkPoints = 7;
	requiredLevel = 25;
	requiredPerk = "perk_gunsspecialist_lessRecoil_2";
	subtitle = "Level 25 Required, 7 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-20% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_3.sqf";
	limitToSides[] = {WEST};
	color[] = {1,1,1,1};
};
//Cop Impounding
class perk_CopImpounding_1 {
	displayName = "Cop Impounding #1";
	requiredPerkPoints = 2;
	requiredLevel = 5;
	requiredPerk = "";
	subtitle = "Level 5 Required, 2 Perk Points";
	description = "Impound Vehicles more efficiently and reduce Impound times on vehicles<br/><br/><t color='#10FF45'>+10% faster Impound</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_copimpoundSpeed_1.sqf";
	limitToSides[] = {"WEST"};
	color[] = {1,1,1,1};
};
class perk_CopImpounding_2 {
	displayName = "Cop Impounding #2";
	requiredPerkPoints = 2;
	requiredLevel = 10;
	requiredPerk = "perk_CopImpounding_1";
	subtitle = "Level 10 Required, 2 Perk Points";
	description = "Impound Vehicles more efficiently and reduce Impound times on vehicles<br/><br/><t color='#10FF45'>+20% faster Impound</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_copimpoundSpeed_2.sqf";
	limitToSides[] = {"WEST"};
	color[] = {1,1,1,1};
};
class perk_CopImpounding_3 {
	displayName = "Cop Impounding #3";
	requiredPerkPoints = 2;
	requiredLevel = 15;
	requiredPerk = "perk_CopImpounding_2";
	subtitle = "Level 15 Required, 2 Perk Points";
	description = "Impound Vehicles more efficiently and reduce Impound times on vehicles<br/><br/><t color='#10FF45'>+30% faster Impound</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_copimpoundSpeed_3.sqf";
	limitToSides[] = {"WEST"};
	color[] = {1,1,1,1};
};

//==========================================================================================================================================\\

// -- Medic Perks
/*
class Spacer_2 {
	displayName = "Medic Perks";
	requiredPerkPoints = 100;
	requiredLevel = 100;
	requiredPerk = "";
	subtitle = "";
	description = "";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
*/

//==========================================================================================================================================\\

// -- Civilian Perks
class Spacer_3 {
	displayName = "===| Civilian Perks |===";
	requiredPerkPoints = 100;
	requiredLevel = 100;
	requiredPerk = "";
	subtitle = "";
	description = "";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
// -- Faster processing
class perk_processing_1 {
	displayName = "processor";
	requiredPerkPoints = 3;
	requiredLevel = 4;
	requiredPerk = "";
	subtitle = "Level 4 Required, 3 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+50% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class perk_processing_2 {
	displayName = "processor #2";
	requiredPerkPoints = 3;
	requiredLevel = 7;
	requiredPerk = "perk_processing_1";
	subtitle = "Level 7 Required, 3 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+60% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class perk_processing_3 {
	displayName = "processor #3";
	requiredPerkPoints = 4;
	requiredLevel = 17;
	requiredPerk = "perk_processing_2";
	subtitle = "Level 17 Required, 4 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+70% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Faster lockpicking
class perk_locksmith_1 {
	displayName = "Locksmith";
	requiredPerkPoints = 5;
	requiredLevel = 7;
	requiredPerk = "";
	subtitle = "Level 7 Required, 5 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+50% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class perk_locksmith_2 {
	displayName = "Locksmith 2";
	requiredPerkPoints = 6;
	requiredLevel = 16;
	requiredPerk = "perk_locksmith_1";
	subtitle = "Level 16 Required, 6 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+80% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class perk_locksmith_3 {
	displayName = "Locksmith 3";
	requiredPerkPoints = 4;
	requiredLevel = 28;
	requiredPerk = "perk_locksmith_2";
	subtitle = "Level 28 Required, 4 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+100% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Rebel 
class RadiationSuit {
	displayName = "Radiation Suit";
	requiredPerkPoints = 1;
	requiredLevel = 25;
	requiredPerk = "";
	subtitle = "Level 25 Required, 1 Perk Points";
	description = "Able to buy Radiation Suit<br/><br/><t color='#10FF45'>Surviving Radiation Zones</t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Civilian Backpack
class Backpackperk {
	displayName = "Farmer";
	requiredPerkPoints = 1;
	requiredLevel = 5;
	requiredPerk = "";
	subtitle = "Level 5 Required, 1 Perk Points";
	description = "Able to Spawn with a bigger backpack<br/><br/><t color='#10FF45'>Add something cool here?</t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Civilian GPS
class GPSperk {
	displayName = "Tracker";
	requiredPerkPoints = 1;
	requiredLevel = 5;
	requiredPerk = "";
	subtitle = "Level 5 Required, 1 Perk Points";
	description = "Able to Spawn with a GPS backpack<br/><br/><t color='#10FF45'>Add something cool here?</t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Delivery Mission
class deliveryman {
	displayName = "Delivery Man";
	requiredPerkPoints = 1;
	requiredLevel = 5;
	requiredPerk = "";
	subtitle = "Level 5 Required, 1 Perk Points";
	description = "Increased payout from delivery missions by<br/><br/><t color='#10FF45'>15%</t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Cheap Storage
class privategarage {
	displayName = "Cheap Storage";
	requiredPerkPoints = 1;
	requiredLevel = 5;
	requiredPerk = "";
	subtitle = "Level 5 Required, 1 Perk Points";
	description = "Cost of retrieving vehicles from your garage reduced by<br/><br/><t color='#10FF45'>50%</t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

//==========================================================================================================================================\\

// -- Universal Perks
class Spacer_4 {
	displayName = "===| Universal Perks |===";
	requiredPerkPoints = 100;
	requiredLevel = 100;
	requiredPerk = "";
	subtitle = "";
	description = "";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
// -- Paycheck
class perk_paycheck_1 {
	displayName = "Hard Worker";
	requiredPerkPoints = 2;
	requiredLevel = 2;
	requiredPerk = "";
	subtitle = "Level 2 Required, 2 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+50% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
class perk_paycheck_2 {
	displayName = "Hard Worker #2";
	requiredPerkPoints = 3;
	requiredLevel = 8;
	requiredPerk = "perk_paycheck_1";
	subtitle = "Level 8 Required, 3 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+70% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
class perk_paycheck_3 {
	displayName = "Hard Worker #3";
	requiredPerkPoints = 6;
	requiredLevel = 21;
	requiredPerk = "perk_paycheck_2";
	subtitle = "Level 21 Required, 6 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+100% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
//repair
class perk_repair_1 {
	displayName = "Mechanic";
	requiredPerkPoints = 2;
	requiredLevel = 7;
	requiredPerk = "";
	subtitle = "Level 7 Required, 2 Perk Points";
	description = "Learn to repair more efficiently<br/><br/><t color='#10FF45'>+50% faster repairing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_repairSpeed_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
//cpr
class perk_cpr_1 {
	displayName = "Combat Medic";
	requiredPerkPoints = 5;
	requiredLevel = 7;
	requiredPerk = "";
	subtitle = "Level 7 Required, 5 Perk Points";
	description = "Learn to give CPR more efficiently and reduce CPR times on players<br/><br/><t color='#10FF45'>+10% faster CPRing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_cprSpeed_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
class perk_cpr_2 {
	displayName = "Combat Medic 2";
	requiredPerkPoints = 6;
	requiredLevel = 16;
	requiredPerk = "perk_cpr_1";
	subtitle = "Level 16 Required, 6 Perk Points";
	description = "Learn to give CPR more efficiently and reduce CPR times on players<br/><br/><t color='#10FF45'>+15% faster CPRing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_cprSpeed_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
class perk_cpr_3 {
	displayName = "Combat Medic 3";
	requiredPerkPoints = 4;
	requiredLevel = 28;
	requiredPerk = "perk_cpr_2";
	subtitle = "Level 28 Required, 4 Perk Points";
	description = "Learn to give CPR more efficiently and reduce CPR times on players<br/><br/><t color='#10FF45'>+25% faster CPRing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_cprSpeed_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};