#define Display 12000
#define KavalaBtn 12001
#define PanochoriBtn 12002
#define GalatiBtn 12003
#define AthiraBtn 12004
#define AirportBtn 12005
#define RodopoliBtn 12006
#define PyrgosBtn 12007
#define OutpostBtn 12008
#define SofiaBtn 12009

#define DIALOG_CREATE(string) if(!dialog) then {createDialog string;};
#define BTN_SHOW(control,bool) control ctrlShow bool;
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
