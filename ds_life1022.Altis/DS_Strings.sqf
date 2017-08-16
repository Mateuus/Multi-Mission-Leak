DS_fnc_strToArray = {
    params [["_string","",[""]]];
    if(_string isEqualTo "")exitWith{[]};

    private _return = _string splitString "";

    _return
};

DS_fnc_strLen = {
    params [["_string","",[""]]];
    if(_string isEqualTo "")exitWith{0};

    private _return = count _string;

    _return
};

DS_fnc_strInStr = {
    params [
        ["_stringA","",[""]],
        ["_stringB","",[""]]
    ];

    private _return = !((_stringA find _stringB) isEqualTo -1);

    _return
};

DS_fnc_strReplace = {
    params [
        ["_string", "", [""]],
        ["_find", "", [""]],
        ["_replace", "", [""]]
    ];

    if (_find isEqualTo "")exitWith{_string};

    private _result = "";
    private _offset = count (_find splitString "");

    while {!((_string find _find) isEqualTo -1)} do {
        private _index = _string find _find;
        _result = _result + (_string select [0, _index]) + _replace;
        _string = _string select [_index + _offset];
    };

    _result + _string
};

DS_fnc_strUpper = {
    params [["_string","",[""]]];
    if(_string isEqualTo "")exitWith{""};

    private _return = toUpper _string;

    _return
};

DS_fnc_strLower = {
    params [["_string","",[""]]];
    if(_string isEqualTo "")exitWith{""};

    private _return = toLower _string;

    _return
};