/*
class lhm_Object_Builder_Dialog
{
	idd = 8800;
	name="lhm_object_builder_dialog";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[] spawn build_fnc_initDialog;";
	
	class controlsBackground
	{
		class lhm_RscTitleBackground : lhm_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground : lhm_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.7 - (22 / 250);
		};
		
		class Title : lhm_RscTitle
		{
			idc = 8801;
			text = "Loewenherz Object Builder";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class ObjectTitleBox : lhm_RscText
		{
			idc = -1;
			text = "Objects";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.11; y = 0.26;
			w = 0.31;
			h = (1 / 25);
		};
		
		class ObjectInfoHeader : lhm_RscText
		{
			idc = 8820;
			text = "Information";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.422; y = 0.26;
			w = 0.415;
			h = (1 / 25);
		};
		
		class CloseBtn : lhm_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BuyObject : lhm_RscButtonMenu 
		{
			idc = 8810;
			text = "Buy";
			onButtonClick = "[] spawn build_fnc_spawnObject;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
	
	class controls
	{
		class ObjectList : lhm_RscListBox
		{
			idc = 8802;
			text = "";
			sizeEx = 0.031;
			rowHeight = 0.02;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call build_fnc_onLbChanged";
			
			//Position & height
			x = 0.11; y = 0.302;
			w = 0.313; h = 0.49;
		};
		
		class ObjectFilterList : lhm_RscCombo
		{
			idc = 8803;
			x = 0.11; y = 0.8;
			w = 0.313; h = 0.03;
			sizeEx = 0.033;
			onLBSelChanged = "_this call build_fnc_updateDialog";
		};
		
		class ObjectInfomationList : lhm_RscStructuredText
		{
			idc = 8804;
			text = "";
			sizeEx = 0.035;
			
			x = 0.425; y = 0.3;
			w = 0.5; h = 0.5;
		};
	};
};
*/
class lhm_object_builder_dialog
{
	idd = 8800;
	name="lhm_object_builder_dialog";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[] spawn build_fnc_initDialog;";
	
	class controlsBackground
	{
		
		
		
		class Title : lhm_RscTitle
		{
			idc = 2301;
			text = "Loewenherz Basenbau!";
			x = 0.110677 * safezoneW + safezoneX;
			y = 0.32063 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
		};
	
		
		class VehicleInfoHeader : lhm_RscText
		{
			idc = 2330;
			text = "Bau - Informationen";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.626354 * safezoneW + safezoneX;
			y = 0.526629 * safezoneH + safezoneY;
			w = 0.282032 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CloseBtn : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.111719 * safezoneW + safezoneX;
			y = 0.691407 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class BuildObject : lhm_RscButtonMenu 
		{
			idc = 8810;
			text = "$STR_Global_Buy";
			onButtonClick = "[] spawn build_fnc_spawnObject;";
			x = 0.11125 * safezoneW + safezoneX;
			y = 0.661407 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class Objectlist : lhm_RscListBox
		{
			idc = 8802;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call build_fnc_onLbChanged";
			
			//Position & height
			x = 0.108652 * safezoneW + safezoneX;
			y = 0.362389 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.253 * safezoneH;
		};
		
		class Whatlist : lhm_RscCombo
		{
			onLBSelChanged = "_this call build_fnc_updateDialog";
			idc = 8803;
			x = 0.111144 * safezoneW + safezoneX;
			y = 0.622741 * safezoneH + safezoneY;
			w = 0.172709 * safezoneW;
			h = 0.0274445 * safezoneH;
		};
		
		class ObjectInformation : lhm_RscStructuredText
		{
			idc = 8804;
			text = "";
			sizeEx = 0.035;
			
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class SpeedMoving: lhm_RscXSliderH
		{	
			idc = 1910;
			text = "";
			onSliderPosChanged = "LHM_shop_Rotate_speed = (_this select 1) ;";
			tooltip = "Drehgeschwindigkeit einstellen";
			x = 0.415437 * safezoneW + safezoneX;
			y = 0.76488 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};


class lhm_Owner_Gang_Dialog
{
	idd = 8900;
	name="lhm_owner_gang_dialog";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[] spawn build_fnc_initAdminDialog;";
	
	class controlsBackground
	{
		class lhm_RscTitleBackground : lhm_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			text = "Admin Control - Set Gang Owner";
			x = 0.164773;
			y = 0.08;
			w = 0.610354;
			h = 0.0354816;
		};
		
		class MainBackground : lhm_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.162879;
			y = 0.116162;
			w = 0.612626;
			h = 0.834007;
		};
		
		
		class CloseBtn : lhm_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			onButtonClick = "lhm_flagpole_gangId = '-1';closeDialog 0;";
			x = 0.1785;
			y = 0.960883;
			w = 0.1;
			h = 0.04;
		};
		
		
		class OkBtn : lhm_RscButtonMenu
		{
			idc = 5002;
			text = "Confirm";
			//onButtonClick = "lhm_flagpole_gangid = ctrlText 8910; closeDialog 0;";
			x = 0.571035;
			y = 0.121116;
			w = 0.175;
			h = 0.06;
		};
	};
	
	class controls
	{
		class OwnerTextBox : lhm_RscListbox
		{
			idc = 8910;
			sizeEx = 0.040;
			//Position & height
			x = 0.178788;
			y = 0.121684;
			w = 0.375;
			h = 0.82;
		};
	};
};