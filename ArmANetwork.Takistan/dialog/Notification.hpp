////////////////////////////////////////////////////////
// ArmA.Network
// Shix (Bobby Jones)
////////////////////////////////////////////////////////
class ANnotification {
	idd = -1;
	fadeout= 0;
	fadein= 0;
	duration = 20;
	name = "ANnotification";
	onLoad = "uiNamespace setVariable ['ANnotification', _this select 0]";

	class controlsBackground {
		class RscPicture_1200: Life_RscPicture
		{
			idc = 1200;
			text = "Notification_Box.paa";
			x = 0.7819702 * safezoneW + safezoneX;
			y = -0.01 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.45959 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			x = 0.83505485 * safezoneW + safezoneX;
			y = 0.159056 * safezoneH + safezoneY;
			w = 0.134069 * safezoneW;
			h = 0.1371978 * safezoneH;
			style = 530;
			linespacing = 1;
			type = 0;
			font = "PuristaMedium";
			align = "centre";
			sizeEx = 0.05;
			shadow = 0;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			class VScrollbar
			{
				color[] = {0.5, 0.5, 0.5, 1};
				width = 0.015;
				autoScrollSpeed = -1;
				autoScrollDelay = 0;
				autoScrollRewind = 0;
				 arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				 arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				 border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				 thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)
			};

			class HScrollbar
			{
				color[] = {1, 1, 1, 1};
				height = 0.028;
			};

			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				 arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				 arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				 border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				 thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)
			};
		};
	};
};
