// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( player diarySubjectExists "rules" ) exitWith {};

player createDiarySubject ["rules", "Regeln"];
player createDiarySubject ["changelog", "Updates"];
player createDiarySubject ["controls", "Tastenkürzel"];
player createDiarySubject ["support", "Support"];
player createDiarySubject ["jobs", "Farmtouren"];
player createDiarySubject ["credits", "Credits"];

if( playerSide != civilian ) then {
    player createDiarySubject ["calllog", "Notrufe"];
};

player createDiaryRecord["changelog", [ "Forum",
"Bitte besucht unser Forum, um über alle Änderungen auf dem Laufenden zu bleiben" ]];

player createDiaryRecord ["rules", [ "Regeln",
"<br/>
Unsere Webseite mit allen Regeln findet ihr hier:<br/>
http://www.Just4FunGaming24.de/<br/><br/>
Teamspeak: ts.Just4FunGaming24.de<br/><br/>
!!! Dies ist ein RP Server: Bleibt immer in eurer Rolle !!!"
]];

player createDiaryRecord ["controls", [ "Zivilisten",
"<br/>
Z: Öffnet das Spieler Menu<br/>
U: Fahrzeuge auf-/abschließen<br/>
T: Kofferraum öffnen<br/>
Windows-Taste: Interaktionstaste + Farmen<br/>
Alt + R: RedGull verwenden<br/>
Alt + O: Ausweis zeigen<br/>
Shift + H: Waffe holstern<br/>
Shift + G: Bewusstlos schlagen (Benötigt Waffe)<br/>
Shift + R: Festnehmen (Benötigt Handschellen)<br/>
Shift + P: Ohrstöpsel benutzen<br/>
Shift + B: Hände über den Kopf heben"

]];

