#include <macro.h>
/*
	std / hooker / prostitute
*/
if(life_std == 1) exitWith { ["Juz jestes gotowy na seks.", false] spawn domsg; };
life_std = 1;

["Mozesz sie ruchac bez stresu przez 10 minut!", false] spawn domsg;
uiSleep 600;

["Uwazaj, teraz jak zaruchasz to za 9 miesiecy moze pojawic sie niespodzianka!", false] spawn domsg;
life_std = 0;