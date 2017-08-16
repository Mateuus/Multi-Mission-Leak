params [
["_type",0,[0]],
["_inventory",[],[[]]],
["_uid","",[""]]
];

if(_uid isEqualTo "") exitWith {};
_query = "";
switch(_type)do {

case 0: {
_inventory = [_inventory] call DB_fnc_mresArray;
_query = format["LockerUpdate:%1:%2",_uid,_inventory];
};

case 1: {
diag_log "CREATING NEW LOCKER";
_query = format["LockerNew:%1",_uid];
};
default {};
};

[_query,1] call DB_fnc_asyncCall;
