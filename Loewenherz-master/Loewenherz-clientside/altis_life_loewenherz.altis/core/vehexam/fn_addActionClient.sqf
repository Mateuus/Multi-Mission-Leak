private ["_obj", "_args"];

waitUntil {alive player};     

_obj = _this select 0;
_args = _this select 1;    
if(isNull _obj) then {
    hint "Hey obj not found!";
} else {
    _obj addAction _args;
};