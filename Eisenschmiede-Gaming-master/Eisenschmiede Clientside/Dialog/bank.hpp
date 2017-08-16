class ES_atm_management {
	idd = 2700;
	name= "ES_atm_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class ES_RscTitleBackground: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\Bank_menu.jpg";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.242481 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.528 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};

	class controls {

		class CashTitle: ES_RscStructuredText
		{
			idc = 2701;
			text = "";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.187 * safezoneH;
		};

		class WithdrawButton: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_bankWithdraw";

			x = 0.551562 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Abheben"; //--- ToDo: Localize;
		};

		class DepositButton: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Deposit";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_bankDeposit";

			x = 0.551562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Einzahlen";
		};

		class moneyEdit: ES_RscEdit
		{
			idc = 2702;
			text = "1";
			sizeEx = 0.030;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TransferButton: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Transfer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_bankTransfer";

			x = 0.551562 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Überweisen"; //--- ToDo: Localize;
		};

		class PlayerList: ES_RscListbox
		{
			idc = 2703;
			sizeEx = 0.033;
			font = "PuristaMedium";
			
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.282 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.475 * safezoneH;
		};

		class search : ES_RscEdit
		{
			idc = 9854;
			text = "";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.027 * safezoneH;
			tooltip = "Spieler suchen.";
			onKeyUp = "if(ctrlText 9854 != """") then {[] call ES_fnc_sortlistbank;} else { [] call ES_fnc_atmMenu;}";
			colorBackground[] = {0,0,0,0};
		};

		class GangDeposit : TransferButton
		{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_gangDeposit";

			x = 0.551562 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Auf Gangkonto"; //--- ToDo: Localize;
		};
		/*
		class GangWithdraw : GangDeposit
		{
			idc = 9999;
			text = "Von Gangkonto abheben";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_gangWithdraw";

			x = 0.551562 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Von Gangkonto"; //--- ToDo: Localize;
		};
		*/
		class CloseButtonKey: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Schließen"; //--- ToDo: Localize;
		};
	};
};