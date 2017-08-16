class selfie {

	idd = 5500;
	movingEnable = false;
	enableSimulation = true;
	OnLoad = "[0] spawn life_fnc_selfie";

	class controlsBackground {
	
		class infotext: Life_RscText
		{
			idc = 5504;
			text = "Drücke F12 um ein Foto zu schießen.";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class watermark: Life_RscPicture
		{
			idc = -1;
			text = "images\watermark.paa";
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.187 * safezoneH;
			colorText[] = {1,1,1,0.15};
		};
	};
	
	class controls {
	
		class effectsbox: Life_RscListbox
		{
			idc = 5501;
			OnLbSelChanged = "[1] call life_fnc_selfie";
			SizeEx = 0.035;
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.264 * safezoneH;
		};

		class hidebutton: Life_RscButtonMenu
		{
			idc = 5502;
			text = "HUD ausblenden";
			OnButtonClick = "[2] call life_fnc_selfie";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class showbutton: Life_RscButtonMenu
		{
			idc = 5505;
			text = "HUD einblenden";
			OnButtonClick = "[3] call life_fnc_selfie";
			ColorBackground[] = {1,1,1,0.2};
			ColorText[] = {1,1,1,0.1};
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class close: Life_RscButtonMenu
		{
			idc = 5503;
			text = "Zurück";
			OnButtonClick = "closedialog 0; life_selfiecam cameraEffect ['TERMINATE','BACK']; camDestroy life_selfiecam; 'colorCorrections' ppEffectEnable false; player switchmove ''; (findDisplay 5500) displayRemoveEventHandler ['KeyDown', noesckey]; [] call life_fnc_hudSetup;";
			x = 0.922812 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.0464062 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};