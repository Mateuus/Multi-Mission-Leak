class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_cellphone";
	
	class controlsBackground {

		
		class Voxidphone : Life_RscPicture 
		{
			idc = 3001;
			text = "images\ANL\anl_telephone.paa";
			x = 0.384999;
			y = -0.00433818;
			w = 0.8125;
			h = 1.03676;
		};
	
	};
			
	class controls {
		
		class TextToSend : Life_RscTitle 
		{
		
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 0.605607;
			y = 0.210809;
			w = 0.2725;
			h = 0.04;
		};
		
		   class textEdit : Life_RscEdit 
		{
		
		idc = 3003;
		
		text = "";
		x = 0.607904; y = 0.340086;
		w = 0.325; h = 0.26;
		
		};
		
		class TextMsgButton : life_RscButtonMenu 
		{
			idc = 3015;
			text = "Message";
			colorBackground[] = {0,0.6,0.2,0.7};
			onButtonClick = "[] call TON_fnc_cell_textmsg";
			colorActive[] = {0,0,0,0};
			
			x = 0.6125;
			y = 0.64;
			w = 0.15;
			h = 0.05;
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 3004;
			
			x = 0.6125; y = 0.28;
			w = 0.2375; h = 0.04;
		};

		class TextCopButton : life_RscButtonMenu 
		{
			idc = 3016;
			text = "Police";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_textcop";
			
			x = 0.775;
			y = 0.64;
			w = 0.15;
			h = 0.05;
		};
		
		class TextAdminButton : life_RscButtonMenu 
		{
			idc = 3017;
			text = "Admin";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_textadmin";
			
			x = 0.775;
			y = 0.72;
			w = 0.15;
			h = 0.05;
		};
		
		class AdminMsgButton : life_RscButtonMenu 
		{
			idc = 3020;
			text = "Msg Adm";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_adminmsg";
			
			x = 0.6125;
			y = 0.8;
			w = 0.15;
			h = 0.05;
		};
		
		class AdminMsgAllButton : life_RscButtonMenu 
		{
			idc = 3021;
			text = "Adm All";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			
			x = 0.775;
			y = 0.8;
			w = 0.15;
			h = 0.05;
		};
		
		class EMSRequest : life_RscButtonMenu
		{
			idc = 3022;
			text = "Samu";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "[] call TON_fnc_cell_emsrequest";
			
			x = 0.6125;
			y = 0.72;
			w = 0.15;
			h = 0.05;
		};
		
		class CloseButtonKey : Life_RscButtonInvisibleByVoxid {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0,0,0,0};
			x = 0.743107;
			y = 0.886213;
			w = 0.05;
			h = 0.06;
		};
	};
};