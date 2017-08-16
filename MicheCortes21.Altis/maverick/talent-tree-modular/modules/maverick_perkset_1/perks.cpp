// -- Weapon related perks
class perk_gunsspecialist_lessRecoil_1 {
	displayName = "Rueckstossunterdrueckung";
	requiredPerkPoints = 5;
	requiredLevel = 5;
	requiredPerk = "";
	subtitle = "Level 5 benoetigt, 5 Erfahrungspunkte";
	description = "Lerne, Deine Waffen besser zu kontrollieren<br/><br/><t color='#10FF45'>-5% weniger Rueckstoss</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_2 {
	displayName = "Rueckstossunterdrueckung 2";
	requiredPerkPoints = 6;
	requiredLevel = 16;
	requiredPerk = "perk_gunsspecialist_lessRecoil_1";
	subtitle = "Level 16 benoetigt, 6 Erfahrungspunkte";
	description = "Lerne, Deine Waffen besser zu kontrollieren<br/><br/><t color='#10FF45'>-10% weniger Rueckstoss</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_3 {
	displayName = "Rueckstossunterdrueckung 3";
	requiredPerkPoints = 7;
	requiredLevel = 25;
	requiredPerk = "perk_gunsspecialist_lessRecoil_2";
	subtitle = "Level 25 benoetigt, 7 Erfahrungspunkte";
	description = "Lerne, Deine Waffen besser zu kontrollieren<br/><br/><t color='#10FF45'>-20% weniger Rueckstoss</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

// -- Paycheck
class perk_paycheck_1 {
	displayName = "Gehaltsscheck";
	requiredPerkPoints = 2;
	requiredLevel = 2;
	requiredPerk = "";
	subtitle = "Level 2 benoetigt, 2 Erfahrungspunkte";
	description = "Verdiene mehr Geld<br/><br/><t color='#10FF45'>+25% mehr Geld auf dem Gehaltsscheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_2 {
	displayName = "Gehaltsscheck 2";
	requiredPerkPoints = 3;
	requiredLevel = 8;
	requiredPerk = "perk_paycheck_1";
	subtitle = "Level 8 benoetigt, 3 Erfahrungspunkte";
	description = "Verdiene mehr Geld<br/><br/><t color='#10FF45'>+50% mehr Geld auf dem Gehaltsscheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_3 {
	displayName = "Gehaltsscheck 3";
	requiredPerkPoints = 6;
	requiredLevel = 21;
	requiredPerk = "perk_paycheck_2";
	subtitle = "Level 21 benoetigt, 6 Erfahrungspunkte";
	description = "Verdiene mehr Geld<br/><br/><t color='#10FF45'>+100% mehr Geld auf dem Gehaltsscheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

// -- Faster processing
class perk_processing_1 {
	displayName = "Verarbeitungsgeschwindigkeit";
	requiredPerkPoints = 3;
	requiredLevel = 4;
	requiredPerk = "";
	subtitle = "Level 4 benoetigt, 3 Erfahrungspunkte";
	description = "Lerne, Gegenstaende schneller zu verarbeiten<br/><br/><t color='#10FF45'>+10% schneller verarbeiten</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_2 {
	displayName = "Verarbeitungsgeschwindigkeit 2";
	requiredPerkPoints = 3;
	requiredLevel = 7;
	requiredPerk = "perk_processing_1";
	subtitle = "Level 7 benoetigt, 3 Erfahrungspunkte";
	description = "Lerne, Gegenstaende schneller zu verarbeiten<br/><br/><t color='#10FF45'>+15% schneller verarbeiten</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_3 {
	displayName = "Verarbeitungsgeschwindigkeit 3";
	requiredPerkPoints = 4;
	requiredLevel = 17;
	requiredPerk = "perk_processing_2";
	subtitle = "Level 17 benoetigt, 4 Erfahrungspunkte";
	description = "Lerne, Gegenstaende schneller zu verarbeiten<br/><br/><t color='#10FF45'>+25% schneller verarbeiten</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

// -- Faster lockpicking
class perk_locksmith_1 {
	displayName = "Schloesserknacker";
	requiredPerkPoints = 5;
	requiredLevel = 7;
	requiredPerk = "";
	subtitle = "Level 7 benoetigt, 5 Erfahrungspunkte";
	description = "Lerne, Schloesser und Fahrzeuge schneller zu knacken<br/><br/><t color='#10FF45'>+10% schneller knacken</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_2 {
	displayName = "Locksmith 2";
	requiredPerkPoints = 6;
	requiredLevel = 16;
	requiredPerk = "perk_locksmith_1";
	subtitle = "Level 16 benoetigt, 6 Erfahrungspunkte";
	description = "Lerne, Schloesser und Fahrzeuge schneller zu knacken<br/><br/><t color='#10FF45'>+15% schneller knacken</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_3 {
	displayName = "Locksmith 3";
	requiredPerkPoints = 4;
	requiredLevel = 28;
	requiredPerk = "perk_locksmith_2";
	subtitle = "Level 28 benoetigt, 4 Erfahrungspunkte";
	description = "Lerne, Schloesser und Fahrzeuge schneller zu knacken<br/><br/><t color='#10FF45'>+25% schneller knacken</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};