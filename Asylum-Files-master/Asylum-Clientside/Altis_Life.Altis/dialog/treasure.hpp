class treasureMap {

	idd = 12000;
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class MainBackground:Life_RscPictureKeepAspect {
			idc = 12005;
			text = "";			
			colorBackground[] = {0, 0, 0, 0};
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		
	};
	
	class controls
	{
		class ButtonClose : Life_RscButtonInvisible {
			idc = -1;
			shortcuts[] = {0x00050000 + 2};
			text = "";
			onButtonClick = "closeDialog 0;";
			x = 0.5 - ((6.25 / 40) / 2);
			y = 1 - 0.15;
			w = (6.25 / 40);
			h = (6.25 / 40);
		};	
	};
};