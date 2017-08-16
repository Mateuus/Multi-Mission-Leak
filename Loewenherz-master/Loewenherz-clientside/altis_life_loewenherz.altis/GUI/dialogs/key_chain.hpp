class lhm_key_management {
	idd = 2700;
	name= "lhm_key_chain";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn lhm_fnc_keyMenu;";
	
	class controlsBackground {
		class TabletBCKGRND: lhm_RscPicture 
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;
			
		};
		class PictureClose: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.123737;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
	};
	
	class controls {

		
		class KeyChainList : lhm_RscListBox 
		{
			idc = 2701;
			text = "";
			sizeEx = 0.040;
			
			x = 0.206023;
			y = 0.176514;
			w = 0.5625;
			h = 0.66;
		};

		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call lhm_fnc_p_updateMenu";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};
		class TimeText: lhm_RscText
		{
			idc = 7858;
			SizeEx = 0.027;
			text = "";
			x = 0.930556;
			y = 0.127946;
			w = 0.0534085;
			h = 0.033266;
		};
		
		class NearPlayers : lhm_RscCombo {
		
			idc = 2702;
		
			x = 0.78025;
			y = 0.3328;
			w = 0.168939;
			h = 0.0416836;
		
		};
		
		class DropKey : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_Keys_DropKey";
			onButtonClick = "[] spawn lhm_fnc_keyDrop";
			x = 0.778535;
			y = 0.78404;
			w = 0.171338;
			h = 0.053468;
		};
		
		class GiveKey : lhm_RscButtonMenu {
			idc = 2703;
			text = "$STR_Keys_GiveKey";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_keyGive";
			x = 0.777273;
			y = 0.179596;
			w = 0.171338;
			h = 0.053468;
		};
		class GiveKeyGang : lhm_RscButtonMenu {
			idc = 2704;
			text = "Gang Key";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_keyGiveGang";
			x = 0.777273;
			y = 0.259596;
			w = 0.171338;
			h = 0.053468;
		};
	};
};