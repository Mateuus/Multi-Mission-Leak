class CfgNotifications
{
	class MedicalRequestEmerg
	{
		title = "Neuer Einsatz!";
		iconPicture = "icons\sani.paa";
		description = "%1";
		duration = 5;
		priority = 7;
	};
	
	class DeliveryAssigned
	{
		title = "Auftrag angenommen";
		iconPicture = "icons\tool_sign.paa";
		description = "%1";
		duration = 10;
		priority = 7;
	};
	
	class DeliveryFailed
	{
		title = "Auftrag fehlgeschlagen";
		iconPicture = "icons\tool_sign.paa";
		description = "%1";
		duration = 7;
		priority = 7;
	};
	
	class DeliverySucceeded
	{
		title = "Auftrag erledigt";
		iconPicture = "icons\tool_sign.paa";
		description = "%1";
		duration = 6;
		priority = 6;
	};
	
	class TextMessage
	{
		title = "Neue Nachricht!";
		iconPicture = "icons\normal.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};
	
	class PoliceDispatch
	{
		title = "110 Polizeinotruf";
		iconPicture = "icons\polizei.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};

	class SaniDispatch
	{
		title = "112 Notdienst";
		iconPicture = "icons\sani.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};
	
	class AdminDispatch
	{
		title = "Support-Anfrage";
		iconPicture = "icons\support.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};
	
	class AdminMessage
	{
		title = "Support-Nachricht";
		iconPicture = "icons\support.paa";
		description = "%1";
		duration = 10;
		priority = 5;
	};
};