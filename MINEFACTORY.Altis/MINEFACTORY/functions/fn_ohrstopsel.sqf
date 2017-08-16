/*################################
#	(c) 2016 Minefactory         #
#								 #
#	Author: PierreAmyf      	 #
#	Lizenz: Lizenz.txt Lesen!	 #
################################*/

life_fadeSound = !life_fadeSound;

	if (life_fadeSound) then 
	{
		1 fadeSound 0.1;
		call life_fnc_hudUpdate;
		["Du hast die ohrstöpsel rein gemacht."] spawn life_fnc_nachricht;
	} else {
		1 fadeSound 1;
		call life_fnc_hudUpdate;
		["Du hast die ohrstöpsel wieder raus genommen."] spawn life_fnc_nachricht;
	};