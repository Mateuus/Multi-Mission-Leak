/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_isSpeaking";
_isSpeaking = !isNull findDisplay 55;

//--- Speaking
if (_isSpeaking) then {
	//--- Speaking in sidechat
	if (currentChannel == 1) then {
		//--- Switch to direct
		setCurrentChannel 5;
	};
};

//--- Update status
if !(player getVariable ["speaking", false] isEqualTo _isSpeaking) then {
	player setVariable ["speaking", _isSpeaking, true]
};
