#define ST_LEFT           0x00
#define SL_HORZ           0x400

#define GUI_GRID_CENTER_WAbs		((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs		(GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W		(GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H		(GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X		(safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y		(safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

class colorSelectorUI
{

	idd = 17500;
	enableSimulation = 1;
	enableDisplay = 0;

	class ControlsBackground
	{
		class Background
		{
			idc = -1;
			type = 0;
			style = ST_LEFT;
			x = GUI_GRID_CENTER_X + 0.2;
			y = GUI_GRID_CENTER_Y;
			w = GUI_GRID_CENTER_WAbs*0.6;
			h = GUI_GRID_CENTER_HAbs*0.75;
			colorBackground[] = {0,0,0,0.7};
			colorText[] = {0,0,0,0};
			font = "PuristaMedium";
			sizeEx = GUI_GRID_CENTER_H;
			text = "";
			moving = 1;
		};
		class TitleBackground : Background
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = GUI_GRID_CENTER_X + 0.2;
			y = GUI_GRID_CENTER_Y - 0.047;
			w = GUI_GRID_CENTER_WAbs*0.6;
			h = GUI_GRID_CENTER_H*1;
		};
		
		class Title : Life_RscTitle
		{
			idc = -1;
			text = "Vehicle Information";
			x = GUI_GRID_CENTER_X + 0.2;
			y = GUI_GRID_CENTER_Y - 0.049;
			w = GUI_GRID_CENTER_WAbs*0.6;
			h = GUI_GRID_CENTER_H*1;
		};	
	};

	class Controls
	{
		class _CT_XSLIDER1
		{
			access = 0;
			idc = 17501;
			type = 43;
			style = SL_HORZ;
			default = 0;
			blinkingPeriod = 0;

			x = (GUI_GRID_CENTER_X + 0.2) + ((GUI_GRID_CENTER_WAbs * 0.6) * .25);
			y = 12 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = (GUI_GRID_CENTER_WAbs * 0.6) * .5;
			h = 1 * GUI_GRID_CENTER_H;

			color[] = {1,0,0,.5};
			colorDisabled[] = {1,1,1,0.5};

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "#(argb,8,8,3)color(1,1,1,1)";

			class Title
			{
				idc = -1;
				colorBase[] = {1,1,1,1};
				colorActive[] = {1,0.5,0,1};
			};
			class Value
			{
				idc = -1;
				format = "%.f";
				type = SPTPlain;
				colorBase[] = {1,1,1,1};
				colorActive[] = {1,0.5,0,1};
			};

			onSliderPosChanged = "[_this] call life_fnc_updateUI; false";
		};
		class _RedText: Life_RscText
		{
			idc = 17511;
			x = (GUI_GRID_CENTER_X + 0.2) + ((GUI_GRID_CENTER_WAbs * 0.6) * .25) - 0.065;
			y = 12 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			text = "RED";
		};
		class _RedTextPercent: _RedText
		{
			idc = 17521;
			x = 25 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			text = "0%";
		};				
		class _CT_XSLIDER2: _CT_XSLIDER1
		{
			idc = 17502;
			
			y = 14 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			
			color[] = {0,1,0,.5};
		};
		class _GreenText: Life_RscText
		{
			idc = 17512;
			x = (GUI_GRID_CENTER_X + 0.2) + ((GUI_GRID_CENTER_WAbs * 0.6) * .25) - 0.09;
			y = 14 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			text = "GREEN";			
		};
		class _GreenTextPercent: _GreenText
		{
			idc = 17522;
			x = 25 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			text = "0%";
		};			
		class _CT_XSLIDER3: _CT_XSLIDER1
		{
			idc = 17503;
			
			y = 16 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			
			color[] = {0,0,1,.5};
		};
		class _BlueText: Life_RscText
		{
			idc = 17513;
			x = (GUI_GRID_CENTER_X + 0.2) + ((GUI_GRID_CENTER_WAbs * 0.6) * .25) - 0.075;
			y = 16 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			text = "BLUE";			
		};
		class _BlueTextPercent: _BlueText
		{
			idc = 17523;
			x = 25 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			text = "0%";
		};
		class _ColorSquare
		{
			type = 0;
			idc = 17504;
			style = 0x02;
			
			x = (GUI_GRID_CENTER_WAbs*0.6) / 4;			
			y = (GUI_GRID_CENTER_HAbs*0.75) * .15;
			w = 7 * GUI_GRID_CENTER_W;
			h = 7 * GUI_GRID_CENTER_H;

			text = "";
			sizeEx = GUI_GRID_CENTER_H;
			font = "PuristaMedium";
			lineSpacing = 1;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
		};
		class _PreviewButton: Life_RscButtonMenu
		{
			idc = 17505;
			type = 16;				
			
			x = GUI_GRID_CENTER_X + 0.2;
			w = ((GUI_GRID_CENTER_WAbs * 0.6) / 2.997) - 0.005;
			
			y = GUI_GRID_CENTER_Y + (GUI_GRID_CENTER_HAbs*0.75) + 0.01;
			h = 1 * GUI_GRID_CENTER_H;
			
			text = "Preview";
			
			tooltip = "Preview color on vehicle";
			onButtonClick = "call life_fnc_updateVehicleColor; false";
		};
		class _RequestTestDrive: _PreviewButton
		{
			idc = 17506;
			
			x = GUI_GRID_CENTER_X + 0.2 + ((GUI_GRID_CENTER_WAbs * 0.6) / 2.975);
						
			text = "Request Test Drive";
			
			tooltip = "Sends a request to employees for a test drive";
			onButtonClick = "call life_fnc_updateVehicleColor; createDialog ""selectTestDrive""; false";			
		};
		class _PurchaseVehicle: _PreviewButton
		{
			idc = 17507;
			
			x = GUI_GRID_CENTER_X + 0.2 + (((GUI_GRID_CENTER_WAbs * 0.6) / 2.975) * 2);

			text = "Purchase Vehicle";
			tooltip = "Purchases the vehicle with the chosen paint job";

			onButtonClick = "call life_fnc_updateVehicleColor; createDialog ""creditSalesUI""; false";			
		};
		class _vehicleInfomationList : Life_RscStructuredText
		{
			idc = 17508;
			
			text = "";
			sizeEx = 0.035;
			
			x = 20 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = (GUI_GRID_CENTER_HAbs*0.75) * .15;
			w = 0.5; 
			h = 0.5;
		};			
	};
};