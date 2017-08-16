/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
switch (eM_fadeSound) do 
{
    case 0:
    {
		1 fadeSound 0.6;
		hint "Du hast die Ohropax eingesetzt (60%)";
		eM_fadeSound = 1;
    };
    case 1:
    {
		1 fadeSound 0.3;
		hint "Du hast die Ohropax weiter eingesetzt (30%)";
		eM_fadeSound = 2;
    };
	case 2:
    {
		1 fadeSound 0.15;
		hint "Du hast die Ohropax weiter eingesetzt (15%)";
		eM_fadeSound = 3;
    };
	case 3:
    {
		1 fadeSound 0.05;
		hint "Du hast die Ohropax weiter eingesetzt (5%)";
		eM_fadeSound = 4;
    };
	case 4:
    {
		1 fadeSound 1;
		hint "Du hast die Ohropax herrausgenommen";
		eM_fadeSound = 0;
    };
};