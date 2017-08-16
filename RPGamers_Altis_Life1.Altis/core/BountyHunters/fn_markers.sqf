
params [
["_switch",0,[0]],
["_arr",[],[[]]]
];

_arr params [
["_obj",objNull,[objNull]],
["_time",60,[60]],
["_type","Mil_dot",["Mil_dot"]],
["_txt","ROBBERY IN PROGRESS",["ROBBERY IN PROGRESS"]],
["_color","ColorRed",["ColorRed"]]
];

if (isNull _obj) exitWith {};
private _pos = getPos _obj;

private _marker = createMarkerLocal [format["%1_marker",_obj],_pos];
_marker setMarkerColorLocal _color;
_marker setMarkerTypeLocal _type;
_marker setMarkerTextLocal format["%1",_txt];

sleep _time;

deleteMarkerLocal _marker;
