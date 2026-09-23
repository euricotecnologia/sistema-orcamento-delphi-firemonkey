unit form_clientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.TabControl, Data.DB, MemDS, DBAccess, Uni, FMX.Objects, FMX.ListBox,
  FMX.Edit, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  System.Actions, FMX.ActnList, FMX.Effects, FMX.Ani, FMX.TMSCustomEdit,
  FMX.TMSSearchEdit, FMX.TMSBaseControl, FMX.TMSCustomPicker,
  FMX.TMSRadioGroupPicker;

type
  Tfclientes = class(TForm)
    topo: TToolBar;
    Label1: TLabel;
    fecha: TButton;
    log: TButton;
    geral: TLayout;
    tab: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    lista: TListView;
    form: TLayout;
    clientes: TUniQuery;
    ds_clientes: TUniDataSource;
    icone: TImage;
    editar: TImage;
    excluir: TImage;
    tnome: TEdit;
    tend: TEdit;
    btsalvar: TRoundRect;
    Label5: TLabel;
    btCancelar: TRoundRect;
    Label6: TLabel;
    ActionList1: TActionList;
    frente: TNextTabAction;
    volta: TPreviousTabAction;
    fundo: TImage;
    auxiliar: TUniQuery;
    Layout3: TLayout;
    add: TCircle;
    Label2: TLabel;
    ShadowEffect1: TShadowEffect;
    roda: TFloatAnimation;
    clientesid: TIntegerField;
    clientescod: TIntegerField;
    clientesrazao: TStringField;
    clientesfantasia: TStringField;
    clientesend: TStringField;
    clientescidade: TStringField;
    clientesuf: TStringField;
    clientesemail: TStringField;
    clientestel: TStringField;
    clientescel: TStringField;
    clientescep: TStringField;
    clientestipo: TStringField;
    clientescnpj: TStringField;
    clientesie: TStringField;
    clientesdatacad: TDateField;
    clientesatualizacao: TDateTimeField;
    clientesstatus: TStringField;
    clientesusuario: TIntegerField;
    tfantasia: TEdit;
    tab_dados: TTabControl;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    Layout4: TLayout;
    tbairro: TEdit;
    tnum: TEdit;
    temail: TEdit;
    Layout2: TLayout;
    ttel: TEdit;
    tcel: TEdit;
    Layout5: TLayout;
    tcompl: TEdit;
    Layout1: TLayout;
    tcidade: TEdit;
    tuf: TComboBox;
    Layout6: TLayout;
    tcpf: TEdit;
    tie: TEdit;
    Layout7: TLayout;
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
    LinkControlToField9: TLinkControlToField;
    clientescompl: TStringField;
    clientesbairro: TStringField;
    clientesnum: TIntegerField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    LinkControlToField12: TLinkControlToField;
    RoundRect1: TRoundRect;
    tcep: TEdit;
    LinkControlToField13: TLinkControlToField;
    ttipo: TComboBox;
    Label3: TLabel;
    edtBusca: TEdit;
    SearchEditButton1: TSearchEditButton;
    VertScrollBox1: TVertScrollBox;
    VertScrollBox2: TVertScrollBox;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    procedure fechaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure logoutClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btsalvarClick(Sender: TObject);
    procedure listaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure logClick(Sender: TObject);
    procedure rodaFinish(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtBuscaExit(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabChange(Sender: TObject);
  private
    { Private declarations }

    procedure listagem;
    procedure busca(texto:string);//Busca Clientes

    var FTecladoShow : Boolean;


  public
    { Public declarations }
  end;

var
  fclientes: Tfclientes;

implementation

{$R *.fmx}

uses form_menu, form_capa;

procedure Tfclientes.logClick(Sender: TObject);
begin
Close;
fmenu.Close;
end;

procedure Tfclientes.logoutClick(Sender: TObject);
begin
clientes.Insert;
clientesstatus.Value:='ATIVO';
roda.StartFromCurrent:=True;
roda.StopValue:=270;
roda.Start;
frente.ExecuteTarget(Self);
end;

procedure Tfclientes.rodaFinish(Sender: TObject);
begin
add.Visible:=False;
add.RotationAngle:=0;
end;

procedure Tfclientes.SearchEditButton1Click(Sender: TObject);
begin
busca(edtBusca.Text);
end;

procedure Tfclientes.tabChange(Sender: TObject);
begin
if tab.TabIndex=0 then
begin
  tnome.Text:='';
  tfantasia.Text:='';
  tend.Text:='';
  tbairro.Text:='';
  tcompl.Text:='';
  tnum.Text:='';
  tcidade.Text:='';
  tuf.ItemIndex:=12;
  tcep.Text:='';
  tcpf.Text:='';
  tie.Text:='';
  ttipo.ItemIndex:=0;
  temail.Text:='';
  tcel.Text:='';
  ttel.Text:='';
  if clientes.State in [dsInsert,dsEdit] then
  begin
    clientes.Cancel;
  end;
end;
end;

procedure Tfclientes.Button1Click(Sender: TObject);
begin
listagem;
end;

procedure Tfclientes.edtBuscaExit(Sender: TObject);
begin
//Nessa procedure caso a busca form em branco traz tudo ! Pode limitar a busca para não carregar o velular
busca(edtBusca.Text);
end;

procedure Tfclientes.fechaClick(Sender: TObject);
begin
if tab.ActiveTab.Index=0 then
    begin
      fclientes.Close;
    end
    else
    begin
    volta.ExecuteTarget(Self);
    clientes.Cancel;
    add.Visible:=True;
    end;
end;

procedure Tfclientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
clientes.Close;
fclientes:=nil;
end;

procedure Tfclientes.FormCreate(Sender: TObject);
begin
busca('-1');
end;

procedure Tfclientes.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
FTecladoShow := false;

     if not KeyboardVisible then
        AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure Tfclientes.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);

  var
     O: TFMXObject;

begin
FTecladoShow := true;

     if Assigned(Focused) and (Focused.GetObject is TControl) then
        if TControl(Focused).AbsoluteRect.Bottom - Padding.Top >= (Bounds.Top - (topo.Height)) then
        begin

             for O in Children do
                 if (O is TFloatAnimation) and (TFloatAnimation(O).PropertyName = 'Padding.Top') then
                    TFloatAnimation(O).StopAtCurrent;

             AnimateFloat('Padding.Top',Bounds.Top - (topo.Height) - TControl(Focused).AbsoluteRect.Bottom + Padding.Top, 0.1);
        end
        else
     else
        AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure Tfclientes.listagem;
var
item:TListViewItem;
I:Integer;
begin

      lista.Items.Clear;
      

      if clientes.RecordCount > 0 then
      begin

        clientes.First;
        lista.BeginUpdate;

        for I := 0 to clientes.RecordCount - 1 do
        begin
          item:=lista.Items.Add;
          item.Data['fundo']:=fundo.Bitmap;
          item.Data['editar']:=editar.Bitmap;
          item.Data['excluir']:=excluir.Bitmap;
          item.Data['icone']:=icone.Bitmap;
          item.Data['cliente']:=clientes.FieldByName('razao').AsString;
          item.Data['cod']:=clientes.FieldByName('id').AsString;
          item.Tag:=clientes.FieldByName('id').AsInteger;
          clientes.Next;
        end;

        lista.EndUpdate;

      end
      else
      ShowMessage('NENHUM REGISTRO ENCONTRADO !');


end;

procedure Tfclientes.listaItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
begin

    if fcapa.nivel='ADM' then
    begin

      if (LocalClickPos.X >= lista.Width -42) then
      begin

        with auxiliar do
        begin
          Close;
          sql.Clear;
          sql.Add('delete from clientes where id=:id');
          ParamByName('id').Value:=StrToInt(lista.Items[ItemIndex].Objects.FindDrawable('cod').Data.AsString);
          ExecSQL;
        end;
        ShowMessage('CADASTRO EXCLUÍDO COM SUCESSO !');
        listagem;
      end
      else  if  (LocalClickPos.X < lista.Width - 50)  then
      begin
        with clientes do
        begin
          Close;
          sql.Clear;
          sql.Add('select * from clientes where id=:id');
          ParamByName('id').Value:=StrToInt(lista.Items[ItemIndex].Objects.FindDrawable('cod').Data.AsString);
          Open;
          Edit;
          add.Visible:=False;
          frente.ExecuteTarget(Self);
        end;
      end;

    end
    else
    ShowMessage('VOCÊ NÃO TEM PERMISSÃO PARA MODIFICAR O CADASTRO ! ENTRE EM CONTATO COM O ADMINISTRADOR DO SISTEMA ! ');


end;

procedure Tfclientes.btsalvarClick(Sender: TObject);
begin
  if (tnome.Text<> '') and (tend.Text<>'') and (tcpf.Text <> '') and (temail.Text <> '') then
  begin
    clientesatualizacao.AsDateTime:=TDateTime(Now);
    clientescod.Value:=fcapa.id_usuario;
    clientes.Post;
    ShowMessage('CADASTRO REALIZADO COM SUCESSO !');
    volta.ExecuteTarget(Self);
    add.Visible:=True;
    listagem;
  end
  else
  begin
    ShowMessage('INFORME A RAZÃO SOCIAL/NOME DO CLIENTE, ENDEREÇO COMPLETO, CNPJ OU CPF E O E-MAIL DE CONTATO POR FAVOR !');
  end;

end;



procedure Tfclientes.busca(texto: string);
begin
        with clientes do
        begin
          Close;
          sql.Clear;
          sql.Add('select * from clientes where razao like :busca order by razao asc');
          ParamByName('busca').value:=trim(texto)+'%';
          Open;

          if (RecordCount = 0) and (edtBusca.Text <> '') then
          begin
            ShowMessage('NENHUM REGISTRO ENCONTRADO !');
          end
          else
          begin
            listagem;
          end;

          add.Visible:=True;
        end;

        edtBusca.Text:='';
        edtBusca.SetFocus;
end;

procedure Tfclientes.btCancelarClick(Sender: TObject);
begin
volta.ExecuteTarget(Self);
add.Visible:=True;
clientes.Cancel;
end;

end.
