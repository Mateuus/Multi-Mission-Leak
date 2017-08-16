private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "app_auktion": {200000};
    case "app_lizenzen": {100};
    case "app_dp": {50000};
    case "app_hilfe": {1};
    case "app_karte": {150000};
	case "app_konto": {100};
	case "app_crafting": {85000};
	case "app_selfie": {25000};
	case "app_notizen": {10000};
};