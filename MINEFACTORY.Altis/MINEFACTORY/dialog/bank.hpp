class Life_atm_management
{
	idd = 2700;
	name= "life_atm_menu";
	movingenable = 0;
	enableSimulation = true;
	
	class ControlsBackground
	{
		class hintergrund: life_RscText
		{
			idc = 1002;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.302077 * safezoneH + safezoneY;
			w = 0.338021 * safezoneW;
			h = 0.428833 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class bank_icon: life_RscPicture
		{
			idc = 1200;
			text = "MINEFACTORY\icons\ico_bank.paa";
			x = 0.402604 * safezoneW + safezoneX;
			y = 0.335064 * safezoneH + safezoneY;
			w = 0.0229167 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class bar_icon: life_RscPicture
		{
			idc = 1201;
			text = "MINEFACTORY\icons\ico_money.paa";
			x = 0.402604 * safezoneW + safezoneX;
			y = 0.401039 * safezoneH + safezoneY;
			w = 0.0229167 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class hintergrund_gangs: life_RscText
		{
			idc = 1003;
			x = 0.488542 * safezoneW + safezoneX;
			y = 0.478009 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.208919 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};
		
	class Controls
	{
		class bank_text: Life_RscText
		{
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			idc = 1000;
			text = ""; //--- ToDo: ;
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.335064 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class bar_text: Life_RscText
		{
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			idc = 1001;
			text = ""; //--- ToDo: ;
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.401039 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class einzahlen: life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_bankDeposit";
			idc = -1;
			text = "Einzahlen"; //--- ToDo: ;
			x = 0.351042 * safezoneW + safezoneX;
			y = 0.521991 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class auszahlen: life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_bankWithdraw";
			idc = -1;
			text = "Auszahlen"; //--- ToDo: ;
			x = 0.351042 * safezoneW + safezoneX;
			y = 0.565974 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class eingabe: life_RscEdit
		{
			idc = 2702;
			text = "0"; //--- ToDo: ;
			x = 0.351042 * safezoneW + safezoneX;
			y = 0.478009 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class combo: life_RscCombo
		{
			idc = 2703;
			x = 0.351042 * safezoneW + safezoneX;
			y = 0.620953 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class ueberweisen: life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_bankTransfer";
			idc = -1;
			text = "Ueberweisen"; //--- ToDo: ;
			x = 0.351042 * safezoneW + safezoneX;
			y = 0.65394 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class titel_gangs: life_RscText
		{
			idc = 1004;
			text = "Gemeinschaftskonten"; //--- ToDo: ;
			x = 0.488542 * safezoneW + safezoneX;
			y = 0.478009 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class g_auf: life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_gangDeposit";
			idc = 2706;
			text = "Auf GangKonto"; //--- ToDo: ;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.532987 * safezoneH + safezoneY;
			w = 0.131771 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class g_abheben: life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_gangWithdraw";
			idc = 2705;
			text = "Abheben von GangKonto"; //--- ToDo: ;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.609957 * safezoneH + safezoneY;
			w = 0.131771 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class titel: life_RscText
		{
			idc = 1005;
			text = "Zentralbank MineFactory"; //--- ToDo: ;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.280086 * safezoneH + safezoneY;
			w = 0.338021 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class close: life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 2405;
			text = "BEENDEN"; //--- ToDo: ;
			x = 0.585938 * safezoneW + safezoneX;
			y = 0.708919 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
	};
};
