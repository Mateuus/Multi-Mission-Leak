class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground 
	{		
		class Display: Life_RscPicture
		{
			idc = -1;
			text = "textures\allgemein\wallstreet.paa";
			x = -3.25963e-008;
			y = 0.12;
			w = 1;
			h = 0.76;
		};
	};

	class controls {

		class CashTitle : Life_RscStructuredText {
			idc = 2701;
			text = "";
			x = 0.5625;
			y = 0.22;
			w = 0.275;
			h = 0.18;
			colorBackground[] = {0,0,0,0.8};
		};

		class Title : Life_RscTitle {
			idc = -1;
			text = "$STR_ATM_Title";
			x = 0.5625;
			y = 0.16;
			w = 0.275;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class WithdrawButton : life_RscButtonMenu {
			idc = -1;
			text = "$STR_ATM_Withdraw";
			onButtonClick = "[] call life_fnc_bankWithdraw";
			x = 0.5625;
			y = 0.56;
			w = 0.275;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class DepositButton : life_RscButtonMenu {
			idc = -1;
			text = "$STR_ATM_Deposit";
			onButtonClick = "[] call life_fnc_bankDeposit";
			x = 0.5625;
			y = 0.50;
			w = 0.275;
			h = 0.04;
			colorBackground[] = {0,0,0,0.8};
		};

		class moneyEdit : Life_RscEdit {
			idc = 2702;
			text = "1";
			x = 0.5625; 
			y = 0.43;
			w = 0.275; 
			h = 0.04;
			colorBackground[] = {0,0,0,0.8};
		};
		/*
		class PlayerList : Life_RscCombo {
			idc = 2703;
			x = 0.1375;
			y = 0.16;
			w = 0.35;
			h = 0.6795;
			*//*sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";*/
			/*colorBackground[] = {0,0,0,0.8};
		};*/
		
		class PlayerList : Life_RscCombo {
			idc = 2703;
			x = 0.1375; y = 0.16;
			w = 0.35; h = 0.03;
		};

		class TransferButton : life_RscButtonMenu {
			idc = -1;
			text = "$STR_ATM_Transfer";
			onButtonClick = "[] call life_fnc_bankTransfer";
			x = 0.5625;
			y = 0.62;
			w = 0.275;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class GangWithdraw : TransferButton {
			idc = 2705;
			
			text = "$STR_ATM_DepositGang";
			onButtonClick = "[] call life_fnc_gangWithdraw";
			x = 0.5625;
			y = 0.74;
			w = 0.275;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class GangDeposit : TransferButton {
			idc = 2706;
			text = "$STR_ATM_WithdrawGang";
			onButtonClick = "[] call life_fnc_gangDeposit";
			x = 0.5625;
			y = 0.68;
			w = 0.275;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.5625;
			y = 0.8;
			w = 0.275;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};
