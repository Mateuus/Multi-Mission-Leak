class CfgDebriefing
{
	class NotWhitelisted
	{
		title = "Mission Failed";
		subtitle = "You are not white-listed to use this slot";
		description = "You are not allowed to use this slot because you do not have the appropriate permissions, try another slot.";
		pictureBackground = "";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};
	
	class Blacklisted
	{
		title = "Mission Failed";
		subtitle = "You are blacklisted from cops";
		description = "You are not allowed to be a cop due to previous actions and the admins have removed you from being a cop.";
		pictureBackground = "";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class Error
	{
		title = "Error";
		subTitle = "Es gab einen Fehler";
		description = "Es gab einen Fehler. Bitte reconnecte erneut zum Server und versuche es erneut.";
		pictureBackground = "";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class NotPremium
	{
		title = "Kein Premium Mitglied";
		subTitle = "Sie sind kein Premium Mitglied";
		description = "Sie sind kein Premium Mitglied. Bitte verwenden Sie den Zivilisten-Slot";
		pictureBackground = "Images\Logos\Logo.jpg";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class Abort
	{
		title = "Auf Wiedersehen";
		subtitle = "www.Eisenschmiede-Gaming.de";
		description = "Wir hoffen das du uns erneut besuchst.<br/>Check doch mal unsere Website auf www.Eisenschmiede-Gaming.de";
		pictureBackground = "Images\Logos\Logo.jpg";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};
	
	class Error_P
	{
        title = "VERIFICATION ERROR";
        subtitle = "Your account was not verified";
        description = "Due to technical problems the verification is currently not available, please try again later.";
        pictureBackground = "Images\Logos\Logo.jpg";
        picture = "";
		pictureColor[] = {0,0.3,0.6,1};
    };
    
    class Unbekannt 
    {
        title = "VERIFICATION ERROR";
        subtitle = "There was a problem verifying your account";
        description = "Please report this problem to the server admin and try again later.";
        pictureBackground = "Images\Logos\Logo.jpg";
        picture = "";
		pictureColor[] = {0,0.3,0.6,1};
    };

    class Privat 
    {
        title = "VERIFICATION ERROR";
        subtitle = "Your Steam profile is private!";
        description = "The server admin has configured this server to verify all user accounts. For this verification step your Steam profile has to be public. Please return to the lobby and rejoin once your Profile is public.";
        pictureBackground = "Images\Logos\Logo.jpg";
        picture = "";
		pictureColor[] = {0,0.3,0.6,1};
    };

    class NichtErlaubt
    {
        title = "VERIFICATION ERROR";
        subtitle = "Account not allowed to play";
        description = "Due to security measures this account is not allowed to play on this server.";
        pictureBackground = "Images\Logos\Logo.jpg";
        picture = "";
		pictureColor[] = {0,0.3,0.6,1};
    };

};