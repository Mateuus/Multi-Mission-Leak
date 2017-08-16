params [
["_uid","",[""]],
["_name","",[""]],
["_cash",0,[0]],
["_bank",0,[0]],
["_playTime",0,[0]],
["_gear",[],[[]]],
["_license",[],[[]]],
["_level",0,[0]],
["_exp",0,[0]],
["_skill",[],[[]]],
["_skillP",0,[0]]
];

try
{
if (_uid isEqualTo "" OR {_name isEqualTo ""}) then 
{
throw "Update Civ Request - Details Null";
};

_name = [_name] call DB_fnc_mresString;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;
_gear = [_gear] call DB_fnc_mresArray;
_license = [_license] call DB_fnc_mresArray;
_level = [_level] call DB_fnc_numberSafe;
_exp = [_exp] call DB_fnc_numberSafe;
_skill = [_skill] call DB_fnc_mresArray;
_skillP = [_skillP] call DB_fnc_numberSafe;

private _query = format["playerCivilianUpdate:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11",_name,_cash,_bank,_playTime,_license,_gear,_level,_exp,_skill,_skillP,_uid];
[_query,1] call DB_fnc_asyncCall;
}
catch
{
_exception call AN_server_log;
};
