class TrunkMenu
{
	idd = 3500;
	name = "TrunkMenu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{

		class RscTitleText : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0.3, 1};
			idc = 3501;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = 0.04;
		};
		
		class RscBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.25;
			w = 0.8;
			h = 0.6;
		};
		
		class RscTrunkText : Life_RscStructuredText
		{
			idc = 3504;
			colorBackground[] = {0, 0, 0.3, 1};
			text = "";
			sizeEx = 0.04;
			x = 0.11;
			y = 0.26;
			w = 0.38;
			h = 0.04;
		};
		
		class RscPlayerText : Life_RscStructuredText
		{
			idc = 3507;
			colorBackground[] = {0, 0, 0.3, 1};
			text = "";
			sizeEx = 0.04;
			x = 0.51;
			y = 0.26;
			w = 0.38;
			h = 0.04;
		};	
	};
	
	class Controls
	{
		class TrunkGear : Life_RscListBox
		{
			idc = 3502;
			sizeEx = 0.04;
			x = 0.11;
			y = 0.31;
			w = 0.38;
			h = 0.48;
		};
		
		class PlayerGear : Life_RscListBox
		{
			idc = 3503;
			sizeEx = 0.04;
			x = 0.51;
			y = 0.31;
			w = 0.38;
			h = 0.48;
		};
		
		class TrunkEdit : Life_RscEdit
		{
			idc = 3505;
			text = "1";
			sizeEx = 0.04;
			x = 0.11;
			y = 0.8;
			w = 0.09;
			h = 0.04;
		};
		
		class PlayerEdit : Life_RscEdit
		{
			idc = 3506;
			text = "1";
			sizeEx = 0.04;
			x = 0.51;
			y = 0.8;
			w = 0.09;
			h = 0.04;
		};
		
		class MaxButt1 : Life_RscButtonMenu
		{
			idc = -1;
			text = "Max.";
			colorBackground[] = {0.2, 0.6, 1, 1};
			onButtonClick = "[] call Life_fnc_vehTakeAllItem;";
			x = 0.21;
			y = 0.8;
			w = 0.09;
			h = 0.04;
		};
		
		class MaxButt2 : Life_RscButtonMenu
		{
			idc = -1;
			text = "Max.";
			colorBackground[] = {0.2, 0.6, 1, 1};
			onButtonClick = "[] call Life_fnc_vehStoreAllItem;";
			x = 0.61;
			y = 0.8;
			w = 0.09;
			h = 0.04;
		};
		
		class TakeItem : Life_RscButtonMenu
		{
			idc = -1;
			text = "Nehmen";
			colorBackground[] = {0.2, 0.6, 1, 1};
			onButtonClick = "[] call life_fnc_vehTakeItem;";
			x = 0.31;
			y = 0.8;
			w = 0.18;
			h = 0.04;
		};
		
		class StoreItem : Life_RscButtonMenu
		{
			idc = -1;
			text = "Lagern";
			colorBackground[] = {0.2, 0.6, 1, 1};
			onButtonClick = "[] call life_fnc_vehStoreItem;";
			x = 0.71;
			y = 0.8;
			w = 0.18;
			h = 0.04;
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0; [] spawn SOCK_fnc_updateRequest;";
			x = 0.7;
			y = 0.86;
			w = 0.2;
			h = 0.04;
		};
	};
};