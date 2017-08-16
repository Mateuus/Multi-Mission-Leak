class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back_atm.paa";
			idc = -1;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.913 * safezoneH;
		};
	};

	class controls {

		class CashTitle : Life_RscStructuredText {
			idc = 2701;
			text = "";
			x = 0.347344 * safezoneW + safezoneX;
			y = 0.430297 * safezoneH + safezoneY;
			w = 0.0989048 * safezoneW;
			h = 0.0871853 * safezoneH;
			sizeEx = "0.022 * safeZoneH";
		};

		class moneyEdit : Life_RscEdit 
		{
			idc = 2702;
			text = "1";
			x = 0.330359 * safezoneW + safezoneX;
			y = 0.54114 * safezoneH + safezoneY;
			w = 0.0995313 * safezoneW;
			h = 0.0247777 * safezoneH;
			sizeEx = "0.022 * safeZoneH";
			onMouseEnter = "";
			style = 0x00 + 0x200;
			colorBackground[] = {0,0,0,0};
		};
	  
		class PlayerList : Life_RscListBox 
		{
			idc = 2703;
		   
			x = 0.45099 * safezoneW + safezoneX;
			y = 0.437704 * safezoneH + safezoneY;
			w = 0.219896 * safezoneW;
			h = 0.128148 * safezoneH;
			sizeEx = "0.022 * safeZoneH";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
		};

		class WithdrawButton : life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call life_fnc_bankWithdraw";
			size = "0.022 * safeZoneH";
			
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.596222 * safezoneH + safezoneY;
			w = 0.0719792 * safezoneW;
			h = 0.0281481 * safezoneH;
			tooltip = "$STR_ATM_Withdraw";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};

		class DepositButton : life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call life_fnc_bankDeposit";
			size = "0.022 * safeZoneH";
			
			x = 0.419062 * safezoneW + safezoneX;
			y = 0.596222 * safezoneH + safezoneY;
			w = 0.0719792 * safezoneW;
			h = 0.0281481 * safezoneH;
			tooltip = "$STR_ATM_Deposit";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};

		class TransferButton : life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call life_fnc_bankTransfer";
			size = "0.022 * safeZoneH";
			
			x = 0.598958 * safezoneW + safezoneX;
			y = 0.596296 * safezoneH + safezoneY;
			w = 0.0719792 * safezoneW;
			h = 0.0281481 * safezoneH;
			tooltip = "$STR_ATM_Transfer";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class GangDeposit : TransferButton {
			idc = 2706;
			onButtonClick = "[] call life_fnc_gangDeposit";
			size = "0.022 * safeZoneH";
			
			x = 0.50927 * safezoneW + safezoneX;
			y = 0.596222 * safezoneH + safezoneY;
			w = 0.0719792 * safezoneW;
			h = 0.0281481 * safezoneH;
			tooltip = "$STR_ATM_DepositGang";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
		   
			x = 0.653646 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0178126 * safezoneW;
			h = 0.0299999 * safezoneH;
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
	};
};
