class licenses
{
	idd = 2780;
	name="licenses";
	movingEnabled = 0;
	enableSimulation = 1;
	//onLoad = "ctrlShow [2330,false];";

	class controlsBackground
	{
		class TabletBCKGRND: lhm_RscPicture 
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0195705;
			y = -0.104647;
			w = 1.08561;
			h = 1.18714;
			
		};
		class PictureClose: lhm_RscPicture
		{
			idc = 1206;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.123737;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
	};

	class controls
	{
		class LicenseHeader: lhm_RscText
		{
			idc = 1001;
			text = "$STR_PM_Licenses";
			sizeEx = 0.04;
			x = 0.281187;
			y = 0.165925;
			w = 0.463763;
			h = 0.026734;
		};
		class Licenses_Menu: lhm_RscControlsGroup
		{		
			idc = 2300;
			x = 0.281313;
			y = 0.206532;
			w = 0.4625;
			h = 0.60;
			class controls
			{
				class lhm_Licenses : lhm_RscStructuredText
					{
						idc = 2014;
						sizeEx = 0.020;
						text = "";
						x = 0;
						y = 0;
						w = 0.4625; h = 0.98;
					};
			};
		};
		class BTNClose: lhm_RscButtonSilent
		{
			idc = 1603;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0; [] call lhm_fnc_p_openMenu;";
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
	};
};