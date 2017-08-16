class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0.05, 0.05, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		class WithdrawButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Withdraw";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_bank_withdraw";
			
			x = 0.432;
			y = 0.46;
			w = (6 / 40);
			h = (1 / 25);
		};
		
		class DepositButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Deposit";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_bank_deposit";
			
			x = 0.432;
			y = 0.512;
			w = (6 / 40);
			h = (1 / 25);
		};
		class DepositAllButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Deposit All";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[true] call life_fnc_bank_deposit";
			
			x = 0.4195;
			y = 0.563;
			w = (7 / 40);
			h = (1 / 25);
		};
		
		class moneyEdit : Life_RscEdit
		{
			idc = 2702;
			text = "1";
			sizeEx = 0.030;
			x = 0.4; y = 0.41;
			w = 0.2; h = 0.03;
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 2703;
			
			x = 0.4; y = 0.61;
			w = 0.2; h = 0.03;
		};
		
		class TransferButton : life_RscButtonMenu 
		{
			idc = 2705;
			text = "Transfer";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_bank_transfer";
			
			x = 0.432;
			y = 0.65;
			w = (5.30 / 40);
			h = (1 / 25);
		};

		class CardButton : life_RscButtonMenu 
		{
			idc = 2710;
			text = "Debit Card ($2500)";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_bank_debit";
			
			x = 0.5 - ((9 / 30) / 2);
			y = 0.702;
			w = (9 / 30);
			h = (1 / 25);
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			
			x = 0.39;
			y = 0.26;
			w = 0.3;
			h = 0.14;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Asylum Credit Union";
			x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
	};
};