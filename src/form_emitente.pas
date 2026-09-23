unit form_emitente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls,DB, FMX.Controls.Presentation, FMX.Objects, FMX.Edit, FMX.ListBox,MaskUtils,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  Tfemitente = class(TForm)
    topo: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    bt_host: TButton;
    VertScrollBox1: TVertScrollBox;
    ScaledLayout1: TScaledLayout;
    fundo: TRectangle;
    formulario: TLayout;
    nome: TEdit;
    endereco: TEdit;
    Layout1: TLayout;
    cidade: TEdit;
    estado: TComboBox;
    Layout2: TLayout;
    cnpj: TEdit;
    insc: TEdit;
    Layout3: TLayout;
    telefone: TEdit;
    celular: TEdit;
    email: TEdit;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure bt_hostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  femitente: Tfemitente;

implementation

{$R *.fmx}

uses form_capa;

procedure Tfemitente.bt_hostClick(Sender: TObject);
begin
  if nome.Text <> '' then
  begin
    fcapa.emitente.Post;
    ShowMessage('CONFIGURAÇÕES SALVAS COM SUCESSO !');
    femitente.Close;
  end
  else
  begin
    ShowMessage('COLOQUE O NOME DA EMPRESA !');
  end;

end;

procedure Tfemitente.Button1Click(Sender: TObject);
begin
femitente.Close;
end;

procedure Tfemitente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if fcapa.emitente.State in [dsEdit] then
begin
  fcapa.emitente.Cancel;
end;
femitente:=nil;
end;

procedure Tfemitente.FormCreate(Sender: TObject);
begin
fcapa.emitente.Edit;
end;

end.