player createDiaryRecord ["controls", [ "Polizei",
"<br/>
Z: Öffnet das Spieler Menu<br/>
T: Kofferraum öffnen<br/>
Windows-Taste: Interaktionstaste<br/>
Shift + H: Waffe holstern<br/>
F: Polizeisirene<br/>
Strg + F: Polizeidurchsage<br/>
Shift + R: Festnehmen<br/>
Shift + P: Ohrstöpsel benutzen<br/>
Shift + O: Tore öffnen<br/>
Alt + O: Ausweis zeigen<br/>
Alt + B: Waffen beschlagnahmen<br/>
Alt + R: RedGull verwenden<br/>
Shift + B: Hände über den Kopf heben"]];

// Support Section

player createDiaryRecord ["support", [ "Hinweise",
"<br/>
Auch der Support will gerne Spielen, also meldet bitte nicht gleich jeden Spielfehler einem Admin Ingame oder im TS, nutzt dafür bitte das Forum http://www.Just4FunGaming24.de/<br/><br/>
Solltet Ihr durch Desync/Lag in Konvoi-Fahrten eure Fahrzeuge verlieren, bekommt ihr keine Erstattung! Die Problematik ist allgemein bekannt und es liegt an euch, euch darauf vorzubereiten.<br/><br/>
Fertigt für den Support bitte immer Screenshots oder besser Videos an, so können Regelverletzungen eindeutig als solche erkannt werden!"]];

// Farmtouren
player createDiaryRecord ["jobs", [ "Diamanten", "Farmen an der Diamantenmine, verarbeiten an am Diamantenschleifer, Verkaufen Diamanten-Ankauf"]];
player createDiaryRecord ["jobs", [ "Eisenbarren", "Farmen an der Eisenerzmine, verarbeiten an der Eisenschmelze, Verkaufen am Eisen- und Kupfer-Ankauf"]];
player createDiaryRecord ["jobs", [ "Kupferbarren", "Farmen an der Kupfermine, verarbeiten an der Kupferschmelze, Verkaufen am Eisen- und Kupfer-Ankauf"]];
player createDiaryRecord ["jobs", [ "Salz", "Farmen an der Salzmine, verarbeiten an der Salzaufbereitung, Verkaufen am Salz-Ankauf"]];
player createDiaryRecord ["jobs", [ "Zement", "Farmen am Steinbruch, verarbeiten am Zementwerk, Verkaufen am Zement-Ankauf"]];
player createDiaryRecord ["jobs", [ "Goldbarren", "Farmen an der Goldmine, verarbeiten an der Goldschmiede, Verkaufen am Juwelier" ]];
player createDiaryRecord ["jobs", [ "Silberbarren", "Farmen an der Silbermine, verarbeiten an der Silberschmiede, Verkaufen am Silber-Ankauf" ]];
player createDiaryRecord ["jobs", [ "Bretter", "Farmen am Wald, verarbeiten am Sägewerk, Verkaufen beim Schreiner" ]];
player createDiaryRecord ["jobs", [ "Bier", "Farmen am Hopfenfeld, verarbeiten an der Brauerei, Verkaufen am Bierhändler" ]];
player createDiaryRecord ["jobs", [ "Brandy", "Farmen am Traubenfeld, verarbeiten an der staatl. Brennerei, Verkaufen am Schnappshändler" ]];
player createDiaryRecord ["jobs", [ "Schwarzgebrannter", "Farmen am Traubenfeld, verarbeiten an der Schwarzbrennerei, Verkaufen am Schwarzmarkt" ]];
player createDiaryRecord ["jobs", [ "Marihuana", "Farmen an der Hanf-Plantage, verarbeiten am Marihuanaverarbeiter, Verkaufen beim Drogen-Dealer" ]];
player createDiaryRecord ["jobs", [ "Kokain", "Farmen an der Kokastrauch-Plantage, verarbeiten an der Kokainverarbeitung, Verkaufen beim Drogen-Dealer" ]];
player createDiaryRecord ["jobs", [ "Heroin", "Farmen am Schlafmohnfeld, verarbeiten an der Heroinverarbeitung, Verkaufen beim Drogen-Dealer" ]];
player createDiaryRecord ["jobs", [ "LSD", "Farmen beim Mutterkornpilz, verarbeiten an der LSD-Verarbeitung, Verkaufen beim Drogen-Dealer" ]];
player createDiaryRecord ["jobs", [ "Methamphetamin", "Farmen bei Pseudoephidrin, verarbeiten in der Meth-Küche, Verkaufen beim Drogen-Dealer" ]];
player createDiaryRecord ["jobs", [ "Illegale Daten", "(PvP-Event) Benötigt HackBook Pro und USB-Sticks, die USB-Sticks müssen an der abgestürzten Drohne bespielt und anschließend entschlüsselt werden. Jetzt können die USB-Sticks beim Darknet-Händler verkauft werden." ]];

player createDiaryRecord ["jobs", [ "Uran",
"Für das Betreten der Uran-Verarbeiter und des Uran-Bunkers ist eine Schutzausrüstung, bestehend aus Strahlenschutzanzug und -helm erforderlich!<br/><br/>
Uran kann legal oder illegal gefarmt werden. Der erste Schritt ist immer mit Uranit zum Uranwäscher zu fahren. Danach kann man sich für den legalen oder illegalen Weg entscheiden.<br/><br/>
Legaler Weg: Nach dem Auswaschen weiter zur Kernbrennstoffherstellung, anschließend verkaufen am Export-Hafen.<br/><br/>
Illegaler Weg: Nach dem Auswaschen mit Uran zur Anreicherung fahren. Uran 238 kann dann direkt verkauft werden, oder es wird im Brutreaktor zu Plutonium weiterverarbeitet. Verkauft wird beides am Schwarzmarkt.<br/><br/>
ACHTUNG: Alle Uran-End- und Zwischen-Produkte können nicht in Häuser eingelagert werden und werden auch nicht im Kofferraum der Fahrzeuge zwischen Restarts gespeichert!"]];

player createDiaryRecord ["jobs", [ "Teamjobs",
"Folgende Teamjobs stehen zur Verfügung:<br/><br/>
Sarin (Verk. am Schwarzmarkt): 2Propanol (Farmen beim Schwarzbrenner) + Methylphosphonsäuredifluorid<br/><br/>
Schmuck (Verk. beim Juwelier): Gold (verarbeitet) + Diamant (verarbeitet)<br/><br/>
Verbrennbarer Müll (Verk. Kraftwerk): Müll (getrennt) + Plastik (verarbeitet) = Müll Verpacken <br/><br/>
Heizöl (Verk. Heizölankauf): Eisen (verarbeitet) + Kupfer (verarbeitet) = Leeres Fass, Leeres Fass an Meerwasserentsalzung mit Wasser befüllen, Leeres Fass + Wasserfass auf der Bohrinsel zu Rohölfass verarbeiten, an der Raffinerie verarbeiten zu Heizöl<br/><br/>
Crocodile (Verk. beim Drogendealer): Heroin (verarbeitet) + Ölschlamm + 2Propanol"]];

player createDiaryRecord ["credits", [ "Credits",
"<br/>
Vielen Dank an die vielen Helfer, die dieses Projekt erst möglich gemacht haben und auch mit der Treue bewiesen haben, dass wir eine Community sind. Dank euch kann unser Projekt unter anderen Namen weiterlaufen. Vielen Dank an unsere Supporter, Direktoren, Chefärzte und THW-Chefs. Ebenfalls vielen Dank an alle Spieler, die jeden Tag mithelfen dass dieser Server noch besser wird. "]];