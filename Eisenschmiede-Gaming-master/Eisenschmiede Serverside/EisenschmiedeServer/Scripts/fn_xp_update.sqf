switch (playerSide) do {

    case west: {

        _level = 0;

        {
            _level = _forEachIndex;
            if (ES_xp_cop < getNumber(_x >> "xpNeeded")) exitWith {};
        } forEach ("true" configClasses (missionConfigFile >> "CfgXP" >> "levels_COP"));

        if(ES_xp_lvl != _level && ES_xp_lvl != 0) then
        {

            playSound "lvlup";
            [parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.3'>Dein Erfahrungslevel ist gestiegen!</t></t>"],true,nil,4,0.7,0] spawn BIS_fnc_textTiles;

        };

        ES_xp_lvl = _level;

    };

    case independent: {

        _level = 0;

        {
            _level = _forEachIndex;
            if (ES_xp_med < getNumber(_x >> "xpNeeded")) exitWith {};
        } forEach ("true" configClasses (missionConfigFile >> "CfgXP" >> "levels_MED"));

        if(ES_xp_lvl != _level && ES_xp_lvl != 0) then
        {

            playSound "lvlup";
            [parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.3'>Dein Erfahrungslevel ist gestiegen!</t></t>"],true,nil,4,0.7,0] spawn BIS_fnc_textTiles;
        };

        ES_xp_lvl = _level;

    };

    case civilian: {

        _level = 0;

        {
            _level = _forEachIndex;
            if (ES_xp_civ < getNumber(_x >> "xpNeeded")) exitWith {};
        } forEach ("true" configClasses (missionConfigFile >> "CfgXP" >> "levels_CIV"));


        if(ES_xp_lvl != _level && ES_xp_lvl != 0) then
        {

            playSound "lvlup";
            [parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.3'>Dein Erfahrungslevel ist gestiegen!</t></t>"],true,nil,4,0.7,0] spawn BIS_fnc_textTiles;

        };

        ES_xp_lvl = _level;

    };

    default { 

        _level = 0;

    };
};