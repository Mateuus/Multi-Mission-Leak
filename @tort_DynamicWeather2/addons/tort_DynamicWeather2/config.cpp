class CfgPatches
	{
	class TORT_DYNAMICWEATHER2
		{
		units[] = { };
		weapons[] = { };
		version = "0.9.7";
		versionStr = "0.9.7";
		versionDesc= "tort_DynamicWeather2";
		versionAr[] = {0,9,7};
		author[] = {"tortuosit"};
		};
	};

class Extended_PostInit_EventHandlers 
	{
	class TORT_DYNAMICWEATHER
		{
		clientInit = "call compile preprocessFileLineNumbers '\@TORT_DYNAMICWEATHER2\script\init.sqf'";
		disableModuload = true;
		};
	}; 

class CfgCommunicationMenu
	{
	class WeatherMenu_main
		{
		text = "Dynamic Weather 2 ...";
		submenu = "#USER:WEATHERMENU_MAIN";
		expression = "";
		icon = "";
		cursor = "";
		enable = "1";
		removeAfterExpressionCall = 1;
		}
	};