class Life_upgrade_car
{
	idd = 5500;
	name = "Life_upgrade_car";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Background : Life_RscText
		{
			idc = 1000;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
		};
		class TitleBackground : Life_RscText
		{
			idc = 1001;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.35,0,0,0.7};
			colorActive[] = {0.35,0,0,0.7};
		};
		class Title : Life_RscText
		{
			idc = 1002;
			text = "Upgrade le Vehicule"; //--- ToDo : Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class InsuranceLabel : Life_RscText
		{
			idc = 1007;
			text = "Assurance :"; //--- ToDo : Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class TrunkLevelLabel : Life_RscText
		{
			idc = 1005;
			text = "Upgrade Coffre :"; //--- ToDo : Localize;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class InsuranceLevelLabel : Life_RscText
		{
			idc = 1008;
			text = "Upgrade Assurance :"; //--- ToDo : Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class SecurityLabel : Life_RscText
		{
			idc = 1009;
			text = "Sucurité :"; //--- ToDo : Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class GPSLabel : Life_RscText
		{
			idc = 1011;
			text = "Tracker GPS :"; //--- ToDo : Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class PriceLabel : Life_RscText
		{
			idc = 1012;
			text = "Prix de l'Upgrade :"; //--- ToDo : Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class TrunkLabel : Life_RscText
		{
			idc = 1003;
			text = "Espace Coffre :"; //--- ToDo : Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
	
	class Controls
	{
		class TrunkSlider : Life_RscSlider
		{
			idc = 5501;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			onSliderPosChanged = "[0] call life_fnc_upgradeMenuChange;";
		};
		class TrunkLevel : Life_RscText
		{
			idc = 5511;
			//text = "4"; //--- ToDo : Localize;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class InsuranceSlider : Life_RscSlider
		{
			idc = 5502;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		//	onSliderPosChanged = "ctrlSetText [5512, round(sliderPosition 5502)];";
			onSliderPosChanged = "[0] call life_fnc_upgradeMenuChange;";

		};
		class InsuranceLevel : Life_RscText
		{
			idc = 5512;
			//text = "3"; //--- ToDo : Localize;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class SecurityCheck : Life_RscCheckbox
		{
			idc = 5503;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			onCheckedChanged = "[0] call life_fnc_upgradeMenuChange;";
		};
		class HooksCheck : Life_RscCheckbox
		{
			idc = 5504;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			onCheckedChanged = "[0] call life_fnc_upgradeMenuChange;";
		};
		class HooksLabel : Life_RscText
		{
			idc = 1010;
			text = "Crochet d'attelage :"; //--- ToDo : Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class GPSCheck : Life_RscCheckbox
		{
			idc = 5505;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			onCheckedChanged = "[0] call life_fnc_upgradeMenuChange;";
		};
		class ConfirmButton : Life_RscButtonMenu
		{
			idc = 2400;
			text = "Confirmer"; //--- ToDo : Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.35,0,0,0.7};
			colorActive[] = {0.35,0,0,0.7};
			onButtonClick = "[0] call life_fnc_upgradeVehicle; closeDialog 0;";
		};
		class CancelButton : Life_RscButtonMenu
		{
			idc = 2401;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.35,0,0,0.7};
			colorActive[] = {0.35,0,0,0.7};
		};
		class Price : Life_RscText
		{
			idc = 5510;
			text = " 0€"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};