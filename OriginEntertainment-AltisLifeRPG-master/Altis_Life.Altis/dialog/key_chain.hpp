class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_keyMenu;";
	
	class controlsBackground {
	
	    class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		class MainBackground:Life_RscText {
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
		    colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Keys_Title";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class KeyChainList : Life_RscListBox 
		{
			idc = 2701;
			text = "";
			sizeEx = 0.035;
			
			x = 0.21; y = 0.26;
			w = 0.56; h = 0.370;
		};

		class CloseButtonKey : Life_RscButtonMenu {
		    colorBackground[] = {0, 0, 0, 0.0};
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.797 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class NearPlayers : Life_RscCombo {
		
		idc = 2702;
		
		x = 0.34; y = 0.645;
		w = 0.275; h = 0.03;
		
		};
		
		class DropKey : life_RscButtonMenu {
		    colorBackground[] = {0, 0, 0, 0.0};
			idc = -1;
			text = "$STR_Keys_DropKey";
			onButtonClick = "[] call life_fnc_keyDrop";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.797 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GiveKey : Life_RscButtonMenu {
			idc = 2703;
			text = "$STR_Keys_GiveKey";
			colorBackground[] = {0, 0, 0, 0.0};
			onButtonClick = "[] call life_fnc_keyGive";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.69;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};