// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#define welcomeText 3200

10 cutrsc["WelcomeMessage", "PLAIN"];

disableSerialization;

_display = uiNamespace getVariable "WelcomeMessage";
_control = _display displayCtrl welcomeText;

private ["_teamrules", "_teamicon", "_teamcol"];




_message = "<t shadow=""1"" align=""center"" size=""2.3"" color=""#FF0000"">Willkommen bei<br/><t size=""6"" color=""#800000"">Division Wolf </t><br/><br/>Da du Anfänger bist, achten wir ein wenig auf dich!<br/><br/><br/><t align=""left"" size=""1.25"" color=""#00FF00"">Solange du den Anfängerschutz trägst, kannst du nicht von Banditen erschossen oder ausgeraubt werden.<br/><br/>Zur besseren Erkennung trägst du einen Roten Namen und die Markierung 'Anfängerschutz' darunter. <br/><br/>Bevor du loslegst solltest du dir noch unsere Regeln und Gesetze durchlesen. Diese Findest du unter M<br/><br/>Und nun wünschen wir dir viel Spass beim erkunden unserer kleinen Insel<br/><br/>Teamspeak: ts.division-wolf.de</t></t>";
_control ctrlSetStructuredText (parseText _message);

sleep 20;

_control ctrlSetFade 1;
_control ctrlCommit 2;

waitUntil {ctrlCommitted _control};

_control ctrlShow false;
_control ctrlCommit 0;


