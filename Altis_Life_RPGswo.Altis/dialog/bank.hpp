class DWEV_atm_management {
	 idd = 2700;
	 name= "DWEV_atm_menu";
	 movingEnable = false;
	 enableSimulation = true;
	 onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";
 
class controlsBackground {
	class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};	
};
 
 class controls {
	class bankautomatTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Bankautomat";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		}; 
	
// Fenster der geld anzeige	 
  class CashTitle : DWEV_RscStructuredText
  {
   idc = 2701;
   text = "";
   
   x = 0.5625;
   y = 0.27;
   w = 0.275;
   h = 0.175;
   colorBackground[] = {0,0,0,0};
  };
  
  class WithdrawButton : DWEV_RscButtonMenu 
  {
   idc = -1;
   text = "Abheben";
   onButtonClick = "[] call DWEV_fnc_bankWithdraw";
   
   x = 0.5625;
   y = 0.625;
   w = 0.275;
   h = 0.04;
   colorText[] = {1,1,1,1};
   colorBackground[] = {0,0,0,0.5};
  };
  
  class DepositButton : DWEV_RscButtonMenu 
  {
   idc = -1;
   text = "Einzahlen";
   onButtonClick = "[] call DWEV_fnc_bankDeposit";
   
   x = 0.5625;
   y = 0.55;
   w = 0.275;
   h = 0.04;
   colorBackground[] = {0,0,0,0.5};
  };
  
  class moneyEdit : DWEV_RscEdit 
  {
   idc = 2702;
   text = "1";
   x = 0.5625; 
   y = 0.475;
   w = 0.275; 
   h = 0.04;
   colorBackground[] = {0,0,0,0.5};
  };
  
  class PlayerList : DWEV_RscListBox 
  {
   idc = 2703;
   x = 0.1375;
   y = 0.21;
   w = 0.35;
   h = 0.6795;
   sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
   colorBackground[] = {0,0,0,0};
  };
  
  class TransferButton : DWEV_RscButtonMenu 
  {
   idc = -1;
   text = "Überweisen";
   onButtonClick = "[] call DWEV_fnc_ueberweisung";
   x = 0.5625;
   y = 0.70;
   w = 0.275;
   h = 0.04;
   colorText[] = {1,1,1,1};
   colorBackground[] = {0,0,0,0.5};
  };
  
  class GangDeposit : TransferButton
  {
   idc = 2705;
   text = "In Gang einzahlen ";
   onButtonClick = "[] call DWEV_fnc_gangDeposit";
   
   x = 0.5625;
   y = 0.775;
   w = 0.275;
   h = 0.04;
   colorText[] = {1,1,1,1};
   colorBackground[] = {0,0,0,0.5};
  };

  class GangWithdraw : TransferButton
		{
			idc = 2706;
			text = "Von Gang abheben";
			onButtonClick = "[] call DWEV_fnc_gangWithdraw";
			x = 0.5625;
			y = 0.85;
			w = 0.275;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
  
  class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
		
		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet ausschalten";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
	};
};