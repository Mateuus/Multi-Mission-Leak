{
private "_a";
_a = toArray _x;
_a resize 15;
	if (toString _a == "_USER_DEFINED #") then 
	{
		deleteMarker _x;
	}
} forEach allMapMarkers;

Hint "All custom player markers removed";