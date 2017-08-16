player switchMove "";
[[player,""],"ES_fnc_animSync",true,false] spawn ES_fnc_MP;
ES_CurChair setVariable ["used",false,true];
player removeAction AufstehenAction;
ES_CurChair=nil;
sitStatus=0;