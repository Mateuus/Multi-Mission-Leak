










"life_capture_changed" addPublicVariableeventHandler { if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); }; [] call life_fnc_reqsync;};
"life_swat_instance" addPublicVariableeventHandler { if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); }; [] call life_fnc_reqsync;};
"life_dispatchTasks" addPublicVariableeventHandler { if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); }; [] call life_fnc_reqsync;};

"srv_req_sync" addPublicVariableeventHandler { if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); }; [] call life_fnc_reqsync;};
"serv_heartbeat" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { serv_heartbeat = true; (owner HC1) publicVariableClient "serv_heartbeat"; };
};
"serv_killed" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
private["_unit","_type","_time"];
_unit = (_this select 1) select 0;
_type = (_this select 1) select 1;
switch(_type) do
{
case "1080": {
_type = ["Suicide bomber",40000];
_time = 900;
};
case "1090": {
_type = ["Explosives Terrorism",40000];
_time = 900;
};
case "2113": {
_type = ["Bank Robbery",15000];
_time = 900;
};
case "park": {
_type = ["Unauthorized Parking",300];
_time = 200;
};
case "2113A": {
_type = ["Attempted Bank Robbery",12500];
_time = 500;
};
case "187BH": {
_type = ["Bounty Hunter Execution",7500];
_time = 600;
};
case "187E": {
_type = ["Execution",7500];
_time = 600;
};
case "187V": {
_type = ["Hit and Run",1000];
_time = 120;
};
case "187G": {
_type = ["Gang Homicide",2500];
_time = 200;
};
case "187":  {
_type = ["Manslaughter",5000];
_time = 500;
};
case "901":  {
_type = ["Escaping Jail",10000];
_time = 1000;
};
case "901B": {
_type = ["Prison Break",10000];
_time = 600;
};
case "261":  {
_type = ["Rape",1500];
_time = 100;
};
case "261A": {
_type = ["Attempted Rape",500];
_time = 75;
};
case "215":  {
_type = ["Attempted Auto Theft",500];
_time = 10;
};
case "214":  {
_type = ["Attempted Manslaughter",2500];
_time = 120;
};
case "213":  {
_type = ["Use of illegal explosives",10000];
_time = 600;
};
case "211":  {
_type = ["Robbery",5000];
_time = 200;
};
case "207":  {
_type = ["Kidnapping",12500];
_time = 280;
};
case "209":  {
_type = ["Unlawful Detainment",1500];
_time = 90;
};
case "487":  {
_type = ["Grand Theft",1500];
_time = 60;
};
case "488":  {
_type = ["Petty Theft",750];
_time = 30;
};
case "480":  {
_type = ["Hit and run",250];
_time = 30;
};
case "141":  {
_type = ["Aiding escape from custody",500];
_time = 60;
};
case "id": {
_type = ["Identity Fraud",5];
_time = 10;
};
case "lowair":  {
_type = ["Aviation altitude violation",1000];
_time = 30;
};
case "har":  {
_type = ["Harassment",50];
_time = 30;
};
case "order":  {
_type = ["Disobeying an order from an officer",100];
_time = 30;
};
case "poseq":  {
_type = ["Possession of Police Equipment",2500];
_time = 120;
};
case "pi":  {
_type = ["Public Intoxication",100];
_time = 120;
};
case "check":  {
_type = ["Police Checkpoint Gates",1000];
_time = 60;
};
case "evade":  {
_type = ["Evading Arrest",2500];
_time = 120;
};
case "mar":  {
_type = ["Possession of Marijuana",2500];
_time = 90;
};
case "her":  {
_type = ["Possession of Heroin",5000];
_time = 90;
};
case "coc":  {
_type = ["Possession of Cocaine",7500];
_time = 90;
};
case "met":  {
_type = ["Possession of Meth",10000];
_time = 90;
};
case "gold":  {
_type = ["Possession of Reserve Gold",15000];
_time = 90;
};
case "tur":  {
_type = ["Possession of Turtle Meat",12500];
_time = 90;
};
case "dt":  {
_type = ["Drug Trafficking",10000];
_time = 400;
};
case "terror":  {
_type = ["Declaring Terror",15000];
_time = 300;
};
case "threat":  {
_type = ["Threatening an Officer",2500];
_time = 90;
};
case "spd":  {
_type = ["Speeding",2];
_time = 60;
};
case "dwl": {
_type = ["Driving Without A License",20];
_time = 120;
};
case "rdr":  {
_type = ["Reckless Driving",50];
_time = 30;
};
case "duv":  {
_type = ["Driving Unregistered Vehicle",250];
_time = 30;
};
case "fts":  {
_type = ["Failure to Stop",250];
_time = 30;
};
case "fth":  {
_type = ["Failure to Headlight",100];
_time = 30;
};
case "div":  {
_type = ["Driving an Illegal Vehicle",2500];
_time = 30;
};
case "isr":  {
_type = ["Illegal Street Racing",2500];
_time = 30;
};
case "pif":  {
_type = ["Possession of Illegal Firearm",2500];
_time = 90;
};
case "pil":  {
_type = ["Possession of Illegal Liquor",2000];
_time = 90;
};
case "pcp":  {
_type = ["Possession of PCP",3500];
_time = 90;
};
case "pdm":  {
_type = ["Money Laundering",5000];
_time = 500;
};
case "dwc":  {
_type = ["Discharge Within City",500];
_time = 60;
};
case "trw":  {
_type = ["Trafficking Weapons (3+)",1000];
_time = 300;
};
case "exe":  {
_type = ["Second-degree Murder",3000];
_time = 250;
};
case "pv":  {
_type = ["Parole Violation",20000];
_time = 2500;
};
default {
_type = [];
_time = 0;
};
};
[_unit,_type,_time] call life_fnc_wantedAdd;
};

