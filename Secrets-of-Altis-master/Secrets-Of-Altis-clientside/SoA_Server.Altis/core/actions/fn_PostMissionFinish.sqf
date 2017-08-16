
_briefkasten = _this select 0;
_price = 100000;
if(isNull _briefkasten) exitWith {hint "Der Briefkasten ist kaputt, melde dies umgehend einem Techniker!"};

_check = nil;
{if(_x isKindOf "C_Van_01_box_F" && _x getVariable "Life_VEH_Color" == 7) exitWith {_check = _x}} foreach life_vehicles; 
if(!isNil "_check" && _check distance player > 50) exitWith {hint "Wo ist dein Postwagen?!"};

removeallactions _briefkasten;

if((timepost - time) <= 2600) then {_price = 70000};
if((timepost - time) <= 2300) then {_price = 60000};
if((timepost - time) <= 2000) then {_price = 50000};
if((timepost - time) <= 1700) then {_price = 40000};	
if((timepost - time) <= 1500) then {_price = 30000};
if((timepost - time) <= 1000) then {_price = 20000};

hint format ["Du hast %1€ für dieses Paket erhalten!",[_price] call life_fnc_numberText];

life_postpaket = life_postpaket - 1;
life_beatgeld = life_beatgeld + _price;

disableSerialization;
_display = uiNamespace getVariable "life_post";
_pakettext = _display displayCtrl 601;
_pakettext ctrlSetText format["%1/3 Paket(e) übrig",life_postpaket];

if(!erfolg_post && life_postpaket == 0 && playerside == civilian) then {erfolg_post = true; ["erfolg_post"] spawn life_fnc_erfolgerhalten};