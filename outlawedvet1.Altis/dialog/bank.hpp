class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.35;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.35;
			h = 0.75 - (22 / 250);
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
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_ATM_Title";
			x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class k10Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "10k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,6] spawn life_fnc_bankfast;";
			
			x = 0.36;
			y = 0.46;
			w = (3 / 40);
			h = (1 / 25);
			
			class Attributes 
            {
                align = "center";
            };
		};
		
		class k25Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "25k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,0] spawn life_fnc_bankfast;";
			
			x = 0.44;
			y = 0.46;
			w = (3 / 40);
			h = (1 / 25);
			
			class Attributes 
            {
                align = "center";
            };
		};
		
		class k50Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "50k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,7] spawn life_fnc_bankfast;";
			
			x = 0.52;
			y = 0.46;
			w = (3 / 40);
			h = (1 / 25);
			
			class Attributes 
            {
                align = "center";
            };
		};
		
		class k75Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "75k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,8] spawn life_fnc_bankfast;";
			
			x = 0.60;
			y = 0.46;
			w = (3 / 40);
			h = (1 / 25);
			
			class Attributes 
            {
                align = "center";
            };
		};
		
		class k100Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "100k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,1] spawn life_fnc_bankfast;";
			
			x = 0.36;
			y = 0.51;
			w = (3 / 40);
			h = (1 / 25);
			
			class Attributes 
            {
                align = "center";
            };
		};
		
		class k250Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "250k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,2] spawn life_fnc_bankfast;";
			
			x = 0.44;
			y = 0.51;
			w = (3 / 40);
			h = (1 / 25);
			
			class Attributes 
            {
                align = "center";
            };
		};
		
		class k500Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "500k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,3] spawn life_fnc_bankfast;";
			
			x = 0.52;
			y = 0.51;
			w = (3 / 40);
			h = (1 / 25);
			class Attributes 
            {
                align = "center";
            };
		};
		
		class k750Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "750k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,9] spawn life_fnc_bankfast;";
			
			x = 0.60;
			y = 0.51;
			w = (3 / 40);
			h = (1 / 25);
			class Attributes 
            {
                align = "center";
            };
		};
		
		class WithdrawButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";
			colorBackground[] = {1,0,0,0.75};
			onButtonClick = "[] call life_fnc_bankWithdraw";
			x = 0.36;
			y = 0.562;
			w = (6 / 40);
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class ResetButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Reset";
			colorBackground[] = {0,0,1,0.75};
			onButtonClick = "[0,4] spawn life_fnc_bankfast;";
			x = 0.36;
			y = 0.61;
			w = 0.3;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class DepositButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Deposit";
			colorBackground[] = {0,1,0,0.75};
			onButtonClick = "[] call life_fnc_bankDeposit";
			x = 0.52;
			y = 0.5618;
			w = (6 / 40);
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class moneyEdit : Life_RscEdit {
		
		idc = 2702;
		
		text = "0";
		sizeEx = 0.030;
		x = 0.4; y = 0.41;
		w = 0.2; h = 0.03;
		
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 2703;
			
			x = 0.42; y = 0.68;
			w = 0.2; h = 0.03;
		};
		
		class TransferButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Transfer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_bankTransfer";
			
			x = 0.452;
			y = 0.72;
			w = (5.30 / 40);
			h = (1 / 25);
		};
		
		class GangDeposit : TransferButton
		{
			idc = 2705;
			text = "Deposit to Gang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_gangDeposit";
			y = .77; x = 0.365;
			w = 0.3;
		};
		
		class DepositallButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Deposit Cash";
			colorBackground[] = {0,1,0,0.75};
			onButtonClick = "[0,5] spawn life_fnc_bankfast;";
			x = 0.365;
			y = 0.82;
			w = 0.3;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.95 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};