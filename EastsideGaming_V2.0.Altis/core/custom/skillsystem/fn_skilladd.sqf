_mode = [_this, 0] call BIS_fnc_param;
_skilladd = [_this, 1, 1] call BIS_fnc_param;
switch(true)do {
	case (_mode isEqualTo "repair"): {
		ESG_skill set[0,(ESG_skill select 0)+_skilladd];
		_config = "(ESG_skill select 0) >= (getNumber (_x >> 'from')) && (ESG_skill select 0) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "reparieren");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Reparieren</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 0),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "heal"): {
		ESG_skill set[1,(ESG_skill select 1)+_skilladd];
		_config = "(ESG_skill select 1) >= (getNumber (_x >> 'from')) && (ESG_skill select 1) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "heilung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Heilung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 1),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "stab"): {
		ESG_skill set[2,(ESG_skill select 2)+_skilladd];
		_config = "(ESG_skill select 2) >= (getNumber (_x >> 'from')) && (ESG_skill select 2) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Stabilisierung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 1),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["kupfererz","eisenerz","diamantenerz","salzerz","kohle","silbererz"]): {
		ESG_skill set[9,(ESG_skill select 9)+_skilladd];
		_config = "(ESG_skill select 9) >= (getNumber (_x >> 'from')) && (ESG_skill select 9) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Erzabbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 9),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["apfel","pfirsich","kirsche","banane","weintrauben"]): {
		ESG_skill set[3,(ESG_skill select 3)+_skilladd];
		_config = "(ESG_skill select 3) >= (getNumber (_x >> 'from')) && (ESG_skill select 3) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Fruchtabbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 3),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["heroin","hanfpflanze","kokainstrauch","pilz"]): {
		ESG_skill set[5,(ESG_skill select 5)+_skilladd];
		_config = "(ESG_skill select 5) >= (getNumber (_x >> 'from')) && (ESG_skill select 5) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Drogenabbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 5),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["relikte","schildkroeten","uranerz"]): {
		ESG_skill set[7,(ESG_skill select 7)+_skilladd];
		_config = "(ESG_skill select 7) >= (getNumber (_x >> 'from')) && (ESG_skill select 7) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Schwarzarbeit Abbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 7),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["sand","stein","holz","rohoel","hopfen","maische","fisch"]): {
		ESG_skill set[17,(ESG_skill select 17)+_skilladd];
		_config = "(ESG_skill select 17) >= (getNumber (_x >> 'from')) && (ESG_skill select 17) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Diverse Abbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 17),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["kupferbarren","eisenbarren","diamanten","salz","kohlebriketts","silber"]): {
		ESG_skill set[10,(ESG_skill select 10)+_skilladd];
		_config = "(ESG_skill select 10) >= (getNumber (_x >> 'from')) && (ESG_skill select 10) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Erzverarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 10),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["apfelsaft","pfirsichsaft","kirschsaft","bananensaft","kiba","wein"]): {
		ESG_skill set[4,(ESG_skill select 4)+_skilladd];
		_config = "(ESG_skill select 4) >= (getNumber (_x >> 'from')) && (ESG_skill select 4) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Fruchtverarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 4),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["heroinpulver","hanf","kokainpulver","pilzpulver"]): {
		ESG_skill set[6,(ESG_skill select 6)+_skilladd];
		_config = "(ESG_skill select 6) >= (getNumber (_x >> 'from')) && (ESG_skill select 6) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Drogenverarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 6),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["reliktesauber","schildkroetenfleisch","moonshine","plutonium"]): {
		ESG_skill set[8,(ESG_skill select 8)+_skilladd];
		_config = "(ESG_skill select 8) >= (getNumber (_x >> 'from')) && (ESG_skill select 8) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Schwarzarbeit Verarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 8),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["fischkonserve","holzbrett","glas","benzin","zement","bier"]): {
		ESG_skill set[18,(ESG_skill select 18)+_skilladd];
		_config = "(ESG_skill select 18) >= (getNumber (_x >> 'from')) && (ESG_skill select 18) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Diverse Verarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 18),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "lockpick"): {
		ESG_skill set[11,(ESG_skill select 11)+_skilladd];
		_config = "(ESG_skill select 11) >= (getNumber (_x >> 'from')) && (ESG_skill select 11) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "lockpick");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Dietrich</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 11),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "boltcutter"): {
		ESG_skill set[12,(ESG_skill select 12)+_skilladd];
		_config = "(ESG_skill select 12) >= (getNumber (_x >> 'from')) && (ESG_skill select 12) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "lockpick");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Bolzenschneider</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 12),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "impound"): {
		ESG_skill set[13,(ESG_skill select 13)+_skilladd];
		_config = "(ESG_skill select 13) >= (getNumber (_x >> 'from')) && (ESG_skill select 13) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "impound");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Beschlagnahmen</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 13),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "revive"): {
		ESG_skill set[14,(ESG_skill select 14)+_skilladd];
		_config = "(ESG_skill select 14) >= (getNumber (_x >> 'from')) && (ESG_skill select 14) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "revive");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Wiederbeleben</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 14),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "survive"): {
		ESG_skill set[15,(ESG_skill select 15)+_skilladd];
		_config = "(ESG_skill select 15) >= (getNumber (_x >> 'from')) && (ESG_skill select 15) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "survive");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Überlebenschance</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 15),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "abtasten"): {
		ESG_skill set[16,(ESG_skill select 16)+_skilladd];
		_config = "(ESG_skill select 16) >= (getNumber (_x >> 'from')) && (ESG_skill select 16) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "abtasten");
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#c02525'>Skillfortschritt Abtasten</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,(ESG_skill select 16),_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
};