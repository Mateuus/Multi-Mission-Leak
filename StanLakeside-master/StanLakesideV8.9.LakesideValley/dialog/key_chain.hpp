class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_keyMenu; uiNamespace setVariable [""tabletmenu"", _this select 0]; [] spawn life_fnc_cellphone; smsmenuisopen = 1; [] call fnc_fadephone; ";


	class controlsBackground {
		class background: life_RscPicture
		{
			idc = 1200;
			text = "\CG_Client\textures\keychain.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Keys_Title";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
	
		class CTRL_PHONE_BG: RscStructuredText
		{    
			idc = 7017;
			text = "";
			x = 0.320594 * safezoneW + safezoneX;
			y = 0.305 * safezoneH + safezoneY;
			w = 0.35585 * safezoneW;
			h = 0.3512 * safezoneH;
			ColorBackground[] = {1, 1, 1, 1};
		}; 

		class KeyChainList : Life_RscListBox 
		{
			idc = 2701;
			text = "";
			sizeEx = 0.035;
			x = 0.323958 * safezoneW + safezoneX;
			y = 0.368519 * safezoneH + safezoneY;
			w = 0.0777083 * safezoneW;
			h = 0.280926 * safezoneH;
		};

		class CloseButtonKey : Life_RscButtonSilent {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class NearPlayers : Life_RscCombo {
		
		idc = 2702;
		
			x = 0.410937 * safezoneW + safezoneX;
			y = 0.366667 * safezoneH + safezoneY;
			w = 0.0719791 * safezoneW;
			h = 0.0253704 * safezoneH;
		
		};
		
		class DropKey : Life_RscButtonSilent {
			idc = -1;
			text = "$STR_Keys_DropKey";
			onButtonClick = "[] call life_fnc_keyDrop";
			x = 0.411458 * safezoneW + safezoneX;
			y = 0.431482 * safezoneH + safezoneY;
			w = 0.0730208 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		
		class GiveKey : Life_RscButtonSilent {
			idc = 2703;
			text = "$STR_Keys_GiveKey";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_keyGive";
			x = 0.410416 * safezoneW + safezoneX;
			y = 0.393519 * safezoneH + safezoneY;
			w = 0.0730208 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
	};
};