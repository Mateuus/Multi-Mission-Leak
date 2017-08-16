/*
File: fn_addExp.sqf
Author: Jacob "PapaBear" Tyler
Edited By: [midgetgrimm]
Description:
Add exp to given prof

["Ticket_Prof",_addExpAmount] call lhm_fnc_addExp;
*/
//add exp
_type = param [0,"",[""]];
_amount = param [1,0,[0]];

_profData = missionNamespace getVariable (_type);
//0 = level
//1 = exp

_level = (_profData select 0);//check this
_expold = (_profData select 1);
_nextLevel = 0;
_nextLevel = _level * ( _level - 1) * 500;
if(_nextLevel < 1) then {_nextLevel = 500;};
_exp = _expold + _amount;

if( _exp >= _nextLevel ) then {

    if( _level >= 20 ) then {

        if( _exp >= _nextLevel ) then {
                _exp = _nextLevel;
                missionNamespace setVariable [_type,[(_profData select 0),(_exp)]];
				[format["%1 (Lvl %2)",_type,_level],_nextLevel,_expold,_exp] spawn lhm_fnc_ProfProgress;
        } else {
                missionNamespace setVariable [_type,[(_profData select 0),(_exp)]];
				[format["%1 (Lvl %2)",_type,_level],_nextLevel,_expold,_exp] spawn lhm_fnc_ProfProgress;
        };

    } else {
        _exp = _nextLevel - _exp;
        if(_exp < 0) then{_exp = 0;};
        missionNamespace setVariable [_type,[(_profData select 0) + 1,(_exp)]];
		[format["%1 (Lvl %2)",_type,_level],_nextLevel,_expold,_exp] spawn lhm_fnc_ProfProgress;
        if( _level == 20 ) then {
                _level = (_profData select 0) + 1;
                _text = [_type] call lhm_fnc_varToStr;
                hint parseText format["<t align='center'><t size='1.5'>CONGRATULATIONS!<br/>YOU ARE NOW</t><br/><t color='#FFFF00'><t size='2'>LVL: %1<br/>%2<br/></t></t></t>",_level,_text];
        } else {
                missionNamespace setVariable [_type,[(_profData select 0) + 1,(_exp)]];
                _level = (_profData select 0) + 1;
                _text = [_type] call lhm_fnc_varToStr;
                hint parseText format["<t align='center'><t size='1'>CONGRATULATIONS</t><br/><t color='#FFFF00'><t size='1.5'>%1</t></t><br/><t size='1.5'>ARE NOW AT</t><br/><t color='#0088CC'><t size='1.5'>LVL: %2</t></t></t>",_text,_level];
        };


    };

} else {
    missionNamespace setVariable [_type,[(_profData select 0),(_exp)]];
	[format["%1 (Lvl %2)",_type,_level],_nextLevel,_expold,_exp] spawn lhm_fnc_ProfProgress;
};

// Update Hud Level
lhm_exp_level_prozent = _exp;
lhm_exp_level_prozentMax = _nextLevel;
lhm_exp_level_text = _type;

[] call lhm_fnc_hudUpdate;
