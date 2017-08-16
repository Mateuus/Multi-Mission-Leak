class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;

	class controlsBackground
	{
		class TabletBCKGRND: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;

		};

		class PlayerTagsHeader : lhm_RscText
		{
			idc = -1;
			text = "$STR_SM_PlayerTags";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = 0.606313;
			y = 0.288619;
			w = 0.214268;
			h = 0.0265319;
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

		class farbfilter: lhm_RscText
		{
			idc = 1014;
			text = "LHM Farbfilter"; //--- ToDo: Localize;
			x = 0.261363;
			y = 0.481482;
			w = 0.15404;
			h = 0.0416835;
		};

		class HeaderSichtweite: lhm_RscText
		{
			idc = 1000;
			text = "Sichtweite"; //--- ToDo: Localize;
			x = 0.274904;
			y = 0.213516;
			w = 0.125;
			h = 0.04;
		};

		class HeaderMoreSettings: lhm_RscText
		{
			idc = 1007;
			text = "Weitere Einstellungen"; //--- ToDo: Localize;
			x = 0.636237;
			y = 0.215151;
			w = 0.25;
			h = 0.04;
		};

		class SideChatHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "$STR_SM_SC";
			shadow = 0;

			x = 0.606061;
			y = 0.368687;
			w = 0.213005;
			h = 0.0248485;
		};

		class RevealNearestHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Rev. N. Objects";

			x = 0.606061;
			y = 0.52862;
			w = 0.213005;
			h = 0.0248486;
		};


		class Auto_View_range : PlayerTagsHeader
		{
			idc = -1;
			text = "A.View Range";

			x = 0.606061;
			y = 0.447812;
			w = 0.213005;
			h = 0.0248485;
		};

		//class Title : lhm_RscTitle
		//{
		//	idc = -1;
		//	colorBackground[] = {0,0,0,0};
		//	text = "$STR_SM_Title";
		//	x = 0.3;
		//	y = 0.2;
		//	w = 0.5;
		//	h = (1 / 25);
		//};
	};

	class controls
	{
		class VDonFoot : lhm_RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";

			x = 0.0811869;
			y = 0.273266;
			w = 0.112626;
			h = 0.04;
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
		class VDinCar : lhm_RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";

			x = 0.0808081;
			y = 0.333333;
			w = 0.112626;
			h = 0.04;
		};

		class VDinAir : lhm_RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";

			x = 0.0808082;
			y = 0.407407;
			w = 0.112626;
			h = 0.04;
		};

		class VD_onfoot_slider : lhm_RscXSliderH
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call lhm_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.20775;
			y = 0.2808;
			w = 0.2625;
			h = 0.04;
		};

		class VD_onfoot_value : lhm_RscText
		{
			idc = 2902;
			text = "";

			x = 0.481061;
			y = 0.272727;
			w = 0.112626;
			h = 0.04;
		};

		class VD_car_slider : lhm_RscXSliderH
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call lhm_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.2045;
			y = 0.3484;
			w = 0.2625;
			h = 0.04;
		};

		class VD_car_value : lhm_RscText
		{
			idc = 2912;
			text = "";

			x = 0.481061;
			y = 0.333333;
			w = 0.112626;
			h = 0.04;
		};

		class VD_air_slider : lhm_RscXSliderH
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call lhm_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.2035;
			y = 0.4196;
			w = 0.2625;
			h = 0.04;
		};

		class VD_air_value : lhm_RscText
		{
			idc = 2922;
			text = "";
			x = 0.479798;
			y = 0.395623;
			w = 0.112626;
			h = 0.04;
		};

		class PlayerTagsONOFF : lhm_RscActiveText
		{
			text = "";
			tooltip = "Playertags AN/AUS";
			idc = 2970;
			sizeEx = 0.04;
			x = 0.854798;
			y = 0.287879;
			w = 0.0652783;
			h = 0.0248484;
		};

		class SideChatONOFF : PlayerTagsONOFF
		{
			idc = 2971;
			tooltip = "Switch Sidechat Channel on/off";
			//action = "[] call lhm_fnc_sidechat;";
			x = 0.85606;
			y = 0.368687;
			w = 0.0652783;
			h = 0.0248484;
		};

		class RevealONOFF : PlayerTagsONOFF
		{
			tooltip = "Automatically reveals nearest objects within 15m, turn this setting off if you are experiencing performance issues.";
			idc = 2972;
			x = 0.856061;
			y = 0.528619;
			w = 0.0652783;
			h = 0.0248484;
		};

		class AutoViewRange : PlayerTagsONOFF
		{
			tooltip = "Depending of your Frames the Game will try to change your Viewrange to get at least around 30 FPS";
			idc = 2975;
			x = 0.854798;
			y = 0.447812;
			w = 0.0652783;
			h = 0.0248484;
		};

		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call lhm_fnc_p_updateMenu;";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};

		class ComboFarbfilter: lhm_RscCombo
		{
			idc = 2100;
			x = 0.152652;
			y = 0.561885;
			w = 0.269444;
			h = 0.0383165;
		};
		class BTNEXEC: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Exec"; //--- ToDo: Localize;
			x = 0.436237;
			y = 0.561684;
			w = 0.0661616;
			h = 0.04;
		};
	};
};