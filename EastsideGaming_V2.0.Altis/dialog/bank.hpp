class Life_atm_management {
    idd = 2700;
    name= "life_atm_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_menu.paa";
        	x = 0.17 * safezoneW + safezoneX;
        	y = 0.115 * safezoneH + safezoneY;
        	w = 0.665156 * safezoneW;
        	h = 0.693 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Bankautomat</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class trenner: Life_RscText
        {
        	idc = -1;
        	x = 0.390687 * safezoneW + safezoneX;
        	y = 0.203 * safezoneH + safezoneY;
        	w = 0.004125 * safezoneW;
        	h = 0.539 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,1};
        };
    };

    class controls {
        class btn_close: Life_RscButtonMenu
        {
        	idc = 2402;
        	text = "Schliessen"; //--- ToDo: Localize;
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.753 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "closeDialog 0;";
        };
        class CashTitle: Life_RscStructuredText
        {
          idc = 2701;
          text = "";
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.165 * safezoneW;
        	h = 0.143 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class Life_RscEdit_1400: Life_RscEdit
        {
          idc = 2702;
          text = "1";
          sizeEx = 0.030;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.368 * safezoneH + safezoneY;
        	w = 0.0979687 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class WithdrawButton: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Abheben"; //--- ToDo: Localize;
          onButtonClick = "[] call life_fnc_bankWithdraw";
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.401 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class DepositButton: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Einzahlen"; //--- ToDo: Localize;
          onButtonClick = "[] call life_fnc_bankDeposit";
        	x = 0.273125 * safezoneW + safezoneX;
        	y = 0.401 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class max_withdraw: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Max."; //--- ToDo: Localize;
          onButtonClick = "ctrlSetText [2702,'999999'];";
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.445 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class max_deposit: Life_RscButtonMenu
        {
        	idc = 2404;
        	text = "Max."; //--- ToDo: Localize;
        	x = 0.273125 * safezoneW + safezoneX;
        	y = 0.445 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "if(life_cash <= 999999)then {ctrlSetText [2702,format['%1',life_cash]];}else{ctrlSetText [2702,'999999'];};";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class PlayerList: Life_RscListbox
        {
        	idc = 2703;
			sizeEx = 0.035;
        	x = 0.54125 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.528 * safezoneH;
        };
        class edit_transfer: Life_RscEdit
        {
        	idc = 1401;
			text = "1";
        	x = 0.438125 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.0979687 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class TransferButton: Life_RscButtonMenu
        {
        	idc = 2405;
        	text = "Überweisen"; //--- ToDo: Localize;
          onButtonClick = "[] call life_fnc_bankTransfer";
        	x = 0.438125 * safezoneW + safezoneX;
        	y = 0.247 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };
};
