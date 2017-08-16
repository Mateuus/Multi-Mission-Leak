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
//Cop Impounding : Working
class perk_CopImpounding_3 {
	displayName = "Cop Impounding";
	requiredPerkPoints = 1;
	requiredLevel = 2;
	requiredPerk = "";
	subtitle = "Level 2 Required, 1 Perk Points";
	description = "Impound Vehicles more efficiently and reduce Impound times on vehicles<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_copimpoundSpeed_3.sqf";
	limitToSides[] = {"WEST"};
	color[] = {1,1,1,1};
};
// -- Recoil : Working
class perk_gunsspecialist_lessRecoil_1 {
	displayName = "Recoil Compensation";
	requiredPerkPoints = 2;
	requiredLevel = 10;
	requiredPerk = "";
	subtitle = "Level 10 Required, 2 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_1.sqf";
	limitToSides[] = {WEST};
	color[] = {1,1,1,1};
};
class perk_gunsspecialist_lessRecoil_2 {
	displayName = "Recoil Compensation 2";
	requiredPerkPoints = 5;
	requiredLevel = 20;
	requiredPerk = "perk_gunsspecialist_lessRecoil_1";
	subtitle = "Level 20 Required, 5 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_2.sqf";
	limitToSides[] = {WEST};
	color[] = {1,1,1,1};
};
class perk_gunsspecialist_lessRecoil_3 {
	displayName = "Recoil Compensation 3";
	requiredPerkPoints = 20;
	requiredLevel = 40;
	requiredPerk = "perk_gunsspecialist_lessRecoil_2";
	subtitle = "Level 40 Required, 20 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_3.sqf";
	limitToSides[] = {WEST};
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
// -- Faster lockpicking - working

class perk_locksmith_1 {
	displayName = "Locksmith";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+10% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_2 {
	displayName = "Locksmith 2";
	requiredPerkPoints = 4;
	requiredLevel = 1;
	requiredPerk = "perk_locksmith_1";
	subtitle = "Level 1 Required, 4 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+15% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

// -- Civilian Backpack : Working
class Backpackperk {
	displayName = "Backpack";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 1 Perk Points";
	description = "Able to Spawn with a AssaultPack backpack<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class Backpackperk_2 {
	displayName = "Backpack lvl 2";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "Backpackperk";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Able to Spawn with a Carryall backpack<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class Backpackperk_3 {
	displayName = "Backpack lvl 3";
	requiredPerkPoints = 3;
	requiredLevel = 1;
	requiredPerk = "Backpackperk_2";
	subtitle = "Level 1 Required, 3 Perk Points";
	description = "Able to Spawn with a Bergen backpack<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Civilian GPS : Working
class GPSperk {
	displayName = "Tracker";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 1 Perk Points";
	description = "Able to Spawn with a GPS<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Civilian NVG : Working
class NVGperk {
	displayName = "Night Hawk";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 1 Perk Points";
	description = "Able to Spawn with Night Vision<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Civilian Toolkit : Working
class Toolkitperk {
	displayName = "Crasher";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Able to Spawn with a ToolKit<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Faster processing - working
class perk_processing_1 {
	displayName = "Processing Speed";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+10% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_2 {
	displayName = "Processing Speed 2";
	requiredPerkPoints = 4;
	requiredLevel = 1;
	requiredPerk = "perk_processing_1";
	subtitle = "Level 1 Required, 4 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+15% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_3 {
	displayName = "Processing Speed 3";
	requiredPerkPoints = 6;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 6 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- farmer : Working
class farmer {
	displayName = "Farmer";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Gathering speed increased.<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_farmspeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class farmer_2 {
	displayName = "Farmer lvl 2";
	requiredPerkPoints = 4;
	requiredLevel = 1;
	requiredPerk = "farmer";
	subtitle = "Level 1 Required, 4 Perk Points";
	description = "Gathering speed increased.<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_farmspeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class farmer_3 {
	displayName = "Farmer lvl 3";
	requiredPerkPoints = 6;
	requiredLevel = 1;
	requiredPerk = "farmer_2";
	subtitle = "Level 1 Required, 6 Perk Points";
	description = "Gathering speed increased.<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_farmspeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Mining Perk - working
class miner {
	displayName = "Miner";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Gathering speed increased.<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_minespeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class miner_2 {
	displayName = "Miner lvl 2";
	requiredPerkPoints = 4;
	requiredLevel = 1;
	requiredPerk = "miner";
	subtitle = "Level 1 Required, 4 Perk Points";
	description = "Gathering speed increased.<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_minespeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
class miner_3 {
	displayName = "Miner lvl 3";
	requiredPerkPoints = 6;
	requiredLevel = 1;
	requiredPerk = "miner_2";
	subtitle = "Level 1 Required, 6 Perk Points";
	description = "Gathering speed increased.<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_minespeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Delivery Mission : Working
class deliveryman {
	displayName = "Delivery Man";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Increased payout from delivery missions.<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

// -- Thug : Working
class thug {
	displayName = "Thug";
	requiredPerkPoints = 3;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 3 Perk Points";
	description = "Increased payout from robbing petrol stations.<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Stronghold : Need Testing
class stronghold {
	displayName = "Stronghold";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 19 Required, 1 Perk Points";
	description = "Income from controlling gang hideouts is increased.<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
// -- Rebel : Working
class RadiationSuit {
	displayName = "Radiation Suit";
	requiredPerkPoints = 10;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 10 Perk Points";
	description = "Able to buy Radiation Suit<br/><br/><t color='#10FF45'>Surviving Radiation Zones</t>";
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
// -- Paycheck : lvl 1 Pay Rise
class hardworker_1 {
	displayName = "Pay Rise";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 1 Perk Points";
	description = "Your base paycheck is increase.<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
class hardworker_2 {
	displayName = "Pay Rise lvl 2";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "hardworker_1";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Your base paycheck is increase.<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
class hardworker_3 {
	displayName = "Pay Rise lvl 3";
	requiredPerkPoints = 3;
	requiredLevel = 1;
	requiredPerk = "hardworker_2";
	subtitle = "Level 1 Required, 3 Perk Points";
	description = "Your base paycheck is increase.<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
//repair : Working
class mechanic {
	displayName = "Accident Prone";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 1 Perk Points";
	description = "Learn to repair more efficiently<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_repairSpeed_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
class mechanic_2 {
	displayName = "Accident Prone lvl 2";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "mechanic";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Learn to repair more efficiently<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_repairSpeed_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
class mechanic_3 {
	displayName = "Accident Prone lvl 3";
	requiredPerkPoints = 3;
	requiredLevel = 1;
	requiredPerk = "mechanic_2";
	subtitle = "Level 1 Required, 3 Perk Points";
	description = "Learn to repair more efficiently<br/><br/><t color='#10FF45'></t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_repairSpeed_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

// -- Strength : Need Testing
class strength {
	displayName = "Strength";
	requiredPerkPoints = 3;
	requiredLevel = 10;
	requiredPerk = "";
	subtitle = "Level 10 Required, 3 Perk Points";
	description = "Carry weight is increased by 12 for each backpack<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
// -- Endurance : Working
class fooddrink {
	displayName = "Endurance";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 1 Perk Points";
	description = "The rate of dehydration/hunger is reduced.<br/><br/><t color='#10FF45'></t>";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};