player switchMove "";
[player,""] remoteExec ["life_fnc_animSync",0];
life_CurChair setVariable ["used",false,true];
player removeAction AufstehenAction;
life_CurChair=nil;
sitStatus=0;