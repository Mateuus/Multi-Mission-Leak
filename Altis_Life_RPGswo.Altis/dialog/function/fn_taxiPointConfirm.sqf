/*
	File: fn_taxiPintConfirm.sqf
	Author: MarkusSR1984
	
	Description: Gibt den Fahrbefehl an das Taxi
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;

if(count DWEV_taxi_point == 0) then
{
	// Fehlerbehandlung = >> öffne auswahldialog erneut
	[] call DWEV_fnc_taxiMenu;
}
	else
{
	
	if (typeName (DWEV_taxi_point select 0) == "ARRAY") then 
	{
		(driver vehicle player) setVariable["taxiziel",(DWEV_taxi_point select 0),true];
	}
	else
	{
		(driver vehicle player) setVariable["taxiziel",(getMarkerPos (DWEV_taxi_point select 0)),true];
	};
		
	
	MSR_Taximeter_Layer = "MSR_Taximieter" call BIS_fnc_rscLayer;
	MSR_Taximeter_Layer cutRsc ["DWEV_taximeter","PLAIN"]; // Taximeter öffnen
};