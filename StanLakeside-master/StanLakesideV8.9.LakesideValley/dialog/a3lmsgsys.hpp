class A3L_Messages
{
		idd = -1;
		duration = 1e+012;
		onLoad = "uiNamespace setVariable [""A3L_messages_display"", _this select 0]";
		class Controls
		{
			class messages: Life_RscStructuredText
			{
				idc = 100;
				style = 256;
				colorText[] = {0,0,0,1};
				colorBackground[] = {0,0,0,0};
				colorShadow[] = {0.2,0.2,0.2,1};
				size = 0.06;
				sizeEx = 0.03;
				x = "safeZoneX";
				y = "safeZoneY + safeZoneH*1/3";
				w = "0.6 * safeZoneW";
				h = "0.03 * 8";
				text = "Message 1<br />Message 2";
				class Attributes
				{
					font = "EtelkaNarrowMediumPro";
					color = "#ffffff";
					align = "left";
					valign = "middle";
					shadow = 1;
					shadowColor = "#333333";
					size = 1;
				};
			};
		};
};