class CfgNotifications
{
	class Tutorial
	{
		title = "Tutorial Aufgabe";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		duration = 10;
		priority = 8;
	};

	class MedicalRequestEmerg
	{
		title = "Notruf";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		duration = 5;
		priority = 7;
	};
	
	class DeliveryAssigned
	{
		title = "Kurierauftrag angenommen!";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		duration = 10;
		priority = 7;
	};
	
	class DeliveryFailed
	{
		title = "Kurierauftrag fehlgeschlagen!";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskiconfailed_ca.paa";
		description = "%1";
		duration = 7;
		priority = 7;
	};
	
	class DeliverySucceeded
	{
		title = "Kurierauftrag abgeschlossen!";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcondone_ca.paa";
		description = "%1";
		duration = 6;
		priority = 6;
	};
	
	class TextMessage
	{
		title = "SMS Empfangen";
		iconPicture = "core\textures\icons\messagenew.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};
	
	class PoliceDispatch
	{
		title = "Notruf";
		iconPicture = "core\textures\icons\messagepolice.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};
	
	class AdminDispatch
	{
		title = "Admin Notruf";
		iconPicture = "core\textures\icons\messageadmin.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};
	
	class AdminMessage
	{
		title = "ADMIN Nachricht";
		iconPicture = "core\textures\icons\messageadmin.paa";
		description = "%1";
		duration = 10;
		priority = 5;
	};
};