/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = param [0,1,[0]];

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		lc_gun = false;
		lc_anwalt = false;
	};

	//Jail licenses
	case 1:
	{
		lc_gun = false;
		lc_heroin = false;
		lc_coke = false;
		lc_marijuana = false;
		lc_moonshine = false;
		lc_methkochen = false;
		lc_methbruch = false;
		lc_bufopro = false;
		lc_dmtpro = false;
		lc_schenkelpro = false;
		lc_suppenpro = false;
		lc_streckenkoka = false;
		lc_streckenhero = false;
		lc_streckenmeth = false;
		lc_streckendmt = false;
		lc_streckenmari = false;
		lc_zpilzge = false;
		lc_zpilz = false;
		lc_anwalt = false;
		lc_joint = false;
		lc_heroinsp = false;
	};

	//Remove motor vehicle licenses
	case 2:
	{
		if(lc_driver OR lc_air OR lc_truck OR lc_boat) then {
			lc_driver = false;
			lc_truck = false;
			hint "Wegen Tötung mit dem Fahrzeug hast du deine Fahrzeuglizenzen verloren.";
		};
	};

	//Killing someone while owning a gun license
//	case 3:
//	{
//		if(lc_gun) then {
//			lc_gun = false;
//			hint "Wegen Mordes hast du deine Waffenlizenz verloren.";
//		};
//	};

	case 4:
		{
				lc_driver = false;
				lc_truck = false;
		};

	// Führerschein Lizenz
	case 10:
	{
		lc_driver = false;
		hint "Dein PKW-Führerschein wurde durch die Polizei entzogen.";
	};
	// LKW Führerschein Lizenz
	case 11:
	{
		lc_truck = false;
		hint "Dein LKW-Führerschein wurde durch die Polizei entzogen.";
	};
	// Pilotenschein Lizenz
	case 12:
	{
		lc_air = false;
		lc_airgewerbe = false;
		lc_airkampf = false;
		hint "Deine Flug-Führerscheine wurde durch die Polizei entzogen.";
	};
	// Bootsschein Lizenz
	case 13:
	{
		lc_boat = false;
		hint "Deine Boot-Führerschein wurde durch die Polizei entzogen.";
	};
	// deaktiviert
	case 14:
	{

	};
	// Anwalt
	case 15:
	{
		lc_anwalt = false;
		hint "Deine Anwaltslizenz wurde durch die Polizei entzogen.";
	};
	// Alle Scheine
	case 16:
	{
		lc_driver = false;
		lc_truck = false;
		lc_air = false;
		lc_boat = false;
		hint "Alle Führerscheine wurde durch die Polizei entzogen.";
	};
	case 17:
	{
		lp_cair = true;
		hint "Du hast eine Fluglizenz erhalten.";
	};
	case 18:
	{
		lp_cg = true;
		hint "Du hast eine Bootslizenz erhalten.";
	};
	case 19:
	{
		lp_zivi = true;
		hint "Du hast eine Zivilstreifenlizenz erhalten.";
	};
	case 20:
	{
		lp_swat = true;
		hint "Du hast eine SEK Lizenz erhalten.";
	};
	case 21:
	{
		lp_cair = false;
		hint "Dir wurde deine Fluglizenz entzogen.";
	};
	case 22:
	{
		lp_cg = false;
		hint "Dir wurde deine Bootslizenz entzogen.";
	};
	case 23:
	{
		lp_zivi = false;
		hint "Dir wurde deine Zivilstreifenlizenz entzogen.";
	};
	case 24:
	{
		lp_swat = false;
		hint "Dir wurde deine SEK Lizenz entzogen.";
	};
	
	case 25:
	{
		lp_beg = true;
		hint "Du hast eine Begleitschutz Lizenz erhalten.";
	};
	
	case 26:
	{
		lp_beg = false;
		hint "Dir wurde deine Begleitschutz Lizenz entzogen.";
	};
};

[2] call SOCK_fnc_updatePartial;
