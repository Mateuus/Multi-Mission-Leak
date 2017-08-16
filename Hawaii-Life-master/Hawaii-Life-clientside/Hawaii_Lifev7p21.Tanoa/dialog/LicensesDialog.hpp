class LicenseShop {
idd = 5546;
name= "life_license_shop";
movingEnable = false;
enableSimulation = true;
onLoad = "uiNamespace setVariable [""LicenseShop"", _this select 0];";
objects[] = { };
class controls {
		class RscTitleBackground : Life_RscText
		{
			idc = -1;
			text = "Lizensen"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.7};
		};
		class Mainbackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.345313 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class listbox: Life_RscListBox
		{
			idc = 55126;
			sizeEx = 0.03;
			x = 0.350468 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.341 * safezoneH;
		};
		class ShowLicenseslistbox: Life_RscListBox
		{
			idc = 55131;
			sizeEx = 0.03;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.341 * safezoneH;
		};
		class MyLicenses : Life_RscText
		{
			idc = 55130;
			text = "Erhältlich"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1.5 * 0.03;
		};
		class ShowLicenses : Life_RscText
		{
			idc = 55129;
			text = "Meine Lizensen"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1.5 * 0.03;
		};
		class buybutton: Life_RscButtonMenu
		{
			idc = 55127;
			text = "$STR_Global_Buy";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			action = "if( (lbData[55126,lbCurSel (55126)] != """") ) then { [false, false, false, lbData[55126,lbCurSel (55126)]] call life_fnc_buyLicense; closeDialog 0; };";
		};
	};
};