#include <macro.h>
/*
THIS SCRIPT WAS MADE FOR PIRATES-OF-ALTIS.DE BY OPTIX aka
www.steamcommunity.com/id/ryanthett
THIS HEADER HAS TO BE LEFT UNCHANGED UNDER ALL CIRCUMSTANCES!
CHANGING ANYTHING OF THE SCRIPT DOESN'T MAKE IT YOURS!
*/


/*
USAGE:
this addAction [ "Process XXX", { [[["YOURITEMNAMEHERE",AMOUNTNEEDED]],"license_civ_LICENSENAME",LICENSEBUYPRICE,[["YOURPRODUCTNAMEHERE",AMOUNTGIVEN]]] spawn life_fnc_dynprocess; } ];

EXAMPLE:
this addAction [ "Process XXX", { [[["peach",2],["apple",3],["water",2]],"license_civ_thisisarandomlicense",1337,[["Tonicwater",2],["AItem:>",2]]] spawn life_fnc_dynprocess; } ];
*/


private ["_currentPos","_necessaryItemsArray","_necessaryLicence","_licencePrice","_resultItem","_licenceRequired","_weiter","_itemCountActualArray","_itemCountRequiredArray","_indexActual","_itemMaximal","_minWert","_indexEnd","_anzahlMaxVerarbeiten"];

// SONDERFÄLLE PRÜFEN
if (vehicle player != player) then {hint "Du kannst nicht aus dem Fahrzeug verarbeiten!"};
if (life_is_processing) exitWith {hint "Du verarbeitest bereits etwas!"};
if (vehicle player != player) exitwith {hint format["Du befindest dich in einem Fahrzeug und kannst deshalb nichts verarbeiten!"]};

// AB JETZT VERARBEITET DER SPIELER
life_is_processing = true;

// DEKLARIEREN DER BENÖTIGEN VARIABELN UND AUFRUFEN DER ÜBERGEBENEN PARAMETER
_currentPos = position player;
_necessaryItemsArray = [_this,0,[],[[]]] call BIS_fnc_param;
_necessaryLicence = [_this,1,"",[""]] call BIS_fnc_param;
_resultItem = [_this,2,[],[[]]] call BIS_fnc_param;
_licenceRequired = false;
_nah = false;

if (_necessaryLicence != "") then {
    // LIZENZ PRÜFEN, WENN NICHT VORHANDEN KAUF ANBIETEN
    _nah = false;

    if (!(LICENSE_VALUE(_necessaryLicence,"civ"))) then {
        _licensePrice = M_CONFIG(getNumber,"Licenses",_necessaryLicence,"price");
        _licenseDisplayName = M_CONFIG(getText,"Licenses",_necessaryLicence,"displayName");

        _action = [
            format["Dir fehlt die notwendige Lizenz für das Verarbeiten.<br/><br/>Die Lizenz %1 kostet <t color='#8cff9b'>%2€</t>.<br/>"+(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>%3€</t>",
                localize(_licenseDisplayName),
                [_licensePrice] call life_fnc_numberText,
                [CASH] call life_fnc_numberText
            ],
            "Notwendige Lizenz erwerben",
            "Ja",
            "Nein"
        ] call BIS_fnc_guiMessage;

        if(_action) then {
            [NIL,NIL,NIL,_necessaryLicence] call life_fnc_buyLicense;
            if (!(LICENSE_VALUE(_necessaryLicence,"civ"))) exitWith {life_is_processing = false;5 cutText ["","PLAIN"];_nah=true};
        } else {
            _nah = true;
        };
    };
    if (_nah) exitWith {life_is_processing = false;5 cutText ["","PLAIN"]};
};

if (_nah) exitWith {life_is_processing = false;5 cutText ["","PLAIN"]};

// PRÜFEN, OB ITEMS VORHANDEN SIND
{
    _itemsRequiredActual = _x;
    _itemName = _itemsRequiredActual select 0;
    _itemCountRequired = _itemsRequiredActual select 1;
    call compile format ["itemCountActual = life_inv_%1",_itemName];
    if (_itemCountRequired > itemCountActual) then {_nah = true};
} forEach _necessaryItemsArray;
if (_nah) exitWith {life_is_processing = false;5 cutText ["","PLAIN"];hint "Du hast nicht genügend Gegenstände dabei!"};

// VERARBEITUNGSANZAHL BERECHNEN -> MATHE FTW
_itemCountActualArray = [];
{
    _itemsRequiredActual = _x;
    _itemName = _itemsRequiredActual select 0;
    call compile format ["_itemCountActualArray = _itemCountActualArray + [life_inv_%1]",_itemName];
} forEach _necessaryItemsArray;
_itemCountRequiredArray = [];
{
    _itemsRequiredActual = _x;
    _itemCountRequired = _itemsRequiredActual select 1;
    call compile format ["_itemCountRequiredArray = _itemCountRequiredArray + [%1]",_itemCountRequired];
} forEach _necessaryItemsArray;
_indexActual = -1;
_itemMaximal = [];
{
    _indexActual = _indexActual + 1;
    _itemMaximal = _itemMaximal + [(floor ((_itemCountActualArray select _indexActual)/(_itemCountRequiredArray select _indexActual)))];
} forEach _itemCountActualArray;
_minWert = _itemMaximal select 0;
_indexEnd = 0;
{
    _indexEnd = _indexEnd + 1;
    if (_x<_minWert) then {_minWert=_x};
} forEach _itemMaximal;
_anzahlMaxVerarbeiten = _minWert;

// PROGRESSBAR SCHALTEN
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%","Verarbeite..."];
_progress progressSetPosition 0.01;
_cP = 0.1 / _anzahlMaxVerarbeiten;
_nah=false;
while{true} do
{
    uiSleep 0.3;
    _cP = _cP + 0.01;
    if ((_cp * 100) <= 100) then { _progress progressSetPosition _cP; };
    if(_cP > 1) exitWith {};
    _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Verarbeite..."];
    if(player distance _currentPos > 10) exitWith {hint "Du hast dich zu weit entfernt!";life_is_processing = false;5 cutText ["","PLAIN"];_nah=true};
};
if (_nah) exitWith {life_is_processing = false;5 cutText ["","PLAIN"]};

// ITEMS ENTZIEHEN
_removed = true;
{
    _itemsRequiredActual = _x;
    _removed = _removed && ([false,_itemsRequiredActual select 0,((_itemsRequiredActual select 1)*_anzahlMaxVerarbeiten)] call life_fnc_handleInv);
} forEach _necessaryItemsArray;

if (!_removed) exitWith {hint "Verarbeiten abgebrochen!"; life_is_processing = false; 5 cutText ["","PLAIN"]};

// ITEMS ADDEN
{
    [true,_x select 0,((_x select 1)*_anzahlMaxVerarbeiten)] call life_fnc_handleInv;
} forEach _resultItem;

//_toLog = format ["4|%1 (%2) hat %3 Mal %4 durch verarbeiten erhalten.", name player,getPlayerUID player,_anzahlMaxVerarbeiten,_resultItem];
//[[_toLog],"Arma3Log"] call life_fnc_MP;

life_is_processing = false;
5 cutText ["","PLAIN"];

//[0] spawn life_fnc_addEXP;