#include <macro.h>
if(!alive player || dialog) exitWith {};
createDialog "playerSettings";
disableSerialization;
/*
2011 =  GANG
2012 =  COP WANTED LIST
2013 =  CLE
2014 =  TEL
2021 =  ADMIN
2025 =  CRAFT
2026 =  RENFORT
9800 =  WANTED LIST MANUEL
*/
switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2011,false];
		ctrlShow[2025,false];		
	};	
	case civilian:
	{
		if(GETC(life_tafflevel) != 3) then		{		
		ctrlShow[2012,false];
		ctrlShow[9800,false];
		ctrlShow[2026,false];		
		} else {
		ctrlShow[2011,false];
		ctrlShow[2026,false];			
		};
	};
	case east:
    {
        ctrlShow[2012,false];
        ctrlShow[2011,false];
		ctrlShow[2026,false];			
    };
	case independent:
    {
        ctrlShow[2012,false];
        ctrlShow[2011,false];
		ctrlShow[2025,false];
		ctrlShow[9800,false];
		ctrlShow[2026,false];			
    };
};
if(GETC(bitch_level) < 1) then
{
	ctrlShow[2021,false];
};
[] call life_fnc_p_updateMenu;