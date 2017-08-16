/*
	File: fn_infoLBchanged.sqf
	Author: Barney

	Description:
	BLAH
*/


#define listbox 1500
#define Stext 1100


private ["_display","_listbox","_text","_what","_text1"];
disableSerialization;
_display = findDisplay 2001;
_listbox = _display displayCtrl listbox;
_text = _display displayCtrl Stext;

_what = lbCurSel _listbox;
if(_what == -1) exitWIth {};

switch(_what) do {
	case 0: {_text1 = "Solltest du RDMT oder VDMT worden sein, dann melde dich auf dem TS im Support (TS = ts.loewenherz-projekt.de : 9988 PW: blah). Bevor du dich dort meldest, brauchst du allerdings Beweise, Beweise können Videos, Zeugenaussagen von gewhitelisteten Personen oder auch ein sehr aussagekräftiges Bild sein. Solltest du dich ohne Beweise im Support melden können die Supporter dir leider auch nicht weiterhelfen!"};


	case 1: {_text1 = "Die grafischen Anzeigen, z.B. vom Vehicle Shop oder der Garage werden nicht richtig auf deinem Bildschirm dargestellt? Dann mache folgendes: ESC -> Konfigurieren -> Grafik -> Anzeige -> Menügröße verkleinern. Jetzt sollten die Dialoge bei dir richtig dargetsellt werden. Nun musst du nur noch einmal dein Arma restarten, damit alle Einstellungen übernommen werden und es kann losgehen!"};


	case 2: {_text1 = "Solltest du durch Bugs, Desync oder Anderes Etwas verloren haben, dann melde dich MIT BEWEISEN im Support, Beweise können Videos, Zeugenaussagen von gewhitelisteten Personen oder auch ein sehr aussagekräftiges Bild sein. Solltest du dich ohne Beweise im Support melden, können die Supporter dir leider auch nicht weiterhelfen! Für Videoaufnahmen empfehlen wir Programme wie Shadowplay oder Dxtory"};

	case 3: {_text1 = "Safzones sind folgende Orte: Kavala-Marktplatz, CarShop, TruckShop, AirShop, GunStore, DonaterShop, Garagen, alle Pilizei-HQs (ausgenommen: HWP, alle Grenzposten), Rebellen Außenposten, JVA und alle Security-HQ's. In diesen Gebieten sind KEINE Verbrechen oder illegale Aktivitäten jeglicher Art >>NIEMALS<< erlaubt"};

	case 4: {_text1 = "NEW lhm tritt NICHT in Kraft bei:  Absichtlichem Sterben (z.b. von einem Haus springen), Vehicle Deathmatch (überfahren werden), Serverneustart, du stirbst durch die Explosion z.b. eines Fahrzeugs, irgendein random Spieler erschiesst dich."};


};

_text ctrlSetStructuredText composetext [_text1];