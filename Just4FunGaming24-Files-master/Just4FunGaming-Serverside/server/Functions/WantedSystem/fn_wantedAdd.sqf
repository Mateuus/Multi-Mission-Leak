// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private["_uid", "_type"]; 
 
if( !params[ 
        [ "_uid",  "", [""] ], 
        [ "_type", "", [""] ] 
    ]) exitWith {}; 
 
private _customBounty = param [ 2, -1, [0] ]; 
private _extra = param [ 3, "", [""] ]; 
 
private _crime = switch(_type) do { 
 
    case "100": { ["Dauerhaft störendes Hupen", 5000] }; 
    case "101": { ["Fahren ohne Licht", 7500] }; 
    case "102": { ["Fahren ohne Führerschein", 25000] }; 
    case "103": { ["Gefährliche Fahrweise", 25000] }; 
    case "104": { [ format["Geblitzt bis 15 km/h zu schnell (%1)", _extra], 5000] }; 
    case "105": { [ format["Geblitzt bis 30 km/h zu schnell (%1)", _extra], 10000] }; 
    case "106": { [ format["Geblitzt bis 45 km/h zu schnell (%1)", _extra], 15000] }; 
    case "107": { [ format["Geblitzt bis 60 km/h zu schnell (%1)", _extra], 20000] }; 
    case "108": { [ format["Geblitzt bis 75 km/h zu schnell (%1)", _extra], 25000] }; 
    case "109": { [ format["Geblitzt bis 90 km/h zu schnell (%1)", _extra], 30000] }; 
    case "110": { [ format["Geblitzt bis 105 km/h zu schnell (%1)", _extra], 40000] }; 
    case "111": { [ format["Geblitzt über 105 km/h zu schnell (%1)", _extra], 50000] }; 
    case "112": { ["Fahren unter Alkohol-/Drogeneinfluss", 50000] }; 
 
    case "114": { ["Fahrerflucht nach Unfall", 150000] }; 
    case "115": { ["Autounfall mit Todesfolge", 150000] }; 
    case "116": { ["Fahren von illegalen Fahrzeugen", 150000] }; 
    case "117": { ["Fliegen ohne Fluglizenz", 40000] }; 
    case "118": { ["Fliegen/Schweben unterhalb 300m der Stadt", 50000] }; 
    case "119": { ["(Versuchtes) Landen in einer Flugverbotszone", 75000] }; 
 
    case "120": { ["Tankstellenraub", 30000] }; 
    case "121": { ["ATM Raub", 80000] }; 
    case "122": { ["Überfall auf Personen/Raub", 100000] }; 
    case "123": { ["(Versuchter) Hauseinbruch", 100000] }; 
    case "124": { ["(Versuchter) Fahrzeugdiebstahl", 100000] }; 
 
    case "126": { ["Beamtenbeleidigung", 30000] }; 
    case "127": { ["Nicht befolgen e.pol.Anordnung", 30000] }; 
    case "128": { ["Belästigung eines Polizisten", 30000] }; 
    case "129": { ["Betreten der pol.Sperrzone", 30000] }; 
    case "130": { ["Widerstand gegen die Staatsgewalt", 50000] }; 
    case "131": { ["Beschuss auf Polizei/Beamte/Eigentum", 100000] }; 
    case "132": { ["Angriff/Belagerung von Hauptstädten", 150000] }; 
    case "133": { ["Mit gez.Waffe durch Stadt", 40000] }; 
 
    case "135": { ["Organhandel", 60000] }; 
    case "136": { ["Besitz illegaler Ware", 60000] }; 
    case "138": { ["Handel mit illegaler Ware", 150000] }; 
 
    case "139": { ["Schusswaffengebrauch innerhalb Stadt", 80000] }; 
    case "140": { ["Waffenbesitz ohne Lizenz", 100000] }; 
    case "141": { ["Besitz einer verbotenen Waffe", 100000] }; 
    case "142": { ["Drogendelikte", 150000] }; 
    case "143": { ["Illegale Strassensperren", 250000] }; 
    case "144": { ["Geiselnahme", 250000] }; 
    case "145": { ["(Versuchter) Bankraub/Gefängnisaufbruch", 200000] }; 
    case "146": { [ format["Mord an %1", _extra], 300000] }; 
    case "147": { ["Ausbruch aus dem Gefängnis", 1000000] }; 
    default { [] }; 
}; 
 
if( _crime isEqualTo [] ) exitWith {}; 
 
//Is there a custom bounty being sent? Set that as the pricing. 
if( _customBounty != -1 ) then { 
    _crime set[1, _customBounty]; 
}; 
 
private _found = false; 
{ 
    if( (_x select 0) isEqualTo _uid ) exitWith { 
        _found = true; 
        (_x select 1) pushBack _crime; 
    }; 
} forEach XY_wantedList; 
 
if( !_found ) then { 
    XY_wantedList pushBack [_uid, [_crime]]; 
}; 
 
// Insert crime into database 
[ format["INSERT INTO wanted (playerid, message, value) VALUES ('%1', '%2', '%3')", _uid, _crime select 0, [_crime select 1] call XYDB_fnc_numberSafe ], 1 ] remoteExec ["XYDB_fnc_asyncCall", XYDB];