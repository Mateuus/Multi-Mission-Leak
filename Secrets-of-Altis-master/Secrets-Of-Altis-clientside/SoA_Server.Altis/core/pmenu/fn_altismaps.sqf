disableSerialization;
createDialog "altismaps";

_dialog = finddisplay 3800;
_list = _dialog displayCtrl 3802;

_orte = [
	["juwelier_1","Antiquitätenhandel"],
	["tomate_1","Atomtomatenplantage"],
	["oil_trader_3_1","Baustoffhandel"],
	["bs_1","Bohrinsel Altis"],
	["duauch","Brauerei Altis"],
	["hothouse","Das heiße Haus"],
	["diamond_1","Diamantenbergwerk"],
	["dimond_1","Diamantschleiferei"],
	["iron_1","Eisenader"],
	["iron_processing","Eisenverhüttung"],
	["scheißdrauf","Flaschenabfüllanlage"],
	["airport","Flughafen Altis"],
	["antik_2","Forschungsaußenposten"],
	["fed_reserve_1","Fort Knox"],
	["bridge_marker","Gedächtnisbrücke"],
	["antik_1","Grabungsstätte"],
	["yeast_1","Hefeanbaugebiet"],
	["hops_1","Hopfenanbaugebiet"],
	["antik_3","Institut für Archäologie"],
	["jail","JVA-Altis"],
	["juwelier","Juwelier"],
	["kakao_1","Kakaoplantage"],
	["conf","Konditorei Selakano"],
	["antik_5","Kunstgalerie"],
	["copper_1","Kupferader"],
	["copper_mine_1","Kupferschmelze"],
	["civ_truck_shop1","LKW-Handel Kavala"],
	["boat_2_1_2","Luxusboote S&R"],
	["copper_2","Metallhandel Altis"],
	["metzger1_1","Metzgerei"],
	["hunting_marker2","Nationalpark Altis"],
	["police_hq","Polizeipräsidium Altis"],
	["rye_1","Roggenanbaugebiet"],
	["salat_1","Salatfeld"],
	["salt_trader_1","Salzankauf"],
	["salt_1","Salzgewinnungsanlage"],
	["Salt","Salzraffinerie"],
	["scheißdrauf_1","Schlachthof"],
	["schneider","Schneiderei Kavala"],
	["schokofabrik","Schokoladenfabrik"],
	["rock_1","Steinbruch"],
	["rock_proc","Steinmetz"],
	["don","Villa von Don Ator"]
];

_safezones = [
	"safezone_kavala1",
	"safezone_kavala4",
	"safezone_kavala5",
	"safezone_athira2",
	"safezone_athira3",
	"safezone_pyrgos2",
	"safezone_pyrgos3",
	"safezone_sofia2",
	"safezone_sofia3",
	"safezone_kupfer1",
	"safezone_kupfer2",
	"safezone_kupfer3",
	"safezone_airport",
	"safezone_mine",
	"safezone_donator",
	"safezone_agios",
	"gen_marker1",
	"gen_marker2",
	"gen_marker3",
	"gen_marker4"
];

{if!(_x in _safezones) then {_x setMarkerAlphaLocal 1};} foreach allMapMarkers;
life_legend = [4,4,true,true,true,true,true,true,true,true,true,true,true,true,true];

{
	_list lbadd format["%1",_x select 1];
	_list lbSetData [(lbSize _list)-1,_x select 0];
} foreach _orte;