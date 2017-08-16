/*
    Darkside Life

	Author: Spooner, PabstMirror

	Description:
	Convert a number into string (avoiding scientific notation)
*/

private ["_isNegative","_return","_dotIndex"];

params [
    ["_number",0,[0]],
    ["_decimalPlaces",0,[0]]
];

_isNegative = _number < 0;
_return = (abs _number) toFixed _decimalPlaces;
_dotIndex = if(_decimalPlaces isEqualTo 0)then{count _return}else{_return find "."};

while {1 > _dotIndex} do {
    _return = "0" + _return;
    _dotIndex = _dotIndex + 1;
};

for "_index" from (_dotIndex - 3) to 1 step -3 do {
    _return = (_return select [0,_index]) + "," + (_return select [_index]);
    _dotIndex = _dotIndex + 1;
};

if(_isNegative)then{_return = "-" + _return;};

_return