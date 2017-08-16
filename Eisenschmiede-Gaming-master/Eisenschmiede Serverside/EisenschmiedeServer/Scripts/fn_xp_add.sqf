private ["_xpAdd"];

params
[
    ["_mode","",["",0]]
];

if(ES_xp_multiplikator > 6) then { ES_xp_multiplikator = 1 };

switch (playerSide) do {

    case west: {

    	_Side = "Polizei";

		if (typeName _mode == typeName "") then
		{
		    _xpAdd = getNumber(missionConfigFile >> "CfgXP" >> "getxp_COP" >> _mode >> "xp");
		}
		else
		{
			_xpAdd = _mode;
		};

		_xpAdd = _xpAdd * ES_xp_multiplikator;

		ES_xp_cop = ES_xp_cop + _xpAdd;

		// [["XPLVL_LOG",[""],profilename,getPlayerUID player,_Side,_xpAdd,_mode,ES_xp_cop,ES_xp_lvl,ES_xp_multiplikator],"ES_fnc_logXP",false,false] call ES_fnc_MP;

    };

    case independent: {

    	_Side = "Feuerwehr";

		if (typeName _mode == typeName "") then
		{
		    _xpAdd = getNumber(missionConfigFile >> "CfgXP" >> "getxp_MED" >> _mode >> "xp");
		}
		else
		{
			_xpAdd = _mode;
		};

		_xpAdd = _xpAdd * ES_xp_multiplikator;

		ES_xp_med = ES_xp_med + _xpAdd;

		// [["XPLVL_LOG",[""],profilename,getPlayerUID player,_Side,_xpAdd,_mode,ES_xp_med,ES_xp_lvl,ES_xp_multiplikator],"ES_fnc_logXP",false,false] call ES_fnc_MP;

    };

    case civilian: {

		_Side = "Zivilist";

		if (typeName _mode == typeName "") then
		{
		    _xpAdd = getNumber(missionConfigFile >> "CfgXP" >> "getxp_CIV" >> _mode >> "xp");
		}
		else
		{
			_xpAdd = _mode;
		};

		_xpAdd = _xpAdd * ES_xp_multiplikator;

		ES_xp_civ = ES_xp_civ + _xpAdd;

		// [["XPLVL_LOG",[""],profilename,getPlayerUID player,_Side,_xpAdd,_mode,ES_xp_civ,ES_xp_lvl,ES_xp_multiplikator],"ES_fnc_logXP",false,false] call ES_fnc_MP;
	};

    default { 

	_ERROR = "ERROR";
	// [["XPLVL_LOG",[""],profilename,getPlayerUID player,_ERROR,_ERROR,_ERROR,_ERROR,_ERROR,_ERROR],"ES_fnc_logXP",false,false] call ES_fnc_MP;
    
    };
};

[] call ES_fnc_xp_update;
[] call ES_fnc_hudUpdate;