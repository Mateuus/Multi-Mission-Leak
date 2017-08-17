////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by BoGuu, v1.063, #Goberu)
////////////////////////////////////////////////////////

class casino
{
	idd = 40056;
	movingEnable = 0;
	enableSimulation = 1;
	
	
	class controlsBackground 
	{
		class TitleBackground: Life_RscText
		{
			idc = -1;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.231,0.749,0.89,1};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.473 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: Life_RscText
		{
			idc = -1;
			text = "Slot Machine"; //--- ToDo: Localize;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
		
	class controls
	{
		class SpinButtonIcon: Life_RscPicture
		{
			idc = 40057;
			text = "images\Textures\casino\buttonup.paa";
			x = 0.654687 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0630208 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class SpinButton : Life_RscButtonInvisibleByVoxid {
			idc = 40065;
			text = "";
			onButtonClick = "[] spawn life_fnc_casinoPlay;";
			colorBackground[] = {0,0,0,0};
			x = 0.654687 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0630208 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class Jackpot: Life_RscText
		{
			idc = -1;
			text = "Jackpot:"; //--- ToDo: Localize;
			x = 0.288021 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class JackpotNum: Life_RscText
		{
			idc = 40058;
			text = ""; //--- ToDo: Localize;
			x = 0.333854 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class SlotB1: Life_RscPicture
		{
			idc = 40059;
			text = "images\Textures\casino\slot.jpg"; //--- ToDo: Localize;
			x = 0.288021 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class SlotB2: Life_RscPicture
		{
			idc = 40060;
			text = "images\Textures\casino\slot.jpg"; //--- ToDo: Localize;
			x = 0.408333 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class SlotB3: Life_RscPicture
		{
			idc = 40061;
			text = "images\Textures\casino\slot.jpg"; //--- ToDo: Localize;
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class Slot1: Life_RscPicture
		{
			idc = 40062;
			text = "images\Textures\casino\bar.jpg"; //--- ToDo: Localize;
			x = 0.305208 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class Slot2: Life_RscPicture
		{
			idc = 40063;
			text = "images\Textures\casino\bar.jpg"; //--- ToDo: Localize;
			x = 0.545833 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class Slot3: Life_RscPicture
		{
			idc = 40064;
			text = "images\Textures\casino\bar.jpg"; //--- ToDo: Localize;
			x = 0.425521 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class Cash: Life_RscText
		{
			idc = -1;
			text = "Cash:"; //--- ToDo: Localize;
			x = 0.288021 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class CashNum: Life_RscText
		{
			idc = 40066;
			x = 0.322396 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class Bet: Life_RscText
		{
			idc = -1;
			text = "Bet:"; //--- ToDo: Localize;
			x = 0.288021 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class BetNum: Life_RscText
		{
			idc = 40067;
			x = 0.316667 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class LastWin: Life_RscText
		{
			idc = -1;
			text = "Last Win:"; //--- ToDo: Localize;
			x = 0.288021 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class LastWinNum: Life_RscText
		{
			idc = 40068;
			x = 0.339583 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0973958 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class Close: life_RscButtonMenu2
		{
			idc = -1;
			text = "Close"; //"$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.648958 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.0744792 * safezoneW;
			h = 0.025 * safezoneH;
			colorBackground[] = {0.91,0.22,0.298,1};
		};

	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

