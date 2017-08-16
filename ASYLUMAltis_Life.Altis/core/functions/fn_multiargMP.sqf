private ["_before", "_function", "_after"];
_before = _this select 0;
_function = _this select 1;
_after = _this select 2;

call compileFinal format["_before %1 _after", _function];