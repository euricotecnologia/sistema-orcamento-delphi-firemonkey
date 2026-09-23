unit form_menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.MultiView,
  FMX.ListView.Types,FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, Data.DB,
  DBAccess, Uni, MemDS;

type
  Tfmenu = class(TForm)
    topo: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    Layout1: TLayout;
    ScaledLayout1: TScaledLayout;
    menuCentral: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Rectangle4: TRectangle;
    Image5: TImage;
    Rectangle6: TRectangle;
    Image6: TImage;
    Rectangle7: TRectangle;
    Image7: TImage;
    Rectangle8: TRectangle;
    Image8: TImage;
    Layout2: TLayout;
    Layout9: TLayout;
    Label2: TLabel;
    Layout10: TLayout;
    Label3: TLabel;
    Layout11: TLayout;
    Layout12: TLayout;
    Layout13: TLayout;
    Label4: TLabel;
    Layout14: TLayout;
    Label5: TLabel;
    Layout15: TLayout;
    Image1: TImage;

    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  fmenu: Tfmenu;

implementation

{$R *.fmx}

uses form_capa,  form_clientes,form_cad_atendentes, form_cad_servicos, form_opcoes, form_termos;

procedure Tfmenu.Button1Click(Sender: TObject);
begin
fmenu.Close;
end;

procedure Tfmenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin

fmenu:=nil;
end;

procedure Tfmenu.Image3Click(Sender: TObject);
begin
if fcad_servicos=nil then
fcad_servicos:=Tfcad_servicos.Create(Self);
fcad_servicos.Show;
end;

procedure Tfmenu.Image4Click(Sender: TObject);
begin
if fcad_atendentes=nil then
fcad_atendentes:=Tfcad_atendentes.Create(Self);
fcad_atendentes.Show;
end;

procedure Tfmenu.Rectangle2Click(Sender: TObject);
begin
  if fclientes=nil then
  fclientes:=Tfclientes.Create(Self);
  fclientes.Show;

end;

procedure Tfmenu.Rectangle3Click(Sender: TObject);
begin
if fcad_servicos=nil then
fcad_servicos:=Tfcad_servicos.Create(Self);
fcad_servicos.Show;
end;

procedure Tfmenu.Rectangle4Click(Sender: TObject);
begin
if fcad_atendentes=nil then
fcad_atendentes:=Tfcad_atendentes.Create(Self);
fcad_atendentes.Show;

end;

procedure Tfmenu.Rectangle6Click(Sender: TObject);
begin
 if fopcoes=nil then
 fopcoes:=Tfopcoes.Create(Self);
 fopcoes.Show;
end;

end.
