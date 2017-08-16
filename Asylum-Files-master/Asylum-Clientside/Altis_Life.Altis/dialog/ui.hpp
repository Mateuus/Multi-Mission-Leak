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
		{};
			
		class controls
		{
			class hudtext : Life_RscStructuredText
			{
				idc=23515;
				x=0;
				y=1;
				w=1;
				h=0.04;
				colorBackground[]={0,0,0,0};
				colorText[]={1,1,1,0.8};
				text="";
				sizeEx=0.03;
				class Attributes {
					font="PuristaSemibold";
					color="#FFFFFF";
					shadow=true;
					shadowColor="#000000";
					size="1";
				};
			};
			class hudhead : Life_RscStructuredText
			{
				idc=23525;
				x=0;
				y=0;
				w=1;
				h=0.04;
				colorBackground[]={0,0,0,0};
				text="";
				sizeEx=0.03;
				class Attributes {
					font="EtelkaMonospaceProBold";
					color="#FFFFFF";
					shadow=true;
					shadowColor="#000000";
					size="1";
				};
			};
		};   
 	};