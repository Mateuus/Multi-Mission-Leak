
Emonkeys_fnc_markt = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\markt.sqf";
 
Emonkeys_fnc_parkplatz = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\parkplatz.sqf";

Emonkeys_fnc_trigger = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\trigger.sqf";

Emonkeys_fnc_housing_Kavala = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\housing-Kavala.sqf";

Emonkeys_fnc_housing_VIP = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\housing-VIP.sqf";

Emonkeys_fnc_housing_athira = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\housing-athira.sqf";

Emonkeys_fnc_housing_insel = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\housing-insel.sqf";

Emonkeys_fnc_housing_pyr = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\housing-pyr.sqf";

Emonkeys_fnc_housing_sofia = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\housing-sofia.sqf";

Emonkeys_fnc_housing_poliakko = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\housing-poliakko.sqf";

Emonkeys_fnc_housing_alikampos = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\housing-alikampos.sqf";

Emonkeys_fnc_polizei_gefaengnis = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\polizei-gefaengnis.sqf";

Emonkeys_fnc_polizei_bank = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\polizei-bank.sqf";

Emonkeys_fnc_strassen_maker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\strassen-maker.sqf";

Emonkeys_fnc_ksk_base = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\ksk-base.sqf";

Emonkeys_fnc_ps_base = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\ps-base.sqf";

Emonkeys_fnc_soa_base = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\soa-base.sqf";

Emonkeys_fnc_ff_base = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\ff-base.sqf";

Emonkeys_fnc_dm_base = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\dm-base.sqf";

Emonkeys_fnc_bwa_base = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\bwa-base.sqf";

Emonkeys_fnc_athira_kreuzung = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\athira-kreuzung.sqf";

Emonkeys_fnc_paintball_arena = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\local\arena_paintball.sqf";

Emonkeys_fnc_objekts = [Emonkeys_fnc_markt,
Emonkeys_fnc_parkplatz,
Emonkeys_fnc_trigger,
Emonkeys_fnc_paintball_arena,
Emonkeys_fnc_housing_Kavala,
Emonkeys_fnc_housing_VIP,
Emonkeys_fnc_housing_athira,
Emonkeys_fnc_housing_insel,
Emonkeys_fnc_housing_pyr,
Emonkeys_fnc_housing_sofia,
Emonkeys_fnc_housing_poliakko,
Emonkeys_fnc_housing_alikampos,
Emonkeys_fnc_polizei_gefaengnis,
Emonkeys_fnc_polizei_bank,
Emonkeys_fnc_strassen_maker,
Emonkeys_fnc_ksk_base,
Emonkeys_fnc_ps_base,
Emonkeys_fnc_soa_base,
Emonkeys_fnc_ff_base,
Emonkeys_fnc_dm_base,
Emonkeys_fnc_bwa_base,
Emonkeys_fnc_athira_kreuzung];


Emonkeys_fnc_housing_athira_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\housing-athira.sqf";
Emonkeys_fnc_housing_donator_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\housing-donator.sqf";
Emonkeys_fnc_housing_insel_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\housing-insel.sqf";
Emonkeys_fnc_housing_kaval_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\housing-kaval.sqf";
Emonkeys_fnc_housing_pyr_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\housing-pyr.sqf";
Emonkeys_fnc_housing_sofia_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\housing-sofia.sqf";
Emonkeys_fnc_housing_poliakko_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\housing-poliakko.sqf";
Emonkeys_fnc_housing_alikampos_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\housing-alikampos.sqf";
Emonkeys_fnc_housing_gruppenbasen_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\gruppen-basen.sqf";
Emonkeys_fnc_markt_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\objects\marker\markt.sqf";


Emonkeys_fnc_marker = [Emonkeys_fnc_housing_athira_marker,
Emonkeys_fnc_housing_donator_marker,
Emonkeys_fnc_housing_insel_marker,
Emonkeys_fnc_housing_kaval_marker,
Emonkeys_fnc_housing_pyr_marker,
Emonkeys_fnc_housing_sofia_marker,
Emonkeys_fnc_housing_poliakko_marker,
Emonkeys_fnc_housing_alikampos_marker,
Emonkeys_fnc_housing_gruppenbasen_marker,
Emonkeys_fnc_markt_marker];

EMonkeys_loadmap1 = false;
EMonkeys_loadmap2 = false;
EMonkeys_loadmap3 = false;
EMonkeys_loadmap4 = false;
EMonkeys_loadmap5 = false;

waitUntil{!isNil "Emonkeys_fnc_marker"};
waitUntil{!isNil "Emonkeys_fnc_objekts"};

EMonkeys_objspawn = true;

{[] call _x;}forEach Emonkeys_fnc_marker;
[] spawn {{[] call _x;}forEach Emonkeys_fnc_objekts;};