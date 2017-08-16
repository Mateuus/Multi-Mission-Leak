
private["_schatzitemsspecial1","_schatzitemsspecial2","_schatzitemsspecial3","_ressource"];

_schatzitemsspecial1 = [

	"goldbar",
	"volleyball",
	"airhorn"
];

_ressource = _schatzitemsspecial1 select floor random count _schatzitemsspecial1;
[_ressource,1] call life_fnc_handleinvCheck;
