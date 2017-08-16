#include "..\macros.hpp"
/*
	File: fn_createObjects.sqf
	Author: MarkusSR1984
	Description: This is a File :P
*/

// Befehl zum auslesen der Objecte:
_DWEV_Objects = [];
_object_Files = [];

switch (worldName) do
{
	case "Altis":
	{
		_object_Files pushBack "core\objects\altis\kavalla_police.sqf";
		_object_Files pushBack "core\objects\altis\kavalla_markt.sqf";
		_object_Files pushBack "core\objects\altis\npc_lokal.sqf";
		_object_Files pushBack "core\objects\altis\kavalla_jail.sqf";
		_object_Files pushBack "core\objects\altis\kavalla_hospital.sqf";
		_object_Files pushBack "core\objects\altis\pyrgos_markt.sqf";
		_object_Files pushBack "core\objects\altis\pyrgos_police.sqf";

		_object_Files pushBack "core\objects\altis\krankenhaus_athira.sqf";
		_object_Files pushBack "core\objects\altis\airport_kart.sqf";
		_object_Files pushBack "core\objects\altis\airport_police.sqf";
		_object_Files pushBack "core\objects\altis\athira_police.sqf";

		_object_Files pushBack "core\objects\altis\bundesbank.sqf";
		_object_Files pushBack "core\objects\altis\casino.sqf";

		_object_Files pushBack "core\objects\altis\checkpoint_1.sqf";
		_object_Files pushBack "core\objects\altis\checkpoint_2.sqf";

		_object_Files pushBack "core\objects\altis\gang_hideout_1.sqf";
		_object_Files pushBack "core\objects\altis\gang_hideout_2.sqf";
		_object_Files pushBack "core\objects\altis\gang_hideout_3.sqf";

		_object_Files pushBack "core\objects\altis\general_atms.sqf";
		_object_Files pushBack "core\objects\altis\general_fuelstation.sqf";
		_object_Files pushBack "core\objects\altis\paintball.sqf";
		_object_Files pushBack "core\objects\altis\premium.sqf";
		_object_Files pushBack "core\objects\altis\rebell_hq.sqf";
		_object_Files pushBack "core\objects\altis\sofia_police.sqf";
		_object_Files pushBack "core\objects\altis\bankfili_mauern.sqf";
		_object_Files pushBack "core\objects\altis\werbung.sqf";
		_object_Files pushBack "core\objects\altis\muell.sqf";
	};

	case "Tanoa":
	{
		_object_Files pushBack "core\objects\tanoa\ravitaisland.sqf";
		_object_Files pushBack "core\objects\tanoa\georgetown_laeden.sqf";
		_object_Files pushBack "core\objects\tanoa\katkoula_laeden.sqf";
		_object_Files pushBack "core\objects\tanoa\lijnhaven_laeden.sqf";
		_object_Files pushBack "core\objects\tanoa\oumere_laeden.sqf";
		_object_Files pushBack "core\objects\tanoa\tuvanaka_laeden.sqf";
		_object_Files pushBack "core\objects\tanoa\verarbeiter_und_haendler.sqf";
		_object_Files pushBack "core\objects\tanoa\tavu_laeden.sqf";
		_object_Files pushBack "core\objects\tanoa\schrottplaetze_verwahrstelle_waffenlaeden.sqf";
		_object_Files pushBack "core\objects\tanoa\georgetown_feuerHQ.sqf";
		_object_Files pushBack "core\objects\tanoa\georgetown_jail.sqf";
		_object_Files pushBack "core\objects\tanoa\policeHQ_georgetown.sqf";
		_object_Files pushBack "core\objects\tanoa\rebell_vatukoulo.sqf";
		_object_Files pushBack "core\objects\tanoa\airport_helizeug.sqf";
		_object_Files pushBack "core\objects\tanoa\boot_service.sqf";
		_object_Files pushBack "core\objects\tanoa\ravita_cop_med.sqf";
		_object_Files pushBack "core\objects\tanoa\tanoa_bankfilialenschutz.sqf";
		_object_Files pushBack "core\objects\tanoa\lijnhaven_polizei_und_feuerHQ.sqf";
	};
	case "Stratis": {};
};

{
	{
		_tmp = (_x call DWEV_fnc_objectInit);
		false;
	} count (call compile preprocessFileLineNumbers _x);
	false;
} count _object_Files;
