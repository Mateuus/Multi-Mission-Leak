#include "..\..\macros.hpp"
private["_marker","_einbrechter","_raueber"];
_einbrechter = param [0,ObjNull,[ObjNull]];

_raueber = formatText["%1 bricht in dein Haus ein.",getPlayerDName(_einbrechter)];
_marker = createMarkerLocal ["MarkerRobHaus", position _einbrechter];
"MarkerRobHaus" setMarkerColorLocal "ColorRed";
"MarkerRobHaus" setMarkerTypeLocal "mil_warning";
"MarkerRobHaus" setMarkerTextLocal str(_raueber);