class CfgSpawnPoint
{
	class civ
	{
		class civ_spawn_3
		{
			displayName = "Georgetown";
			requirement = "!('rebel' in AN_Licenses)";
		};
		class civ_spawn_1
		{
			displayName = "Harcourt";
			requirement = "('rebel' in AN_Licenses)";
		};
		class civ_spawn_4
		{
			displayName = "Tanoa Airport";
			requirement = "!('rebel' in AN_Licenses)";
		};
		class civ_spawn_6
		{
			displayName = "Masbete";
			requirement = "!('rebel' in AN_Licenses)";
		};
		class civ_spawn_2
		{
			displayName = "Ouméré";
			requirement = "!('rebel' in AN_Licenses)";
		};
		class civ_spawn_5
		{
			displayName = "Port";
			requirement = "!('rebel' in AN_Licenses)";
		};
		class spawn_lawyer_1
		{
			displayName = "Port Law Firm";
			requirement = "('lawyer' in AN_Licenses)";
		};
		class spawn_lawyer_2
		{
			displayName = "Tanouka Law Firm";
			requirement = "('lawyer' in AN_Licenses)";
		};
		class rebel_airstrip_spawn
		{
			displayName = "Rebel Airstrip";
			requirement = "('rebel' in AN_Licenses)";
		};
		class rebel_hideout_spawn
		{
			displayName = "Rebel Hideout";
			requirement = "('rebel' in AN_Licenses)";
		};
		class president_spawn
		{
			displayName = "Presidential Residence";
			requirement = "life_isGov";
		};
		class president_spawn_one
		{
			displayName = "Presidential Safe House";
			requirement = "life_isGov";
		};
		class bodyguard_spawn
		{
			displayName = "Presidential Residence";
			requirement = "life_protectiveDetail";
		};
		class bodyguard_spawn_1
		{
			displayName = "Presidential Safe House";
			requirement = "life_protectiveDetail";
		};
	};

	class west {
		class cop_eponia_spawn_1
		{
			displayName = "Georgetown HQ";
		};
		class cop_spawn_2
		{
			displayName = "Katkoula HQ";
		};
		class coastguard_spawn
		{
			displayName = "Jungle Camp";
			requirement = "(call life_cglevel) > 0";
		};
	};

	class guer {
		class medic_spawn_1
		{
			displayName = "Georgetown Hospital";
		};
		class medic_spawn_2
		{
			displayName = "Ipota Clinic";
		};
		class medic_spawn_3
		{
			displayName = "Harcourt Clinic";
		};
	};
};

class CfgSpawnMenu
{
	animations[] = 
	{
		"HubBriefing_scratch",
		"HubBriefing_stretch",
		"HubBriefing_think",
		"HubBriefing_lookAround1",
		"HubBriefing_lookAround2",
		"HubBriefing_pointAtTable",
		"HubBriefing_pointLeft",
		"HubBriefing_pointRight",
		"HubBriefing_talkAround"
	};

	class Tanoa 
	{
		spawnPoint[] = {8723.513,1250.265,0,194.721};
	};
};	