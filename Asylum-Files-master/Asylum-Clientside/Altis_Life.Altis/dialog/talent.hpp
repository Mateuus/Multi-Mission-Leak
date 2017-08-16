class life_talent_menu {
	idd = 3700;
	name= "life_talent_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_talentMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0.05, 0.05, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3701;
			text = "Your Talents";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class PlayersName : Title {
			idc = 3712;
			style = 1;
			text = "";
		};
	};
	
	class controls {

		class TalentList : Life_RscListBox 
		{
			idc = 3702;		
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] call life_fnc_talentInfo";
			
			x = 0.12; y = 0.26;
			w = 0.30; h = 0.55;
		};
		
		class TalentInfo : Life_RscStructuredText
		{
			idc = 3703;
			text = "Select a talent from the list to the left for more information on its requirements and the benefits it brings. You must have a free talent point in order to learn a talent.  Talent points are gained over time by all manors of gameplay.";
			x = 0.42;
			y = 0.25;
			w = 0.45;
			h = 0.55;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class LearnButtonKey : Life_RscButtonMenu {
			idc = 3710;
			text = "Learn";
			onButtonClick = "[] call life_fnc_learnTalent;";
			x = 0.10 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};