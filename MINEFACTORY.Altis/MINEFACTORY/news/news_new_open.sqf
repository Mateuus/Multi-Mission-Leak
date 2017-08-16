/*

	Author Shinji
	Öffnet die News Paper des Servers man kann diese Editieren...

*/


_ok = createDialog "mp_news_paper_new";
disableSerialization;
waitUntil {!isNull (findDisplay 8190)};
_display = findDisplay 8190;
waitUntil { !dialog };