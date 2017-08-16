class RscANLoadingScreen {
	idd = 24001;
	onLoad = "uiNamespace setVariable ['RscANLoadingScreen', _this select 0]";
	onUnload = "uiNamespace setVariable ['RscANLoadingScreen', displayNull]";
	movingEnable = 0;
	enableSimulation = 0;

	class controlsBackground {
		class BlackBackground : Life_RscText {
			idc = -1;
			colorBackground[] = {0, 0, 0, 1};
			x = "safezoneXAbs";
			y = "safezoneY";
			w = "safezoneWAbs";
			h = "safezoneH";
		};

		class Noise : Life_RscPicture {
			idc = -1;
			text = "\sndimg\sahrani\icons\newarmanetworkloading.paa";
			colorText[] = {1, 1, 1, 1};
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
		};
	};

	class controls {
		class MapBackTop : Life_RscText {
      idc = 1000;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "2.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 1};
		};

		class MapName : Life_RscText {
      idc = 1001;
			x = "safezoneX + 0.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "safezoneY";
			w = "safezoneW - 0.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "Tanoa Life";
		};

		class MapAuthor : Life_RscText {
      idc = 1002;
			x = "safezoneX + 0.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "safezoneY + 1.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
      font = "PuristaLight";
			colorText[] = {1, 1, 1, 0.5};
			sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "ArmA.Network";
		};

		class LoadingText : Life_RscText {
			idc = 20002;
			text = "";
			x = "0.283437 * safezoneW + safezoneX";
			y = "0.599 * safezoneH + safezoneY";
			w = "0.433125 * safezoneW";
			h = "0.154 * safezoneH";
			sizeEx = 2 * (0.04);
			style = 2;
			class Attributes
			{
			  align = "center";
				valign = "middle";
			};
		};

		class ProgressMap : Life_RscProgress {
      idc = 104;
			colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
			texture = "#(argb,8,8,3)color(1,1,1,1)";
			x = "safezoneX";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
			w = "safezoneW";
			h = "0.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		/*
		class ProgressMission : ProgressMap {
			idc = 1013;
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "10 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		*/
	};
};
