_guy = _this select 0;
_marker = createMarkerLocal [format["%1_marker",name _guy],visiblePosition _guy];
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTypeLocal "mil_warning";
_marker setMarkerTextLocal format["SOS-Notruf: %1", _guy getVariable["realname", name _guy]];
0 = _marker spawn {sleep 90; deleteMarkerLocal _this;};
