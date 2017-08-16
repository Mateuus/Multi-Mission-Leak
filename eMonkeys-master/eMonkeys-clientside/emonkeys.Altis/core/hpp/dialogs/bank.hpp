class EMonkeys_atm_management 
{
	idd = 2700;
	name= "EMonkeys_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_atmMenu.paa";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.469219 * safezoneW;
			h = 0.836 * safezoneH;
		};
	};
	
	class controls 
	{
		class CashTitle : EMonkeys_RscStructuredText
		{
			idc = 2701;
			text = "";
			font = PuristaMedium;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.064 * safezoneH;
		};
		
		class WithdrawButton : EMonkeys_RscButtonMenu 
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] spawn EMonkeys_fnc_bankWithdraw";
			x = 0.524281 * safezoneW + safezoneX;
			y = 0.496 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.019 * safezoneH;
		};
		
		class DepositButton : EMonkeys_RscButtonMenu 
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] spawn EMonkeys_fnc_bankDeposit";
			x = 0.524281 * safezoneW + safezoneX;
			y = 0.520 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.019 * safezoneH;
		};

		class TransferButton : EMonkeys_RscButtonMenu 
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] spawn EMonkeys_fnc_bankTransfer";
			x = 0.524281 * safezoneW + safezoneX;
			y = 0.545 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.019 * safezoneH;
		};
		
		class moneyEdit : EMonkeys_RscEdit 
		{
			idc = 2702;
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.524481 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class PlayerList: EMonkeys_RscListbox
		{
			idc = 2703;
			sizeEx = 0.03;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.294 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.272 * safezoneH;
		};
		
		class CloseButtonKey : EMonkeys_RscButtonMenu 
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.655688 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};