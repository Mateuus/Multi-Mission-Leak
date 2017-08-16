	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			class asylumIcon : life_RscPicture
			{
				idc = 23510;
				text = "icons\asylum.paa";
				colorText[] = {1,1,1,0.75};
				x = safeZoneX+safeZoneW-0.37; y = safeZoneY+safeZoneH-0.065;
				w = 0.3; h = 0.0581;
			};
		};
			
		class controls
		{
			class hudtext : Life_RscStructuredText
			{
				idc=23515;
				x=-1;
				y=-1;
				w=0.17;
				h=0.4;
				colorBackground[]={0,0,0,0};
				text="";
				sizeEx=0.035;
				class Attributes {
					font="PuristaSemibold";
					color="#FFFFFF";
					shadow=true;
					shadowColor="#000000";
					size="1";
				};
			};
			class hudfooter : Life_RscStructuredText
			{
				idc=23525;
				x=-1;
				y=-1;
				w=0.5;
				h=0.04;
				colorBackground[]={0,0,0,0};
				text="";
				sizeEx=0.035;
				class Attributes {
					font="PuristaSemibold";
					color="#FFFFFF";
					shadow=true;
					shadowColor="#000000";
					size="1";
				};
			};
		};   
 	};