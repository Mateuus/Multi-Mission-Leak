// Gas Mask Sound Loop file
// this file is used for breathing effect while wearing gasmask, also simulates fatigue when wearing the maskfor to long etc

_gogglearray = ["Mask_M40", "Mask_M40_OD", "Mask_M50"];
_goggles = goggles player;
_breathingLoop = round (random 100);
_checkMask = player getVariable "GasMaskEnable";
if(_checkMask != 2) then {
		while {true} do {
		uiSleep _breathingloop;
        if(!) then {
        	cutText["","BLACK"];
        } else {
        exitwith {};
        };
};
