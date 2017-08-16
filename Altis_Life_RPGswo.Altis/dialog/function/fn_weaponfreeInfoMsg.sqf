/*
	File:	fn_weaponfreeInfoMsg.sqf
	Autor:	MarkusSR1984

	Description: Zeigt Informationen zum Event Weaponfree an
*/
#define welcomeText 3200
private ["_teamrules", "_teamicon", "_teamcol"];

_msgType = param [0,"join",[""]];

10 cutrsc["WelcomeMessage", "PLAIN"];
disableSerialization;

_display = uiNamespace getVariable "WelcomeMessage";
_control = _display displayCtrl welcomeText;

_message = switch (_msgType) do 
{
	case "enable":
	{
		"<t shadow=""1"" align=""center"" size=""2.3"" color=""#FF0000"">~~! Event Weaponfree !~~<br/><br/><br/>
		<t align=""left"" size=""1.25"" color=""#00FF00"">Der starke Mann ist stärker ohne Gewalt.<br/><br/>
		Gewalt ist entweder die Folge geistiger oder die Folge sozialer Armut.<br/><br/>
		Um den Weltfrieden zu schützen lehnen wir Gewalt gegen Gewalt ab.<br/><br/>
		In der Event Zeit ist nur die Signalpistole und der Taser erlaubt.<br/><br/>
		Teamspeak: ts.division-wolf.de</t></t>"
	};

	case "disable":
	{
		"<t shadow=""1"" align=""center"" size=""2.3"" color=""#FF0000"">~~! Event Weaponfree ist zu Ende !~~<br/><br/><br/>
		<t align=""left"" size=""1.25"" color=""#00FF00"">Es sind nun wieder alle Waffen erlaubt<br/><br/>
		und wir gehen nun wieder in den normalen Spielfluss über.<br/><br/>
		Viel Spass weiterhin.</t></t>"
	};
	
	default  
	{
		"<t shadow=""1"" align=""center"" size=""2.3"" color=""#FF0000"">Willkommen bei<br/><t size=""6"" color=""#800000"">Division Wolf </t><br/><br/>
		~~! Event Weapon free !~~<br/><br/><br/><t align=""left"" size=""1.25"" color=""#00FF00"">
		Der starke Mann ist stärker ohne Gewalt.<br/><br/>
		Gewalt ist entweder die Folge geistiger oder die Folge sozialer Armut.<br/><br/>
		Um den Weltfrieden zu schützen lehnen wir Gewalt gegen Gewalt ab.<br/><br/>
		In der Event Zeit ist nur die Signalpistole und der Taser erlaubt.<br/><br/>
		Teamspeak: ts.division-wolf.de</t></t>"
	};

};




_control ctrlSetStructuredText (parseText _message);

sleep 20;

_control ctrlSetFade 1;
_control ctrlCommit 2;

waitUntil {ctrlCommitted _control};

_control ctrlShow false;
_control ctrlCommit 0;


