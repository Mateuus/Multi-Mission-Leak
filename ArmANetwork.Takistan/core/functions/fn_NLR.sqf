/*
NLR
Kevin Webb
Enforces NLR
*/
private["_msg","_dMarker"];
if(life_is_arrested) exitWith {}; 
//systemChat "Be aware: the New Life Rule is now in effect!";
//_msg = "Alert, this player seems to be violating NLR";
life_lastKnownPos = param [0,[],[[]]];
waitUntil{alive player};
_dMarker = createMarkerLocal["My Death Location",life_lastKnownPos];
_dMarker setMarkerTypeLocal "hd_warning";
_dMarker setMarkerTextLocal "My Death Location - Stay Away!";
_dMarker setMarkerColorLocal "ColorWhite";
NLR = time + 900;
while{alive player && (NLR - time) >= 0} do
{
	if(player distance life_lastKnownPos < 300) then {
	hint "You are close to the scene of your death - be sure to not reengage in the same RP situation.";
	};
	uiSleep 30;
};
life_lastKnownPos = [0,0,0];
deleteMarker _dMarker;