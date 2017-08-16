class CfgNotifications
{
	class BankJobAssigned
	{
		title = "Banküberfall - Operation Payday";
		iconPicture = "core\textures\icons\misc\BankJobAssigned.paa";
		description = "%1";
		duration = 10;
		priority = 7;
	};

	class BankJobFailed
	{
		title = "Banküberfall fehlgeschlagen";
		iconPicture = "core\textures\icons\misc\BankJobFailed.paa";
		description = "%1";
		duration = 10;
		priority = 7;
	};

	class BankJobUpdate
	{
		title = "Banküberfall Update";
		iconPicture = "core\textures\icons\misc\BankJobUpdate.paa";
		description = "%1";
		duration = 6;
		priority = 6;
	};

	class BankJobSucceeded
	{
		title = "Banküberfall abgeschlossen";
		iconPicture = "core\textures\icons\misc\BankJobSucceeded.paa";
		description = "%1";
		duration = 6;
		priority = 6;
	};

	class MedicalRequestEmerg
	{
		title = "EMS Anforderung";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		duration = 5;
		priority = 7;
	};
	
	class DeliveryAssigned
	{
		title = "Lieferjob angenommen";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		duration = 10;
		priority = 7;
	};

	class DeliveryFailed
	{
		title = "Lieferjob fehlgeschlagen";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskiconfailed_ca.paa";
		description = "%1";
		duration = 7;
		priority = 7;
	};

	class DeliverySucceeded
	{
		title = "Lieferjob abgeschlossen";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcondone_ca.paa";
		description = "%1";
		duration = 6;
		priority = 6;
	};

	class TextMessage
	{
		title = "Empfange Textnachricht";
		iconPicture = "core\textures\icons\misc\messagenew.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};

	class PoliceDispatch
	{
		title = "911 Dispatch Center";
		iconPicture = "core\textures\icons\misc\messagepolice.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};

	class AdminDispatch
	{
		title = "Admin Dispatch Center";
		iconPicture = "core\textures\icons\misc\messageadmin.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};

	class AdminMessage
	{
		title = "Admin Nachricht";
		iconPicture = "core\textures\icons\misc\messageadmin.paa";
		description = "%1";
		duration = 10;
		priority = 5;
	};

	// Standard Missions //
	class assignedMission
	{
		title = "Auftrag angenommen";
		iconPicture = "core\textures\icons\misc\job_new.paa";
		description = "%1";
		duration = 10;
		priority = 5;
	};

	class failedMission
	{
		title = "Auftrag fehlgeschlagen";
		iconPicture = "core\textures\icons\misc\job_fail.paa";
		description = "%1";
		duration = 10;
		priority = 5;
	};

	class succeededMission
	{
		title = "Auftrag erfolgreich";
		iconPicture = "core\textures\icons\misc\job_done.paa";
		description = "%1";
		duration = 10;
		priority = 5;
	};

	class updateMission
	{
		title = "Auftrag aktualisiert";
		iconPicture = "core\textures\icons\misc\job_update.paa";
		description = "%1";
		duration = 10;
		priority = 5;
	};
	// Standard Missions //
};