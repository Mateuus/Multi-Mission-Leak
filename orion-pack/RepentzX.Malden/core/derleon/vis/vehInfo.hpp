	class vehInfo
   	{
		idd=5555;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="vehInfo";
		onLoad="uiNamespace setVariable ['vehInfo',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			
			class gesZrglDistanz: life_RscPicture
			{
				idc = 1200;
				text = "core\derleon\vis\icons\background.jpg";
				x = 0.0101562 * safezoneW + safezoneX;
				y = 0.885 * safezoneH + safezoneY;
				w = 0.165 * safezoneW;
				h = 0.11 * safezoneH;
			};
			
		};
		
		class controls {
		
			class tankvolumen_icon: life_RscPicture
			{
				idc = 1201;
				text = "core\derleon\vis\icons\fuel_icon.paa";
				x = 0.0153125 * safezoneW + safezoneX;
				y = 0.962 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
			};
			
			class reichweite_icon: life_RscPicture
			{
				idc = 1202;
				text = "core\derleon\vis\icons\fuel_icon.paa";
				x = 0.0153125 * safezoneW + safezoneX;
				y = 0.918 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
			};
			
			class gesZrglDistanz_icon: life_RscPicture
			{
				idc = 1203;
				text = "core\derleon\vis\icons\range_icon.paa";
				x = 0.0926562 * safezoneW + safezoneX;
				y = 0.962 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
			};
			
			class tankinfo: Life_RscText
			{
				idc = 1100;
				text = "";
				SizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
				x = 0.0101562 * safezoneW + safezoneX;
				y = 0.885 * safezoneH + safezoneY;
				w = 0.165 * safezoneW;
				h = 0.022 * safezoneH;
				colorBackground[] = {0,0,0,0.4};
			};
			
			class durchschnitt_iconText: Life_RscText
			{
				idc = 1004;
				text = "Ø";
				SizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				x = 0.0926562 * safezoneW + safezoneX;
				y = 0.918 * safezoneH + safezoneY;
				w = 0.0154688 * safezoneW;
				h = 0.022 * safezoneH;
			};
			
			class gesZrglDistanz_display: Life_RscText
			{
				idc = 1003;
				text = "0 km";
				SizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
				x = 0.108125 * safezoneW + safezoneX;
				y = 0.962 * safezoneH + safezoneY;
				w = 0.0876563 * safezoneW;
				h = 0.022 * safezoneH;
			};

			class tankvaloumen_display: Life_RscText
			{
				idc = 1101;
				text = "0 %";
				SizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
				x = 0.0359375 * safezoneW + safezoneX;
				y = 0.962 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.022 * safezoneH;
			};
				
			class reichweite_display: Life_RscText
			{
				idc = 1000;
				text = "0 km";
				SizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
				x = 0.0359375 * safezoneW + safezoneX;
				y = 0.918 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.022 * safezoneH;
			};
				
				class durchschnitt_display: Life_RscText
			{
				idc = 1001;
				text = "0 l/100km";
				SizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
				x = 0.108125 * safezoneW + safezoneX;
				y = 0.918 * safezoneH + safezoneY;
				w = 0.0567187 * safezoneW;
				h = 0.022 * safezoneH;
			};
				
		};		
		
	};