if(!(eM_speak)) then 
{
	eM_speak = true;
	if(ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then
	{
		if((ctrlText ((findDisplay 63) displayCtrl 101) == localize "str_channel_direct")) then
		{
			player setVariable["speak",true,true];
			[] spawn {waitUntil {(isNull findDisplay 63) && (isNull findDisplay 55)}; player setVariable["speak",false,true]; eM_speak = false;};
		}else{
			player setVariable["speak",false,true];
			eM_speak = false;
		};
	}else{
		player setVariable["speak",false,true];
		eM_speak = false;
	};
};