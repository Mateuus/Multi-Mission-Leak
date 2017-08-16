_mode = [_this, 0] call BIS_fnc_param;
_return = 0.1;
switch(true) do {
	case (_mode isEqualTo "repair"): {
		_config = "(ESG_skill select 0) >= (getNumber (_x >> 'from')) && (ESG_skill select 0) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "reparieren");
		_return = getNumber((_config select 0) >> "time");
	};
	case (_mode isEqualTo "heal"): {
		_config = "(ESG_skill select 1) >= (getNumber (_x >> 'from')) && (ESG_skill select 1) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "heilung");
		_return = getNumber((_config select 0) >> "hp");
	};
	case (_mode isEqualTo "stab"): {
		_config = "(ESG_skill select 2) >= (getNumber (_x >> 'from')) && (ESG_skill select 2) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode in ["kupfererz","eisenerz","diamantenerz","salzerz","kohle","silbererz"]): {
		_config = "(ESG_skill select 9) >= (getNumber (_x >> 'from')) && (ESG_skill select 9) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_erze");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};
	
	case (_mode in ["apfel","pfirsich","kirsche","banane","weintrauben"]): {
		_config = "(ESG_skill select 3) >= (getNumber (_x >> 'from')) && (ESG_skill select 3) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_frucht");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};
	
	case (_mode in ["heroin","hanfpflanze","kokainstrauch","pilz"]): {
		_config = "(ESG_skill select 5) >= (getNumber (_x >> 'from')) && (ESG_skill select 5) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_drogen");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};
	
	case (_mode in ["relikte","schildkroeten","uranerz"]): {
		_config = "(ESG_skill select 7) >= (getNumber (_x >> 'from')) && (ESG_skill select 7) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_schwarz");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};
	
	case (_mode in ["sand","stein","holz","rohoel","hopfen","maische"]): {
		_config = "(ESG_skill select 17) >= (getNumber (_x >> 'from')) && (ESG_skill select 17) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_div");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};

	case (_mode in ["kupferbarren","eisenbarren","diamanten","salz","kohlebriketts","silber"]): {
		_config = "(ESG_skill select 10) >= (getNumber (_x >> 'from')) && (ESG_skill select 10) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_erze");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode in ["apfelsaft","pfirsichsaft","kirschsaft","bananensaft","kiba","wein"]): {
		_config = "(ESG_skill select 4) >= (getNumber (_x >> 'from')) && (ESG_skill select 4) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_frucht");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode in ["heroinpulver","hanf","kokainpulver","pilzpulver"]): {
		_config = "(ESG_skill select 6) >= (getNumber (_x >> 'from')) && (ESG_skill select 6) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_drogen");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode in ["reliktesauber","schildkroetenfleisch","moonshine","plutonium"]): {
		_config = "(ESG_skill select 8) >= (getNumber (_x >> 'from')) && (ESG_skill select 8) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_schwarz");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode in ["fischkonserve","holzbrett","glas","benzin","zement","bier"]): {
		_config = "(ESG_skill select 18) >= (getNumber (_x >> 'from')) && (ESG_skill select 18) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_div");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "lockpick"): {
		_config = "(ESG_skill select 11) >= (getNumber (_x >> 'from')) && (ESG_skill select 11) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "lockpick");
		_return = [(getNumber((_config select 0) >> "time")),(getNumber((_config select 0) >> "chance"))];
	};
	
	case (_mode isEqualTo "boltcutter"): {
		_config = "(ESG_skill select 12) >= (getNumber (_x >> 'from')) && (ESG_skill select 12) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "boltcutter");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "impound"): {
		_config = "(ESG_skill select 13) >= (getNumber (_x >> 'from')) && (ESG_skill select 13) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "impound");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "revive"): {
		_config = "(ESG_skill select 14) >= (getNumber (_x >> 'from')) && (ESG_skill select 14) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "revive");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "survive"): {
		_config = "(ESG_skill select 15) >= (getNumber (_x >> 'from')) && (ESG_skill select 15) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "survive");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "abtasten"): {
		_config = "(ESG_skill select 16) >= (getNumber (_x >> 'from')) && (ESG_skill select 16) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "abtasten");
		_return = getNumber((_config select 0) >> "time");
	};
};
_return;