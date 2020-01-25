#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"
#include "cfgPatches.hpp"
#include "dialogs\MasterHandler.hpp"


class cfgFunctions {
	class hst_life_core {
		tag = "hst_life_core";
		class core {
			file = "hst_life_core\functions\core";
			class playerInit {};
			class updateRequest {};
			class serverInit {};
		};
		class visa {
			file = "hst_life_core\functions\visa";
			class dialogVisaCreate {};
			class dialogVisaTablet {};
			class visaCreate {};
			class visaGet {};
			class visaGive {};
			class visaUpdate {};
		};
	};
};

#include "aceConfig.cpp"