private["_query"];

_mode = param [0,0,[-1]];

switch (_mode) do {

case 0: {
_cash = param [1,0,[0]];
if(_cash != 0) then {
_cash = [_cash] call DB_fnc_numberSafe;
_query = format["GovernmentUpdateCash:%1",_cash];
[_query,1] call DB_fnc_asyncCall;
};
};

case 1: {
_cash = param [1,0,[0]];
if(_cash != 0) then {
_cash = [_cash] call DB_fnc_numberSafe;
_query = format["GovernmentAddCash:%1",_cash];
[_query,1] call DB_fnc_asyncCall;
};
};

case 2: {
["GovernmentPopularityUp",1] call DB_fnc_asyncCall;
};

case 3: {
["GovernmentPopularityDown",1] call DB_fnc_asyncCall;
};

case 4: {
_taxes = param [1,0,[0]];
life_gov set[2,_taxes];
life_gov set[9,true];
publicVariable "life_gov";
_query = format["GovernmentAdjustTax:%1",_taxes];
[_query,1] call DB_fnc_asyncCall;
};
default {};
};
