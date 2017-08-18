
class CfgPatches {
	class INSLimitedAdmin_config {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[]={"Extended_Eventhandlers"};
		version = "1.0";
		versionStr = "1.0";
		versionAr[] = {1,0};
	};
};

class Extended_PostInit_EventHandlers {
	class INSLimitedAdmin_config {
		serverInit = "[]ExecVM ""\INSLimitedAdminSettings\INSLimitedAdminServerSettings.hpp"";[] execVM ""\INSLimitedAdmin\init.sqf"";[]ExecVM ""\INSLimitedAdmin\serverrpt.sqf"";[]ExecVM ""\INSLimitedAdminSettings\severexe.sqf"";[] execVM ""\INSLimitedAdmin\antiteleport.sqf"";";
	};
};