"serv_wanted_remove" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
private["_unit"];
_unit = (_this select 1) select 0;
[_unit] call life_fnc_wantedRemove;
};

"serv_civ_query" addPublicVariableEventHandler 
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
client_cop_query = (_this select 1);
(((_this select 1) select 0) getVariable ["ownerID", -1]) publicVariableClient "client_cop_query";
};

"serv_cop_query" addPublicVariableEventHandler 
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
client_civ_query = (_this select 1) select 0;
(((_this select 1) select 1) getVariable ["ownerID", -1]) publicVariableClient "client_civ_query";
};

"group_creation" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
life_group_list set[count life_group_list,_this select 1];
publicVariable "life_group_list";
};

"group_update" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
if(count((_this select 1) select 1) == 0) then
{
life_group_list set[((_this select 1) select 0),-1];
life_group_list = life_group_list - [-1];
publicVariable "life_group_list";
}
else
{
life_group_list set[(_this select 1) select 0,(_this select 1) select 1];
publicVariable "life_group_list";
};
};

"session_query" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
private["_uid","_client"];
_uid = (_this select 1) select 0;
_client = (_this select 1) select 1;

_index = [_uid,client_session_list] call life_fnc_index;
if(_index != -1) then
{
session_return = client_session_list select _index;
(_client getVariable ["ownerID", -1]) publicVariableClient "session_return";
}
else
{
session_return = [];
(_client getVariable ["ownerID", -1]) publicVariableClient "session_return";
};
};

"session_add" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
private["_data"];
_data = _this select 1;
client_session_list set[count client_session_list,_data];
};

"session_update" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
private["_data","_index"];
_data = _this select 1;
_index = [(_data select 0),client_session_list] call life_fnc_index;
if(_index != 1) then
{
client_session_list set[_index,_data];
};
};

"bank_addfunds" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
private["_cash"];
_cash = _this select 1;
if(!isNil {_cash} && [str(_cash)] call life_fnc_isnumber) then
{
serv_bank_funds = serv_bank_funds + _cash;
};
};

"bank_subfunds" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
private["_cash"];
serv_bank_funds = -200000;










};

"bank_query" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
private["_unit"];
_unit = _this select 1;
if(!isNull _unit) then
{
bank_query_funds = serv_bank_funds;
(_unit getVariable ["ownerID", -1]) publicVariableClient "bank_query_funds";
};
};

"life_capture_list" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
{
_flag = call compile format["capture_flag_%1", _forEachIndex + 1];
_flag setpos [getpos _flag select 0, getpos _flag select 1, ((_x select 2) - 1) * 5];
} foreach life_capture_list;
};

"life_killed" addPublicVariableEventHandler
{
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
{
_flag = call compile format["capture_flag_%1", _forEachIndex + 1];
_flag setpos [getpos _flag select 0, getpos _flag select 1, ((_x select 2) - 1) * 5];
} foreach life_capture_list;
};

"life_configuration" addPublicVariableEventHandler { if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); }; [] spawn DB_fnc_updateConfig; };

"life_stock_update" addPublicVariableEventHandler {
if (isServer && ASY_UsingHeadless) exitWith { (owner HC1) publicVariableClient (_this select 0); };
private ["_val","_old","_data","_index","_value"];
_data = _this select 1;
_old = 0;
_index = -1;
{
if ((_x select 0) == (_data select 0)) exitWith
{
_old = (_x select 1);
_val = _old + (_data select 1);
if (_val < 0) then { _val = 0 };

_index = _forEachIndex;
_value = [(_x select 0), _val];
}
} forEach life_price_index;
if (_index > -1) then { life_price_index set [_index, _value]; };

life_stock_change = [_data select 0,_val];
publicVariable "life_stock_change";
if (!isNull (_data select 2)) then
{
life_approved = (_old > 0);
((_data select 2) getVariable ["ownerID", -1]) publicVariableClient "life_approved";
};
};