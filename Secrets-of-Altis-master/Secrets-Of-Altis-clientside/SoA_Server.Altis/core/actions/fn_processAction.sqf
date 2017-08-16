/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error1","_error2","_2var","_level","_klarname","_exp","_handle"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};
if!(isNull objectParent player) exitWith {hint "Du kannst aus einem Fahrzeug heraus nichts verarbeiten!"};

_error1 = false; // used below check the comment there ;) 
_error2 = false;
_klarname = "";
_klarname2 = "";
_level = "";
_exp = 0;

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",1200,(localize "STR_Process_Oil"),false,"","",4,"Öl",150]};
	case "plastik": {["plastikmuell","plastik",1200,"Kunststoff wird hergestellt...",false,"","",5,"Kunststoff",125]};
	case "diamond": {["diamond","diamondc",2050,(localize "STR_Process_Diamond"),false,"","",6,"Diamanten",200]};
	case "heroin": {["heroinu","heroinp",1750,(localize "STR_Process_Heroin"),false,"","",7,"Heroin",300]};
	case "copper": {["copperore","copper_r",1350,(localize "STR_Process_Copper"),false,"","",2,"Kupfer",50]};
	case "iron": {["ironore","iron_r",1120,(localize "STR_Process_Iron"),false,"","",2,"Eisen",50]};
	case "sand": {["sand","glass",1000,"Quarzsand wird verarbeitet...",false,"","",3,"Quarzsand",150]};
	//case "bottler": {["glass","bottles",1500,"Glasflasche herstellen...",false,"","",4,"Glasflaschen",80]};
	case "salt": {["salt","salt_r",1250,(localize "STR_Process_Salt"),false,"","",4,"Salz",100]};
	case "cocaine": {["cocaine","cocainep",1500,(localize "STR_Process_Cocaine"),false,"","",5,"Kokain",400]};
	case "marijuana": {["cannabis","marijuana",1700,(localize "STR_Process_Marijuana"),false,"","",6,"Marihuana",200]};
	case "cement": {["rock","cement",1350,(localize "STR_Process_Cement"),true,"sand","Sand",3,"Zement",150]};
	//case "mash": {["water","mash",1000,"Maische mischen...",true,"cornmeal","Maismehl",5,"Maische",100]};
	case "whiskey": {["yeast","whiskey",1000,"Whiskey wird gegärt...",true,"rye","Roggen",10,"Whiskey",200]};
	case "beer": {["yeast","beerp",1500,"Bier wird gebraut...",true,"hops","Hopfen",9,"Bier",150]};
	case "moonshine": {["yeast","moonshine",1550,"Schnaps wird schwarzgebrannt...",true,"mash","Maische",10,"Schnaps",400]};
	case "bottledshine": {["moonshine","bottledshine",1600,"Flasche wird befüllt...",true,"bottles","Flaschen",10,"Schnapsflaschen",600]};
	case "bottledbeer": {["beerp","bottledbeer",1600,"Flasche wird befüllt...",true,"bottles","Flaschen",9,"Bierflaschen",350]};
	case "bottledwhiskey": {["whiskey","bottledwhiskey",1600,"Flasche wird befüllt...",true,"bottles","Flaschen",10,"Whiskeyflaschen",450]};
	case "hen": {["henraw","henmeat",1000,"Hähnchenfleisch wird zubereitet...",true,"salt","Salz",4,"Hähnchenfleisch",100]};
	case "rooster": {["roosterraw","roostermeat",1100,"Hühnchenfleisch wird zubereitet...",true,"salt","Salz",4,"Hühnchenfleisch",150]};
	case "sheep": {["sheepraw","sheepmeat",1200,"Schafsfleisch wird zubereitet...",true,"salt","Salz",4,"Schafsfleisch",200]};
	case "goat": {["goatraw","goatmeat",1300,"Ziegenfleisch wird zubereitet...",true,"salt","Salz",4,"Ziegenfleisch",250]};
	case "rabbit": {["rabbitraw","rabbit",1000,"Hasenfleisch wird zubereitet...",false,"","",4,"Hasenfleisch",50]};
	case "bratwurst": {["henmeat","bratwurst",1500,"Bratwurst wird hergestellt...",true,"cornmeal","Maismehl",6,"Bratwurst",400]};
	case "plutonium": {["plutoniumu","plutonium",10000,"Plutonium wird gereinigt...",false,"","",8,"Plutonium",450]};
	case "holz": {["holz","bauholz",1500,"Bauholz wird hergestellt...",false,"","",3,"Bauholz",80]};
	case "perlen": {["perlen","perlenp",5000,"Perlen werden gesäubert...",false,"","",11,"Gesäuberte Perlen",500]};
	case "schokolade": {["kakaobohne","schokolade",1000,"Schokolade wird verfeinert...",false,"","",3,"Schokolade",100]};
	case "praline": {["schokolade","praline",2222,"Pralinen werden raffiniert...",true,"moonshine","Schnaps",6,"Pralinen",250]};
	case "kakao": {["kakaobohne","kakao",900,"Kakao wird verarbeitet...",true,"bottles","Flaschen",4,"Trinkkakao",150]};
	case "salat": {["salat","gsalat",0,"Salat wird gewaschen...",true,"tomate","Atomtomaten",1,"Gemischter Salat",50]};
	case "schrott": {["schrott","schrott_p",0,"Schrott wird gepresst...",false,"","",0,"Gepresster Schrott",0]};
	case "medizin": {["medizin","medizin_p",0,"Inhaltsstoffe werden verwendet...",false,"","",0,"Medizin",0]};
	
	default {[];};
};

