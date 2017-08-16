/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Client ran file to recieve comp from an admin
*/

private ["_type","_value"];

_type = _this select 0;
_value = _this select 1;

switch(_type)do {
    case 0: {
        hint format ["An admin has comped $%1 into your bank account",_value];
        systemchat format ["An admin has comped $%1 into your bank account",_value];

        [_value,true,true] spawn DS_fnc_handleMoney;
    };
    case 1: {
        hint format ["An admin has comped %1 tokens into your account",_value];
        systemchat format ["An admin has comped %1 tokens into your account",_value];

        _tempNum = (DS_realEstateArray select 6);
    	_tempNum = _tempNum + _value;
    	DS_realEstateArray set [6,_tempNum];
    };
};

[] call DS_fnc_compileData;