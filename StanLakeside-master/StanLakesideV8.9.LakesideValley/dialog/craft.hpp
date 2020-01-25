

class FindPlayer_Menu {
	idd = 1111;
	name= "life_craft";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn fnc_findPlayers;";

	class controlsBackground {
	
		class MainBackground:Life_RscText {
			colorBackground[] = {0.1058823529411765,0.1058823529411765,0.1058823529411765,0.8};
			idc = -1;
			x = 0.05; 
			y = 0.05;
			w = 0.50; 
			h = 0.6;
		};
	};


	class controls {
		
		class Title : Life_RscTitle {

			idc = 1112;
			text = "Wybierz gracza do uleczenia!";
			x = 0.05;
			y = 0.05;
			w = 0.6;
			h = (1 / 25);
		};
		

		class CraftList : Life_RscListBox 
		{
			idc = 1113;
			text = "";
			sizeEx = 0.035;
			x = 0.10; 
			y = 0.10;
			w = 0.25; 
			h = 0.5;
		};

		class HomeOption : Life_RscButtonMenu {
			idc = 1115;
			text = "Wybierz";
			onButtonClick = "[] spawn fnc_chooseUser;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.65;
			w = (6.25 / 40);
			h = (1 / 25);
		};	

		class CraftOption : Life_RscButtonMenu {
			idc = 1116;
			text = "Zamknij";
			onButtonClick = "closedialog 0;";
			x = -0.06 + (13.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.65;
			w = (6.25 / 40);
			h = (1 / 25);
		};	
	};
};




class Life_Craft_Menu {
	idd = 1111;
	name= "life_craft";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""FRESH""] spawn life_fnc_craftMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.1058823529411765,0.1058823529411765,0.1058823529411765,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0.1058823529411765,0.1058823529411765,0.1058823529411765,0.8};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};
	
	class controls {
		
		class Title : Life_RscTitle {

			idc = 1112;
			text = "Crafting Menu!";
			
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class SelectInformation
		{
			idc = 1110;
			type=CT_STRUCTURED_TEXT;
			style=ST_LEFT;
			shadow=false;
			fadein=1;
		  	fadeout=1;
			font="PuristaLight";
			text = "Select an option for more information!";
			size = 0.035;
			sizeEx = 0.035;
			x = 0.45; 
			y = 0.26;
			w = 0.43; 
			h = 0.55;
		};

		class CraftList : Life_RscListBox 
		{
			idc = 1113;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[""REFRESH""] spawn life_fnc_craftMenu;";
			x = 0.12; 
			y = 0.26;
			w = 0.30; 
			h = 0.55;
		};

		class HomeOption : Life_RscButtonMenu {
			idc = 1115;
			text = "Home";
			onButtonClick = "[""FRESH""] spawn life_fnc_CraftMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};	

		class CraftOption : Life_RscButtonMenu {
			idc = 1116;
			text = "Craft Gun";
			onButtonClick = "[""CRAFT""] spawn life_fnc_CraftMenu;";
			x = -0.06 + (13.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};	

		class ProcessOption : Life_RscButtonMenu {
			idc = 1117;
			text = "Open";
			onButtonClick = "[""MENU""] spawn life_fnc_CraftMenu; [""REFRESH""] spawn life_fnc_craftMenu;";
			x = -0.06 + (20.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class MagOption : Life_RscButtonMenu {
			idc = 1118;
			text = "Craft Mag";
			onButtonClick = "[""CRAFTMAG""] spawn life_fnc_CraftMenu;";
			x = -0.06 + (20.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};		

		class CloseOption : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closedialog 0;";
			x = -0.06 + (27.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

	};
};



