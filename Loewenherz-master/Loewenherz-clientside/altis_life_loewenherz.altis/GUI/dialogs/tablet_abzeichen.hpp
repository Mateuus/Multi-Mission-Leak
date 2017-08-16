

class LHM_Abzeichen {

	idd = 2548;
	name = "LHM_Abzeichen";
	movingEnable = true;
	enableSimulation = true;

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
			x = 0.094697;
			y = 0.73569;
			w = 0.1;
			h = 0.1;
		};

	};

	class controls {

		class TimeText: lhm_RscText
		{
			idc = 8888;
			SizeEx = 0.027;
			text = "";
			x = 0.930556;
			y = 0.127946;
			w = 0.0534085;
			h = 0.033266;
		};
		
		class Header_abzeichen: lhm_RscText
		{
			idc = -1;
			text = "Verfuegbare Abzeichen:"; //--- ToDo: Localize;
			x = 0.227273;
			y = 0.191919;
			w = 0.35;
			h = 0.04;
		};
		
		class RscStructuredText_1100: lhm_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.5625;
			y = 0.24;
			w = 0.407576;
			h = 0.493266;
		};
		
		class BTNClose: lhm_RscButtonSilent
		{
			idc = 1603;
			tooltip = "Close";
			onButtonClick = "[] spawn {closeDialog 0; waituntil{!dialog;};[] call lhm_fnc_p_openMenu;};";
			x = 0.0934343;
			y = 0.737374;
			w = 0.1;
			h = 0.1;
		};
		
		class RscListbox_1500: lhm_RscListbox
		{
			idc = 1500;
			sizeex = 0.045;
			onLBselChanged = "[] call lhm_fnc_RANK_MENU_evnthndl;"; 
			x = 0.225;
			y = 0.24;
			w = 0.325;
			h = 0.56;
		};
		
		class BTN_select: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Select"; //--- ToDo: Localize;
			onButtonClick = "[] spawn lhm_fnc_RANK_MENU_btn;";
			x = 0.8625;
			y = 0.76;
			w = 0.1125;
			h = 0.04;
		};

		
	};
};