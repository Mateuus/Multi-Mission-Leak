//by Basti | John Collins
class ESG_infoMenu
{
	idd = 4354;
	movingEnable = true;
	enableSimulation = 1;
	//onLoad = "[0]spawn ESG_fnc_infoMenu;";
 
	class controlsBackground
	{
		class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_menu.paa";
        	x = 0.17 * safezoneW + safezoneX;
        	y = 0.115 * safezoneH + safezoneY;
        	w = 0.665156 * safezoneW;
        	h = 0.693 * safezoneH;
        };

		class title_bg: life_RscStructuredText
		{
			idc = -1;
			text = "<t font='PuristaBold' align='right' size='1.5'>Infomenü</t>"; //--- ToDo: Localize;
			x = 0.412343 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
	};

	class controls
	{
		class SelContent: life_RscListbox
		{
			idc = 1997;
			onLBSelChanged = "[1] call ESG_fnc_infoMenu;";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.374 * safezoneH;
			sizeEx = 0.039;
			colorSelect[] = {0.753,0.145,0.145,1};
			colorSelect2[] = {0.753,0.145,0.145,1};
		};
		
		class contentcontrols: life_RscControlsGroup
		{
			idc = -1;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.422812 * safezoneW;
			h = 0.506 * safezoneH;

			class Controls
			{
				class Content: life_RscStructuredText
				{
					idc = 121212;
					onLoad = "(_this select 0) ctrlSetStructuredText parsetext ""<t align='center' size='3'>Eastside-Gaming</t>"";";
					text = "";
					x = 0;
					y = 0;
					//x = 0.438125 * safezoneW + safezoneX;
					//y = 0.258 * safezoneH + safezoneY;
					w = 0.402812 * safezoneW;
					h = 2 * safezoneH;
					sizeEx = 0.04;
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};
		class header: life_RscStructuredText
		{
			idc = 1000;
			text = "";
			sizeEx = 0.04;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};

		class ButtonClose: Life_RscButtonMenu
		{
		    idc = -1;
		    text = "Schliessen"; //--- ToDo: Localize;
		    onButtonClick = "closeDialog 0;";
		    x = 0.190625 * safezoneW + safezoneX;
		    y = 0.742 * safezoneH + safezoneY;
		    w = 0.0876563 * safezoneW;
		    h = 0.033 * safezoneH;
		    colorText[] = {1,1,1,1};
		    colorBackground[] = {0.149,0.149,0.149,1};
			colorBackgroundFocused[] = {1,1,1,1};
			colorBackground2[] = {0.753,0.145,0.145,1};
			animTextureOver = "#(argb,8,8,3)color(0.753,0.145,0.145,1)";
		    class Attributes {
		        align = "center";
		    };
		};
	};
};