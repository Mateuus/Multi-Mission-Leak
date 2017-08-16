class life_prestige_menu {
	idd = 1700;
	name= "life_prestige_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_prestigeMenu;";
	
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
			idc = 1701;
			text = "Your Specialities";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class PlayersName : Title {
			idc = 1712;
			style = 1;
			text = "";
		};
	};
	
	class controls {

		class SpecList : Life_RscListBox 
		{
			idc = 1702;		
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] call life_fnc_prestigeInfo";
			
			x = 0.12; y = 0.26;
			w = 0.30; h = 0.55;
		};
		
		class SpecInfo : Life_RscStructuredText
		{
			idc = 1703;
			text = "Select a speciality from the list to the left for more information on its requirements and the benefits it brings. You must have enough prestige in order to learn a speciality.";
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
			idc = 1710;
			text = "Learn";
			onButtonClick = "[] call life_fnc_learnPrestige;";
			x = 0.10 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class unLearnButtonKey : Life_RscButtonMenu {
			idc = 1711;
			text = "Unlearn";
			onButtonClick = "[] call life_fnc_unlearnBH;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};