if(playerside == civilian) then {
	//Level Checking
	_klarname2 = _itemInfo select 6;
	_level = _itemInfo select 7;
	_klarname = _itemInfo select 8;
	_exp = _itemInfo select 9;
	if(life_level < _level) then {_exp = (_exp/2)};
} else {
	_klarname2 = _itemInfo select 6;
	_klarname = _itemInfo select 8;
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.  // true if process action is with 2 Items and false if processing with 1 Item.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_2var = _itemInfo select 4;
if(_2var) then {_oldItem2 = _itemInfo select 5;};

//mari_processor,coke_processor,heroin_processor,
if(_vendor in [schlachthof_1,schlachthof_2,metzger_1,metzger_2,perlen,schoko_1,salaterie,Apotheker_1,adac_process]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);
//2vars
if(_2var) then { _oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle); }; 

if(_2var) then { 
       if(_oldVal != _oldVal2) then {
			if(_oldVal > _oldVal2) then {_error1 = true;};
			//if(_oldVal2 < _oldVal) then {_error2 = true;};
       };   
};
if(_error1) exitWith{hint format["Du hast zu wenig %1 um %2 verarbeiten zu können!",_klarname2,_klarname]};
//if(_error2) exitWith{hint "Du brauchst von beiden Gegenstaenden die gleiche Anzahl!"};

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

life_is_processing = true;

if(_hasLicense) then
{

		_sleep = 0.3;
		_cP = 0.02;

		_handle = [_upp,_sleep,_cP,nil,_vendor,4] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_is_processing = false;};
		if(life_process_bad) exitWith {life_process_bad = false; life_is_processing = false;};
		
			
			if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {life_is_processing = false;};
			if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {life_is_processing = false;};

			if(_2var) then 
			{
				
				([false,_oldItem2,_oldVal] call life_fnc_handleInv);
				titleText[format["Du hast %1 erstellt.",_klarname],"PLAIN"];
			} else
			{
				titleText[format["Du hast %1 erstellt.",_klarname],"PLAIN"];
			};

			if(playerside == civilian) then {
				life_exp = life_exp + round(random(_exp));
				[] spawn life_fnc_exptolevel;
			};
			
			life_is_processing = false;
} else {
			if(life_beatgeld < _cost) exitWith {hint format["Du brauchst %1€ um %2 herstellen zu können!",[_cost] call life_fnc_numberText,_klarname]; life_is_processing = false;};

		_sleep = 0.3;
		_cP = 0.02;

		_handle = [_upp,_sleep,_cP,nil,_vendor,4] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_is_processing = false;};
		if(life_process_bad) exitWith {life_process_bad = false; life_is_processing = false;};

			if(life_beatgeld < _cost) exitWith {hint format["Du brauchst %1€ um ohne Lizenz zu verarbeiten!",[_cost] call life_fnc_numberText]; life_is_processing = false;};
			if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {life_is_processing = false;};
			if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {life_is_processing = false;};
			
			if(_2var) then 
			{
				
				([false,_oldItem2,_oldVal] call life_fnc_handleInv);
				titleText[format["Du hast 1% für %2 erstellt.",_klarname,[_cost] call life_fnc_numberText],"PLAIN"];
			} else
			{
				titleText[format["Du hast %1 für %2 erstellt.",_klarname,[_cost] call life_fnc_numberText],"PLAIN"];
			};
			
			life_beatgeld = life_beatgeld - _cost;
			
			if(playerside == civilian) then {
				life_exp = life_exp + round(random(_exp));
				[] spawn life_fnc_exptolevel;		
			};
		
			life_is_processing = false;
}; 