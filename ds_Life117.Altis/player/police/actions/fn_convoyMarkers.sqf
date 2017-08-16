/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Displays markers for police convoys
*/
private ["_position"];

_position = _this select 0;

if(_this select 2)exitWith
	{
	deleteMarkerLocal "convoyMarker";
	};

if(_this select 1)exitWith
	{
	deleteMarkerLocal "convoyMarker";
	_markerlocation = _position;
	_markerobj = createmarkerlocal ["convoyMarker",[0,0]];
	_markername = "convoyMarker";
	_markerobj setmarkershapelocal "Icon";
	"convoyMarker" setmarkertypelocal "hd_warning";
	"convoyMarker" setmarkercolorlocal "colorblack";
	"convoyMarker" setmarkersizelocal [1, 1];
	"convoyMarker" setmarkertextlocal "Convoy End-Point";
	_markername Setmarkerposlocal _markerlocation;
	};

if(isServer)then
	{
	systemchat format ["position = %1",_position];
	};
	
deleteMarkerLocal "convoyMarker";
_markerlocation = _position;
_markerobj = createmarkerlocal ["convoyMarker",[0,0]];
_markername = "convoyMarker";
_markerobj setmarkershapelocal "Icon";
"convoyMarker" setmarkertypelocal "hd_warning";
"convoyMarker" setmarkercolorlocal "colorblack";
"convoyMarker" setmarkersizelocal [1, 1];
"convoyMarker" setmarkertextlocal "Convoy Way-Point";
_markername Setmarkerposlocal _markerlocation;

