class lhm_atm_management {
	idd = 2700;
	name= "lhm_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class lhm_RscTitleBackground:lhm_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			text = "$STR_ATM_Title";
			idc = -1;
			x = 0.175;
			y = 0.06;
			w = 0.5875;
			h = 0.04;
		};
		
		class MainBackground:lhm_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.17399;
			y = 0.108013;
			w = 0.5875;
			h = 0.78;
		};
	};
	
	class controls {

		class CashTitle : lhm_RscStructuredText
		{
			idc = 2701;
			text = "";
			
			x = 0.50404;
			y = 0.119529;
			w = 0.25;
			h = 0.16;
		};
		
		//class Title : lhm_RscTitle {
	//		colorBackground[] = {0, 0, 0, 0};
	//		idc = -1;
	//		text = "$STR_ATM_Title";
	//		x = 0.35;
	//		y = 0.2;
	//		w = 0.6;
	//		h = (1 / 25);
	//	};
		
		class WithdrawButton : lhm_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_bankWithdraw";
			
			x = 0.508712;
			y = 0.37771;
			w = 0.2375;
			h = 0.06;
		};
		
		class DepositButton : lhm_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Deposit";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_bankDeposit";
			
			x = 0.508838;
			y = 0.458317;
			w = 0.2375;
			h = 0.06;
		};
		
		class moneyEdit : lhm_RscEdit {
		
		idc = 2702;
		
		text = "1";
		sizeEx = 0.030;
		x = 0.509975;
		y = 0.297912;
		w = 0.2375;
		h = 0.06;
		
		};
		
		class PlayerList : lhm_RscListbox 
		{
			idc = 2703;
			sizeEx = 0.040;
			x = 0.17803;
			y = 0.111987;
			w = 0.3125;
			h = 0.76;
		};
		
		class TransferButton : lhm_RscButtonMenu 
		{
			idc = 2704;
			text = "$STR_ATM_Transfer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_bankTransfer";
			
			x = 0.508725;
			y = 0.6164;
			w = 0.2375;
			h = 0.06;
		};
		
		class GangDeposit : lhm_RscButtonMenu 
		{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_gangDeposit";
			x = 0.508838;
			y = 0.535354;
			w = 0.2375;
			h = 0.06;
		};
		
		class CloseButtonKey : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.170328;
			y = 0.898115;
			w = 0.1375;
			h = 0.06;
		};
	};
};