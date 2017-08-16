while {true} do
{
	waitUntil
	{
		uiSleep 1;
		player setVariable["SpeakingInGame", false, true];
		((!isNull findDisplay 63) && (!isNull findDisplay 55))
	};

	if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then
	{
		_chatType = ctrlText ((findDisplay 63) displayCtrl 101);
		if ((_chatType == localize "str_channel_direct") OR (_chatType == "Direct Communication")) then
		{
			player setVariable["SpeakingInGame", true, true];
		}
		else
		{
			player setVariable["SpeakingInGame", false, true];
		};
	}
	else
	{
		player setVariable["SpeakingInGame", false, true];
	};
	uiSleep 0.5;
};