class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back_atm.paa";
			idc = -1;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.528 * safezoneH;
		};
	};

	class controls {

		class CashTitle : Life_RscStructuredText {
			idc = 2701;
			text = "";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.305 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.099 * safezoneH;
		};
	  
		class moneyEdit : Life_RscEdit 
		{
			idc = 2702;
			text = "1";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	  
		class PlayerList : Life_RscListBox 
		{
			idc = 2703;
		   
			x = 0.383 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.286 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
		};

		class WithdrawButton : life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call life_fnc_bankWithdraw";
			
			x = 0.502 * safezoneW + safezoneX;
			y = 0.446 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.031 * safezoneH;
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
			
			x = 0.502 * safezoneW + safezoneX;
			y = 0.5075 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.031 * safezoneH;
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
			
			x = 0.502 * safezoneW + safezoneX;
			y = 0.569 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.031 * safezoneH;
			tooltip = "$STR_ATM_Transfer";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
/*
		class GangWithdraw : TransferButton {
			idc = 2705;
			onButtonClick = "hint "Diese Funktion ist momentan deaktiviert!";"; //[] call life_fnc_gangWithdraw
			
			x = 0.502 * safezoneW + safezoneX;
			y = 0.6315 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.031 * safezoneH;
			tooltip = "$STR_ATM_WithdrawGang";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
*/
		class GangDeposit : TransferButton {
			idc = 2706;
			onButtonClick = "[] call life_fnc_gangDeposit";
			
			x = 0.502 * safezoneW + safezoneX;
			y = 0.6935 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.031 * safezoneH;
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
		   
			x = 0.386 * safezoneW + safezoneX;
			y = 0.245 * safezoneH + safezoneY;
			w = 0.012 * safezoneW;
			h = 0.02 * safezoneH;
			tooltip = "$STR_Global_Close";
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
