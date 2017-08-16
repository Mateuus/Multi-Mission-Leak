/*

*		if(ES_xp_lvl >= 1) then {};

*		["Durchsuchung"] call ES_fnc_xp_add;

*/

class CfgXP
{

	class levels_COP
	{
		class 1 { xpNeeded = 0; };
		class 2 { xpNeeded = 100; };
		class 3 { xpNeeded = 850; };
		class 4 { xpNeeded = 950; };
		class 5 { xpNeeded = 1300; };
		class 6 { xpNeeded = 1750; };
		class 7 { xpNeeded = 2550; };
		class 8 { xpNeeded = 2900; };
		class 9 { xpNeeded = 3650; };
		class 10 { xpNeeded = 5850; };
		class 11 { xpNeeded = 7365; };
		class 12 { xpNeeded = 10000; };
		class 13 { xpNeeded = 14548; };
		class 14 { xpNeeded = 20680; };
		class 15 { xpNeeded = 29580; };
		class 16 { xpNeeded = 40850; };
		class 17 { xpNeeded = 55125; };
		class 18 { xpNeeded = 77542; };
		class 19 { xpNeeded = 100000; };
		class 20 { xpNeeded = 112576; };
		class 21 { xpNeeded = 135478; };
	};

	class levels_MED
	{
		class 1 { xpNeeded = 0; };
		class 2 { xpNeeded = 100; };
		class 3 { xpNeeded = 850; };
		class 4 { xpNeeded = 1250; };
		class 5 { xpNeeded = 2300; };
		class 6 { xpNeeded = 3450; };
		class 7 { xpNeeded = 4550; };
		class 8 { xpNeeded = 5600; };
		class 9 { xpNeeded = 6650; };
		class 10 { xpNeeded = 9850; };
		class 11 { xpNeeded = 12365; };
		class 12 { xpNeeded = 18000; };
		class 13 { xpNeeded = 22548; };
		class 14 { xpNeeded = 35680; };
		class 15 { xpNeeded = 42580; };
		class 16 { xpNeeded = 56850; };
		class 17 { xpNeeded = 75125; };
		class 18 { xpNeeded = 89542; };
		class 19 { xpNeeded = 100000; };
		class 20 { xpNeeded = 112576; };
		class 21 { xpNeeded = 135478; };
	};

	class levels_CIV
	{
		class 1 { xpNeeded = 0; };
		class 2 { xpNeeded = 450; };
		class 3 { xpNeeded = 3570; };
		class 4 { xpNeeded = 7800; };
		class 5 { xpNeeded = 19302; };
		class 6 { xpNeeded = 30218; };
		class 7 { xpNeeded = 65820; };
		class 8 { xpNeeded = 79582; };
		class 9 { xpNeeded = 90352; };
		class 10 { xpNeeded = 109503; };
		class 11 { xpNeeded = 115820; };
		class 12 { xpNeeded = 131255; };
		class 13 { xpNeeded = 156554; };
		class 14 { xpNeeded = 185820; };
		class 15 { xpNeeded = 215821; };
		class 16 { xpNeeded = 246814; };
		class 17 { xpNeeded = 286954; };
		class 18 { xpNeeded = 323851; };
		class 19 { xpNeeded = 362351; };
		class 20 { xpNeeded = 412458; };
		class 21 { xpNeeded = 456547; };
		class 22 { xpNeeded = 495472; };
		class 23 { xpNeeded = 556951; };
		class 24 { xpNeeded = 613521; };
		class 25 { xpNeeded = 665884; };
		class 26 { xpNeeded = 715592; };
		class 27 { xpNeeded = 776854; };
		class 28 { xpNeeded = 822542; };
		class 29 { xpNeeded = 868563; };
		class 30 { xpNeeded = 918541; };
		class 31 { xpNeeded = 978584; };
		class 32 { xpNeeded = 1175231; };
		class 33 { xpNeeded = 1328871; };
		class 34 { xpNeeded = 1799651; };
		class 35 { xpNeeded = 1902828; };
		class 36 { xpNeeded = 2158521; };
		class 37 { xpNeeded = 2439687; };
		class 38 { xpNeeded = 2639858; };
		class 39 { xpNeeded = 2798712; };
		class 40 { xpNeeded = 3085841; };
		class 41 { xpNeeded = 3358742; };
		class 42 { xpNeeded = 3656463; };
		class 43 { xpNeeded = 3995985; };
		class 44 { xpNeeded = 4462552; };
		class 45 { xpNeeded = 4802654; };
		class 46 { xpNeeded = 4965581; };
		class 47 { xpNeeded = 5995811; };
		class 48 { xpNeeded = 6452855; };
		class 49 { xpNeeded = 9865285; };
		class 50 { xpNeeded = 10356858; };
		class 51 { xpNeeded = 11111111; };
	};

	class getxp_COP
	{
		class Lizenzkauf { xp = 250; };
		class Rohstoffesammeln { xp = 2; };
		class Fahrzeugkauf { xp = 5; };
		class Durchsuchung { xp = 200; };
		class VirtualItemkaufen { xp = 1; };
		class VirtualItemverkaufen { xp = 1; };
		class WantedAdd { xp = 5; };
		class Wantedfestnahme { xp = 2250; };
		class WantedKill { xp = 1250; };
		class WaffenKaufen { xp = 2; };
		class WaffenVerkaufen { xp = 3; };
		class Autoverkaufen { xp = 10; };
		class Kleidungkaufen { xp = 2; };
		class Verhaften { xp = 30; };
		class BugReport { xp = 2; };
		class PolizeiTicket { xp = 20; };
	};

	class getxp_MED
	{
		class Lizenzkauf { xp = 150; };
		class Rohstoffesammeln { xp = 2; };
		class Fahrzeugkauf { xp = 5; };
		class VirtualItemkaufen { xp = 1; };
		class VirtualItemverkaufen { xp = 1; };
		class Wiederbeleben { xp = 250; };
		class WaffenKaufen { xp = 2; };
		class WaffenVerkaufen { xp = 3; };
		class Autoverkaufen { xp = 6; };
		class Kleidungkaufen { xp = 2; };
		class BugReport { xp = 2; };
	};

	class getxp_CIV
	{
		class Lizenzkauf { xp = 500; };
		class Fischfangen { xp = 200; }; 
		class dpMission { xp = 4000; };
		class Rohstoffesammeln { xp = 50; };
		class Fahrzeugkauf { xp = 200; };
		class Hauskaufen { xp = 125000; };
		class VirtualItemkaufenGangGeld { xp = 5; };
		class VirtualItemkaufen { xp = 1; };
		class VirtualItemverkaufen { xp = 1; };
		class WaffenKaufenGangGeld { xp = 6; };
		class WaffenKaufen { xp = 20; };
		class WaffenVerkaufen { xp = 3; };
		class Autoverkaufen { xp = 16; };
		class Kleidungkaufen { xp = 2; };
		class BugReport { xp = 2; };
		class BankHacken { xp = 20000; };
		class GangErstellen { xp = 200; };
		class GangUpdate { xp = 50; };
	};
};