class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
		{
		idc = -1;
		x = 0.394443 * safezoneW + safezoneX;
		y = 0.270072 * safezoneH + safezoneY;
		w = 0.240998 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class MainBackground: Life_RscText
		{
		idc = -1;
		x = 0.393961 * safezoneW + safezoneX;
		y = 0.290975 * safezoneH + safezoneY;
		w = 0.24152 * safezoneW;
		h = 0.417059 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
		};
	};
	
	class controls {

		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			x = 0.39;
			y = 0.26;
			w = 0.3;
			h = .14;
		};
		
		class Title: Life_RscTitle
		{
		idc = -1;

		text = "Bank Account Management"; //--- ToDo: Localize;
		x = 0.393961 * safezoneW + safezoneX;
		y = 0.268972 * safezoneH + safezoneY;
		w = 0.106039 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {0.95,0.95,0.95,1};
		};
		
		class k10Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,6] spawn life_fnc_bankfast;";

		idc = 1004;
		text = "10k"; //--- ToDo: Localize;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.422991 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
	class k25Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,0] spawn life_fnc_bankfast;";

		idc = 1005;
		text = "25k"; //--- ToDo: Localize;
		x = 0.53374 * safezoneW + safezoneX;
		y = 0.422991 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
	class k50Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,7] spawn life_fnc_bankfast;";

		idc = 1006;
		text = "50k"; //--- ToDo: Localize;
		x = 0.567479 * safezoneW + safezoneX;
		y = 0.422991 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class k75Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,8] spawn life_fnc_bankfast;";

		idc = 1007;
		text = "75k"; //--- ToDo: Localize;
		x = 0.601219 * safezoneW + safezoneX;
		y = 0.422991 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
	class k100Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,1] spawn life_fnc_bankfast;";

		idc = 1008;
		text = "100k"; //--- ToDo: Localize;
		x = 0.398781 * safezoneW + safezoneX;
		y = 0.455995 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class k250Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,2] spawn life_fnc_bankfast;";
		idc = 1009;
		text = "250k"; //--- ToDo: Localize;
		x = 0.46626 * safezoneW + safezoneX;
		y = 0.455995 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class k500Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,3] spawn life_fnc_bankfast;";

		idc = 1010;
		text = "500k"; //--- ToDo: Localize;
		x = 0.53374 * safezoneW + safezoneX;
		y = 0.455995 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class k750Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,9] spawn life_fnc_bankfast;";

		idc = 1011;
		text = "750k"; //--- ToDo: Localize;
		x = 0.567479 * safezoneW + safezoneX;
		y = 0.455995 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class WithdrawButton: Life_RscButtonMenu
		{
		onButtonClick = "[] call life_fnc_bankWithdraw";

		idc = 1012;
		text = "Withdraw"; //--- ToDo: Localize;
		x = 0.403601 * safezoneW + safezoneX;
		y = 0.511001 * safezoneH + safezoneY;
		w = 0.0578394 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {1,0,0,0.75};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class ResetButton: Life_RscButtonMenu
		{
		onButtonClick = "[0,4] spawn life_fnc_bankfast;";

		idc = 1013;
		text = "Reset"; //--- ToDo: Localize;
		x = 0.47108 * safezoneW + safezoneX;
		y = 0.511001 * safezoneH + safezoneY;
		w = 0.0867592 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,1,0.75};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class DepositButton: Life_RscButtonMenu
		{
		onButtonClick = "[] call life_fnc_bankDeposit";

		idc = 1014;
		text = "Deposit"; //--- ToDo: Localize;
		x = 0.567479 * safezoneW + safezoneX;
		y = 0.511001 * safezoneH + safezoneY;
		w = 0.0578394 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,1,0,0.75};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class moneyEdit: Life_RscEdit
		{
		idc = 2702;

		text = "0"; //--- ToDo: Localize;
		x = 0.463658 * safezoneW + safezoneX;
		y = 0.402968 * safezoneH + safezoneY;
		w = 0.101742 * safezoneW;
		h = 0.0169603 * safezoneH;
		};
		
		class PlayerList: Life_RscCombo
		{
		idc = 2703;

		x = 0.4759 * safezoneW + safezoneX;
		y = 0.588011 * safezoneH + safezoneY;
		w = 0.0771193 * safezoneW;
		h = 0.016502 * safezoneH;
		};
		
		class TransferButton: Life_RscButtonMenu
		{
		onButtonClick = "[] call life_fnc_bankTransfer";

		idc = 1017;
		text = "Transfer"; //--- ToDo: Localize;
		x = 0.48072 * safezoneW + safezoneX;
		y = 0.555007 * safezoneH + safezoneY;
		w = 0.0674793 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class GangDeposit: TransferButton
		{
		idc = 2705;
		onButtonClick = "[] spawn {sleep (random 0.5);[] call life_fnc_gangDeposit};";

		text = "Deposit to Gang"; //--- ToDo: Localize;
		x = 0.403601 * safezoneW + safezoneX;
		y = 0.643017 * safezoneH + safezoneY;
		w = 0.0857143 * safezoneW;
		h = 0.0210095 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class DepositallButton: Life_RscButtonMenu
		{
		onButtonClick = "[0,5] spawn life_fnc_bankfast;";

		idc = 1019;
		text = "Deposit Cash"; //--- ToDo: Localize;
		x = 0.53856 * safezoneW + safezoneX;
		y = 0.643017 * safezoneH + safezoneY;
		w = 0.0867592 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,1,0,0.75};
		class Attributes 
            {
                align = "center";
            };
		};
		
		class CloseButtonKey: Life_RscButtonMenu
		{
		onButtonClick = "closeDialog 0;";

		idc = 1020;
		text = "Close"; //--- ToDo: Localize;
		x = 0.48448 * safezoneW + safezoneX;
		y = 0.676021 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes 
            {
                align = "center";
            };
		};
	class k5Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,6] spawn life_fnc_bankfast;";

		idc = 1023;
		text = "5k"; //--- ToDo: Localize;
		x = 0.46626 * safezoneW + safezoneX;
		y = 0.422991 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
	class k1Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,6] spawn life_fnc_bankfast;";

		idc = 1022;
		text = "1k"; //--- ToDo: Localize;
		x = 0.432521 * safezoneW + safezoneX;
		y = 0.422991 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
	class k150Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,1] spawn life_fnc_bankfast;";

		idc = 1024;
		text = "150k"; //--- ToDo: Localize;
		x = 0.432521 * safezoneW + safezoneX;
		y = 0.455995 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
	class k999Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,9] spawn life_fnc_bankfast;";

		idc = 1025;
		text = "999k"; //--- ToDo: Localize;
		x = 0.601219 * safezoneW + safezoneX;
		y = 0.455995 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
	class k350Button: Life_RscButtonMenu
		{
		onButtonClick = "[0,2] spawn life_fnc_bankfast;";

		idc = 1026;
		text = "350k"; //--- ToDo: Localize;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.455995 * safezoneH + safezoneY;
		w = 0.0289197 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		class Attributes 
            {
                align = "center";
            };
		};
	};
};