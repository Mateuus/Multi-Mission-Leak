/*
	File: fn_eventSystem.sqf
	Author: MarkusSR1984
	
	Description:
	Dies ist unser EventController
	
	 Hab nen hänger und komm nicht weiter :( / Bzw. fällt mir nich vernünftiges ein dass alle Kriterien erfüllt die ich erreichen möchte
*/

if (isNil "DWEV_event_objects") then {DWEV_event_objects = [];};

//DWEV_active_events = ["Name", "Skriptname","Objectfile"];
// DWEV_active_event_%Name% =


[] spawn 
{
		while {true} do
		{
			sleep 1;
			if ((count DWEV_active_events) > 0) then
			{
				
				
				
			}
			else // Keine Mapevents mehr aktiv
			{
				if ((count DWEV_event_objects) > 0) then
				{
					{
						deleteVehicle _x;
						false
					} count DWEV_event_objects;
				};
			};
			
		};
};