
class CBA_Extended_EventHandlers;
class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_Actions {
			class ACE_MainActions {
				class LIFE {
					displayName = "Life";
					distance = "1";
					class LIFE_Show_ID {
						displayName = "Przekaz dowod";
						statement = QUOTE([1,_target] spawn hst_life_core_fnc_dialogVisaTablet;);
						priority = 1.0;
					};
				};
			};
		};
	};
};
