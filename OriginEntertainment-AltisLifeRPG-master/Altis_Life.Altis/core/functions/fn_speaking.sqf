/*
	File: fn_speaking.sqf
*/

disableSerialization;
while {true} do 
{
	waitUntil
	{
		sleep 1;
		player setVariable["speaking", false, true];
		((!isNull findDisplay 63) && (!isNull findDisplay 55))
	};

	if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then 
	{			
		if ((ctrlText ((findDisplay 63) displayCtrl 101) == localize "str_channel_direct") OR (ctrlText ((findDisplay 63) displayCtrl 101) == "Direct Communication")) then 
		{
			player setVariable["speaking", true, true];
		} else {
			player setVariable["speaking", false, true];
		};
	} else {
		player setVariable["speaking", false, true];
	};
	sleep 0.2;
};