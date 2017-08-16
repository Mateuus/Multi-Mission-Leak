class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_keyMenu;";
	
	class controlsBackground {
		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\phone.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "Key Chain"; //--- ToDo: Localize;
			x = 0.608437 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.2625 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};
	
	class controls {	
		class KeyChainList: Life_RscListBox
		{
			idc = 2701;

			x = 0.548561 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.35 * safezoneH;
		};
		class NearPlayers: Life_RscCombo
		{
			idc = 2702;

			x = 0.565625 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.021 * safezoneH;
		};
		class DropKey: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_keyDrop";

			idc = 1007;
			text = "$STR_Keys_DropKey";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class GiveKey: Life_RscButtonMenu
		{
			idc = 2703;
			onButtonClick = "[] call life_fnc_keyGive";

			text = "$STR_Keys_GiveKey";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			x = 0.601719 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0875 * safezoneH;
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Go back"; //--- ToDo: Localize;
		};
	};
};

