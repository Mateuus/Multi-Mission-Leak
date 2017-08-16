/*---------------------------------------------------------------------------
File:fn_RageRadio.sqf
Author: RageBone
Description:
Adds its own radiochannel to all chopper pilots and every 
policeman that they can communicate.
---------------------------------------------------------------------------*/
if(isNil{life_radio_air})exitWith{hint "Keine Frequenz vorhanden!";};

switch(_this)do{
	case "cop":
	{
		life_radio_air radioChannelAdd [player];
		Rage_RadioApplyed = true;
	};
	case "on":
	{
		life_radio_air radioChannelAdd [player];
		Rage_RadioApplyed = true;
	};
	case "off":
	{
		if(Rage_RadioApplyed)then{
			life_radio_air radioChannelRemove [player];
			Rage_RadioApplyed = false;
		};
	};
};