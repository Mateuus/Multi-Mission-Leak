class bank_chat_dialog {
	idd = 9560;
	name= "bank_chat_dialog";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn lhm_fnc_bankChatDialog;";
	
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

		class BLAH: lhm_RscStructuredText
		{
			idc = 1500;
			text = "";
			sizeEx = 0.01;
			x = 0.254924;
			y = 0.17495;
			w = 0.696591;
			h = 0.664175;
		};
		
		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
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
		
		class Okbutton: lhm_RscButtonMenu
		{
			idc = 2400;
			x = 0.106;
			y = 0.18;
			w = 0.131566;
			h = 0.0511784;
		};
	};
};