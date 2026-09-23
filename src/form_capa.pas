unit form_capa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.Effects,
  FMX.MultiView, FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,System.IOUtils,
  UniProvider, MySQLUniProvider, DBAccess, Uni,FMX.Ani,
  MemDS, System.ImageList, FMX.ImgList, FMX.TMSBaseControl, FMX.TMSPassLock,
  FMX.TMSLabelEdit,System.Permissions, FMX.TMSCustomEdit, FMX.TMSEdit;

type
  Tfcapa = class(TForm)
    topo: TToolBar;
    VertScrollBox1: TVertScrollBox;
    Button1: TButton;
    bt_host: TButton;
    Label1: TLabel;
    LOGO: TLayout;
    multi: TMultiView;
    Rectangle2: TRectangle;
    Label2: TLabel;
    txt_ip: TEdit;
    txt_senha: TEdit;
    txt_login: TEdit;
    txt_banco: TEdit;
    sql_host: TFDQuery;
    ds_host: TDataSource;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    sql_hostid: TFDAutoIncField;
    sql_hostip: TStringField;
    sql_hostbanco: TStringField;
    sql_hostlogin: TStringField;
    sql_hostsenha: TStringField;
    con: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    pedidos: TUniQuery;
    itens: TUniQuery;
    itensid: TIntegerField;
    itensservico: TIntegerField;
    itensatendente: TIntegerField;
    itensvalor: TFloatField;
    LOGIN: TLayout;
    fundo: TRectangle;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect3: TRoundRect;
    Label6: TLabel;
    ds_itens: TUniDataSource;
    ds_pedidos: TUniDataSource;
    usuarios: TUniQuery;
    emitente: TUniQuery;
    ds_emitente: TUniDataSource;
    Layout1: TLayout;
    Layout2: TLayout;
    teclado: TTMSFMXPassLock;
    Image1: TImage;
    bconecta: TSwitch;
    tempo: TTimer;
    overlay: TRectangle;
    Layout3: TLayout;
    AniIndicator1: TAniIndicator;
    StyleBook1: TStyleBook;
    itensqtde: TIntegerField;
    itenstotal: TFloatField;
    Label3: TLabel;
    sql_hostporta: TIntegerField;
    tporta: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    itensatualizacao: TDateTimeField;
    itensstatus: TStringField;
    emitenteid: TIntegerField;
    emitenterazao: TStringField;
    emitentefantasia: TStringField;
    emitenteend: TStringField;
    emitentenum: TStringField;
    emitentecompl: TStringField;
    emitentebairro: TStringField;
    emitentecidade: TStringField;
    emitenteuf: TStringField;
    emitentecep: TStringField;
    emitentecnpj: TStringField;
    emitenteinsc: TStringField;
    emitentetel: TStringField;
    emitentecel: TStringField;
    emitenteemail: TStringField;
    emitentecertificado: TBlobField;
    emitentepatch: TStringField;
    emitentelogo: TBlobField;
    emitentetipo: TStringField;
    emitenteatualizacao: TDateTimeField;
    usuariosid: TIntegerField;
    usuarioscod: TIntegerField;
    usuariosnome: TStringField;
    usuariosnivel: TStringField;
    usuariosatualizacao: TDateTimeField;
    usuariosstatus: TStringField;
    usuariossenha: TIntegerField;
    itenscod: TStringField;
    pedidosid: TIntegerField;
    pedidoscod: TStringField;
    pedidoscliente: TIntegerField;
    pedidosusuario: TIntegerField;
    pedidosdata: TDateField;
    pedidoshora: TTimeField;
    pedidossubtotal: TFloatField;
    pedidosdesconto: TFloatField;
    pedidostotal: TFloatField;
    pedidosdinheiro: TFloatField;
    pedidoscredito: TFloatField;
    pedidosdebito: TFloatField;
    pedidosboleto: TFloatField;
    pedidoscheque: TFloatField;
    pedidosvenc: TDateField;
    pedidosprazo: TStringField;
    pedidosassinatura: TBlobField;
    pedidosmotivo: TStringField;
    pedidosimp: TStringField;
    pedidostipo: TStringField;
    pedidossaida: TDateField;
    pedidoshoraSaida: TTimeField;
    pedidosdataEntrega: TDateTimeField;
    pedidosatualizacao: TDateTimeField;
    pedidosstatus: TStringField;
    con_host: TFDConnection;
    procedure Button1Click(Sender: TObject);
    procedure conAfterConnect(Sender: TObject);
    procedure conError(Sender: TObject; E: EDAError; var Fail: Boolean);
    procedure conAfterDisconnect(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormShow(Sender: TObject);
    procedure bt_emiteClick(Sender: TObject);
     procedure multiStartHiding(Sender: TObject);
    procedure multiStartShowing(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tecladoValueChanged(Sender: TObject; ItemIndex: Integer);
    procedure bconectaSwitch(Sender: TObject);
    procedure tempoTimer(Sender: TObject);

  private
    { Private declarations }
    //Permissões
    var leitura,escrita,estado:string;
    procedure TRequestPermissionsResultProc(Sender:TObject;const APermissions:TArray<string>;const AGrantResult:TArray<TPermissionStatus>);

  public
    { Public declarations }
    var FTecladoShow:Boolean;
    procedure conecta();
    //procedure soma();//Soma a comanda
    procedure FormatarMoeda( Componente : TObject {;var Key: Char} );

    var
    dir:string;//diretorio da app
    usuario:string;
    id_usuario:Integer;
    nivel:string;
    id_cliente:Integer;
    cliente:string;
    total:Currency;
    cod:string;//codigo serviço
    tipo:Integer;// se for 0= adicionar / 1= editar abertas / 2= reabrir comanda
    senha:string;
    modo:string; // se o tipo dé OS ou VENDA DIRETA
    prazo:string;

  end;

var
  fcapa: Tfcapa;

implementation

{$R *.fmx}

uses Androidapi.Helpers,Androidapi.JNI.JavaTypes,Androidapi.JNI.OS,Androidapi.JNI.Telephony,
 form_cad_servicos,FMX.DialogService, form_cad_atendentes,form_emitente, form_menu, form_clientes, form_opcoes, form_servicos, form_termos,
  form_fecha;

procedure Tfcapa.bconectaSwitch(Sender: TObject);
begin
  if bconecta.IsChecked=True then
  begin
    overlay.Visible:=True;
    tempo.Enabled:=True;
  end
  else
  begin

     if con.Connected=True then
     begin
       con.Connected:=False;
     end;
  end;
end;

procedure Tfcapa.bt_emiteClick(Sender: TObject);
begin
if femitente=nil then
femitente:=Tfemitente.Create(Self);
femitente.Show;
end;

procedure Tfcapa.Button1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tfcapa.Button2Click(Sender: TObject);
begin
    if con.Connected=False then
    begin

        if (txt_ip.Text <> '') and (txt_banco.Text <> '') and (txt_login.Text <> '') then
        begin
          sql_hostip.Value:=txt_ip.Text;
          sql_hostbanco.Value:=txt_banco.Text;
          sql_hostlogin.Value:=txt_login.Text;
          sql_hostsenha.Value:=txt_senha.Text;
          sql_hostporta.Value:=StrToInt(tporta.text);
          sql_host.Post;
          multi.HideMaster;
          TDialogService.ShowMessage('CONFIGURAÇÕES SALVAS COM SUCESSO !');
        end
        else
        begin
          TDialogService.ShowMessage('COLOQUE O IP, BANCO DE DADOS E LOGIN DE ACESSO POR FAVOR !');
        end;


    end
    else
    begin
      TDialogService.ShowMessage('DESCONECTE A APLICAÇÃO ANTES DE ALTERAR OS DADOS DE CONEXÃO POR FAVOR !');
    end;
end;

procedure Tfcapa.Button7Click(Sender: TObject);
begin
multi.HideMaster;
end;

procedure Tfcapa.conAfterConnect(Sender: TObject);
begin
    LOGIN.Enabled:=True;
    overlay.Visible:=False;
    emitente.Open;
end;

procedure Tfcapa.conAfterDisconnect(Sender: TObject);
begin
    LOGIN.Enabled:=False;
end;

procedure Tfcapa.conecta;
begin
    LOGIN.Enabled:=False;
    con.Server:=txt_ip.Text;
    con.Database:=txt_banco.Text;
    con.Username:=txt_login.Text;
    con.Password:=txt_senha.Text;
    con.Connect;

end;

procedure Tfcapa.conError(Sender: TObject; E: EDAError; var Fail: Boolean);
begin
ShowMessage('ERRO:'+E.Message);
LOGIN.Enabled:=False;
overlay.Visible:=False;
bconecta.IsChecked:=False;
con.Close;
end;

procedure Tfcapa.FormCreate(Sender: TObject);
begin
senha:='';
nivel:='';
usuario:='';
end;

procedure Tfcapa.FormShow(Sender: TObject);
begin



   leitura:=JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
   escrita:=JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
   estado:=JStringToString(TJManifest_permission.JavaClass.READ_PHONE_STATE);

   PermissionsService.RequestPermissions([leitura,escrita,estado],TRequestPermissionsResultProc,nil);



end;

procedure Tfcapa.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
 FTecladoShow := false;

     if not KeyboardVisible then
        AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure Tfcapa.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
   var
     O: TFMXObject;
begin
 FTecladoShow := true;

     if Assigned(Focused) and (Focused.GetObject is TControl) then
        if TControl(Focused).AbsoluteRect.Bottom - Padding.Top >= (Bounds.Top - (topo.Height +20)) then
        begin

             for O in Children do
                 if (O is TFloatAnimation) and (TFloatAnimation(O).PropertyName = 'Padding.Top') then
                    TFloatAnimation(O).StopAtCurrent;

             AnimateFloat('Padding.Top',Bounds.Top - (topo.Height +20) - TControl(Focused).AbsoluteRect.Bottom + Padding.Top, 0.1)
        end
        else
     else
        AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure Tfcapa.multiStartHiding(Sender: TObject);
begin
if sql_host.State in [dsEdit] then
begin
  sql_host.Cancel;
end;
end;

procedure Tfcapa.multiStartShowing(Sender: TObject);
begin

  sql_host.Edit;

end;

procedure Tfcapa.tecladoValueChanged(Sender: TObject; ItemIndex: Integer);
begin

if teclado.PassEntry.Length = 6 then
begin
  with usuarios do
  begin
    Close;
    ParamByName('senha').Value:=StrtoInt(teclado.PassEntry);
    Open;
    if RecordCount>0 then
    begin
      nivel:=FieldByName('nivel').Value;
      usuario:=FieldByName('nome').Value;
      id_usuario:=FieldByName('id').Value;
      if fmenu=nil then
      fmenu:=Tfmenu.Create(Self);
      fmenu.Show;
    end
    else
    begin
      TDialogService.ShowMessage('SENHA INCORRETA !');
      teclado.PassEntry:='';

    end;
  end;
end;
end;

procedure Tfcapa.tempoTimer(Sender: TObject);
begin
  tempo.Enabled:=False;
  conecta;
end;

procedure Tfcapa.TRequestPermissionsResultProc(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResult: TArray<TPermissionStatus>);
begin

            if Length(AGrantResult) > 0 then
            begin

                     //conecta com banco sqlite para pegar os dados de conexão do mysql
                    con_host.Params.Database:=TPath.Combine(TPath.GetDocumentsPath,'db.db');
                    con_host.Connected:=True;
                    sql_host.Open();

            end
            else
            begin
              Application.Terminate;
            end;



end;

procedure Tfcapa.FormatarMoeda( Componente : TObject {;var Key: Char} );
var
   valor_str  : String;
   valor  : double;
begin

        if Componente is TEdit then
        begin
                // Se tecla pressionada é um numero, backspace ou delete...
                //if ( Key in ['0'..'9', #8, #9] ) then
                //begin
                         // Salva valor do edit...
                         valor_str := TEdit( Componente ).Text;

                         // Valida vazio...
                         if valor_str = EmptyStr then
                                valor_str := '0,00';

                         // Se valor numerico, insere na string...
                         {if Key in ['0'..'9'] then
                                valor_str := Concat( valor_str, Key ) ;}

                         // Retira pontos e virgulas...
                         valor_str := Trim( StringReplace( valor_str, '.', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
                         valor_str := Trim( StringReplace( valor_str, ',', '', [rfReplaceAll, rfIgnoreCase] ) ) ;

                         // Inserindo 2 casas decimais...
                         valor := StrToFloat( valor_str ) ;
                         valor := ( valor / 100 ) ;

                         // Retornando valor tratado ao edit...
                         TEdit( Componente ).Text := FormatFloat( '###,##0.00', valor ) ;

                         // Reposiciona cursor...
                         TEdit( Componente ).SelStart := Length( TEdit( Componente ).Text );
                //end;

                // Se nao é key importante, reseta...
                {if Not( Key in [#8, #9] ) then
                        key := #0;}
        end;

end;


end.
