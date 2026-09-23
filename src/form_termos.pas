unit form_termos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox,
  FMX.TMSSignatureCapture, Data.DB, DBAccess, Uni, MemDS, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Ani, FMX.Effects, FMX.Edit, FMX.EditBox, FMX.SpinBox;

type
  Tftermos = class(TForm)
    topo: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    log: TButton;
    ctopo: TCalloutRectangle;
    tcod: TLabel;
    tcliente: TLabel;
    TERMOS: TLayout;
    ctitulo: TCalloutRectangle;
    Label2: TLabel;
    ttermos: TLayout;
    BOTOES: TLayout;
    clista: TLayout;
    ctermostexto: TCalloutRectangle;
    ttexto: TLabel;
    servicos: TUniQuery;
    ds_servicos: TUniDataSource;
    servicosid: TIntegerField;
    servicosservico: TIntegerField;
    servicosvalor: TFloatField;
    servicosatendente: TIntegerField;
    salva: TUniQuery;
    servicosqtde: TIntegerField;
    servicostotal: TFloatField;
    lista: TListView;
    ok: TImage;
    servicosid_1: TIntegerField;
    servicosnome: TStringField;
    servicosvalor_1: TFloatField;
    btcancel: TRoundRect;
    ColorAnimation1: TColorAnimation;
    Label3: TLabel;
    ccliente: TCalloutRectangle;
    ccod: TCalloutRectangle;
    bsalva: TRoundRect;
    botao: TColorAnimation;
    Label6: TLabel;
    fundo: TRectangle;
    cassinatura: TLayout;
    assinatura: TTMSFMXSignatureCapture;
    pass: TRectangle;
    bconfirma: TRoundRect;
    efcon: TColorAnimation;
    Label4: TLabel;
    ctotal: TCalloutRectangle;
    ttotal: TLabel;
    StyleBook1: TStyleBook;
    ttitulo: TLayout;
    caviso: TCalloutRectangle;
    caneta: TAniIndicator;
    Layout1: TLayout;
    Label5: TLabel;
    Label7: TLabel;
    ShadowEffect1: TShadowEffect;
    PRAZO: TLayout;
    Label8: TLabel;
    tdias: TSpinBox;
    TPRAZO: TLabel;
    servicosatualizacao: TDateTimeField;
    servicosstatus: TStringField;
    salvaid: TIntegerField;
    salvacliente: TIntegerField;
    salvausuario: TIntegerField;
    salvadata: TDateField;
    salvahora: TTimeField;
    salvasubtotal: TFloatField;
    salvadesconto: TFloatField;
    salvatotal: TFloatField;
    salvadinheiro: TFloatField;
    salvacredito: TFloatField;
    salvadebito: TFloatField;
    salvaboleto: TFloatField;
    salvacheque: TFloatField;
    salvavenc: TDateField;
    salvaprazo: TStringField;
    salvaassinatura: TBlobField;
    salvamotivo: TStringField;
    salvaimp: TStringField;
    salvatipo: TStringField;
    salvasaida: TDateField;
    salvahoraSaida: TTimeField;
    salvadataEntrega: TDateTimeField;
    salvaatualizacao: TDateTimeField;
    salvastatus: TStringField;
    servicoscod: TStringField;
    salvacod: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btcancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsalvaClick(Sender: TObject);
    procedure bconfirmaTap(Sender: TObject; const Point: TPointF);
    procedure fundoClick(Sender: TObject);
    procedure bconfirmaClick(Sender: TObject);
  private
    { Private declarations }

    procedure listagem;
    procedure termosOS; // descreve os termos de aceitação
    function OpenURL(const URL: string;const DisplayError: Boolean): Boolean;

  public
    { Public declarations }
    var tipo:string; // descrição se e OS ou  VENDA

  end;

var
  ftermos: Tftermos;

implementation

uses
  form_capa, form_menu, form_opcoes, form_servicos,FMX.DialogService, Androidapi.JNI.GraphicsContentViewText,
   Androidapi.JNI.App,
   Androidapi.JNIBridge,
   Androidapi.JNI.JavaTypes,
   Androidapi.Helpers,
   Androidapi.JNI.Net,
   Androidapi.JNI.Os,
   Androidapi.IOUtils, form_fecha;

{$R *.fmx}

{ Tftermos }

procedure Tftermos.bconfirmaClick(Sender: TObject);
var st:TMemoryStream;
var hoje:TDate;
begin

  hoje:=TDate(Now);
if assinatura.Empty then
  begin
    ShowMessage('ASSINE A ORDEM DE SERVIÇO PARA PROCEDER COM O PEDIDO POR FAVOR !');
  end
  else
  begin

    if fcapa.tipo=0 then
    begin

      st:=TMemoryStream.Create;
      st.Seek(0,0);

      try
      assinatura.SaveToImageStream(st);
      //insere a ordem de serviço
      salva.Close;
      salva.Open;
      salva.Insert;
      salvadata.AsDateTime:=TDate(Now);
      salvahora.AsDateTime:=TTime(Now);
      salvacod.Value:=fcapa.cod;
      salvacliente.Value:=fcapa.id_cliente;
      salvasubtotal.Value:=fcapa.total;
      salvatotal.Value:=fcapa.total;
      salvadesconto.Value:=0;
      salvaimp.Value:='N';

      salvadinheiro.Value:=fcapa.total;
      salvacredito.Value:=0;
      salvadebito.Value:=0;
      salvaboleto.Value:=0;
      salvacheque.Value:=0;
      salvaprazo.Value:=tdias.Text;
      salvavenc.AsDateTime:=hoje + tdias.Value;
      salvaatualizacao.AsDateTime:=TDateTime(Now);
      if fservicos.che.isChecked=False then
      begin
        salvastatus.Value:='ABERTA';
        salvatipo.Value:='OS';
        fcapa.modo:='ORDEM DE SERVIÇO';
      end
      else
      begin
        salvastatus.Value:='FINALIZADA';
        salvatipo.Value:='VENDA';
        fcapa.modo:='VENDA';
      end;
      salvausuario.Value:=fcapa.id_usuario;
      salvaassinatura.LoadFromStream(st);
      salva.Post;
      TDialogService.ShowMessage(fcapa.modo+'  SALVA COM SUCESSO !');
      fundo.Visible:=False;
      fopcoes.abertas.Close;
      fopcoes.abertas.Open;
      ftermos.close;
      fservicos.close;
      finally
        st.Free;
      end;
    end
    else if fcapa.tipo=1 then
    begin

      st:=TMemoryStream.Create;
      st.Seek(0,0);

      try
      assinatura.SaveToImageStream(st);
      //edita a ordem de serviço
      with salva do
      begin
        Close;
        SQL.Clear;
        sql.Add('select * from pedidos where cod=:cod');
        ParamByName('cod').Value:=fcapa.cod;
        Open;
        Edit;

      end;
      salvasubtotal.Value:=fcapa.total;
      salvatotal.Value:=fcapa.total;
      salvadesconto.Value:=0;
      salvaimp.Value:='N';
      salvastatus.Value:='ABERTA';
      salvadinheiro.Value:=fcapa.total;
      salvacredito.Value:=0;
      salvadebito.Value:=0;
      salvaboleto.Value:=0;
      salvacheque.Value:=0;
      salvaprazo.Value:=tdias.Text;
      salvavenc.AsDateTime:=hoje + tdias.Value;
      salvaatualizacao.AsDateTime:=TDateTime(Now);
       if fservicos.che.isChecked=False then
      begin
        salvatipo.Value:='OS';
        fcapa.modo:='ORDEM DE SERVIÇO';
      end
      else
      begin
        salvatipo.Value:='VENDA';
        fcapa.modo:='VENDA';
      end;
      salvausuario.Value:=fcapa.id_usuario;
      salvaassinatura.LoadFromStream(st);
      salva.Post;
      fundo.Visible:=False;
      fopcoes.abertas.Close;
      fopcoes.abertas.Open;
      fopcoes.listagemA;
      ftermos.close;
      fservicos.close;
      TDialogService.ShowMessage('ORDEM DE SERVIÇO SALVA COM SUCESSO !');
      finally
        st.Free;
      end;
    end;

  end;
end;

procedure Tftermos.bconfirmaTap(Sender: TObject; const Point: TPointF);
begin
efcon.Start;
end;

procedure Tftermos.bsalvaClick(Sender: TObject);
var hoje:TDate;
begin

hoje:=TDate(Now);

  if (fcapa.cliente<>'') then
  begin
    if fservicos.che.IsChecked=False then
    begin
      fundo.Visible:=True;
    end
    else
    begin

    if fcapa.tipo=0 then
    begin
      //insere a ordem de serviço
      salva.Close;
      salva.Open;
      salva.Insert;
      salvadata.AsDateTime:=TDate(Now);
      salvahora.AsDateTime:=TTime(Now);
      salvacod.Value:=fcapa.cod;
      salvacliente.Value:=fcapa.id_cliente;
      salvasubtotal.Value:=fcapa.total;
      salvatotal.Value:=fcapa.total;
      salvadesconto.Value:=0;
      salvaimp.Value:='A';

      salvadinheiro.Value:=fcapa.total;
      salvacredito.Value:=0;
      salvadebito.Value:=0;
      salvaboleto.Value:=0;
      salvacheque.Value:=0;
      salvaprazo.Value:=tdias.Text;
      salvavenc.AsDateTime:=hoje + tdias.Value;
      salvaatualizacao.AsDateTime:=TDateTime(Now);
      if fservicos.che.isChecked=False then
      begin
        salvastatus.Value:='ABERTA';
        salvatipo.Value:='OS';
        fcapa.modo:='ORDEM DE SERVIÇO';
      end
      else
      begin
        salvastatus.Value:='FINALIZADA';
        salvatipo.Value:='VENDA';
        fcapa.modo:='VENDA';
      end;
      salvausuario.Value:=fcapa.id_usuario;
      //salvaassinatura.LoadFromStream(st);
      salva.Post;
      TDialogService.ShowMessage(fcapa.modo+'  SALVA COM SUCESSO !');
      fundo.Visible:=False;
      fopcoes.abertas.Close;
      fopcoes.abertas.Open;
      ftermos.close;
      fservicos.close;

    end
    else if fcapa.tipo=1 then
    begin
      //edita a ordem de serviço
      with salva do
      begin
        Close;
        SQL.Clear;
        sql.Add('select * from pedidos where cod=:cod');
        ParamByName('cod').Value:=fcapa.cod;
        Open;
        Edit;

      end;
      salvasubtotal.Value:=fcapa.total;
      salvatotal.Value:=fcapa.total;
      salvadesconto.Value:=0;
      salvaimp.Value:='A';
      salvastatus.Value:='ABERTA';
      salvadinheiro.Value:=fcapa.total;
      salvacredito.Value:=0;
      salvadebito.Value:=0;
      salvaboleto.Value:=0;
      salvacheque.Value:=0;
      salvaprazo.Value:=tdias.Text;
      salvavenc.AsDateTime:=hoje + tdias.Value;
      salvaatualizacao.AsDateTime:=TDateTime(Now);
       if fservicos.che.isChecked=False then
      begin
        salvatipo.Value:='OS';
        fcapa.modo:='ORDEM DE SERVIÇO';
      end
      else
      begin
        salvatipo.Value:='VENDA';
        fcapa.modo:='VENDA';
      end;
      salvausuario.Value:=fcapa.id_usuario;
      salva.Post;
      fundo.Visible:=False;
      fopcoes.abertas.Close;
      fopcoes.abertas.Open;
      fopcoes.listagemA;
      ftermos.close;
      fservicos.close;
      TDialogService.ShowMessage('ORDEM DE SERVIÇO SALVA COM SUCESSO !');
     
    end;


    end;
  end;
end;

procedure Tftermos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
servicos.Close;
salva.Close;
ftermos:=nil;
end;

procedure Tftermos.FormCreate(Sender: TObject);
begin
tcod.Text:='Cód.OS: '+ fcapa.cod;
tcliente.Text:='CLIENTE: '+fcapa.cliente;
ttotal.Text:='TOTAL DA OS: '+CurrToStrF(fcapa.total,ffCurrency,2);
if fservicos.che.IsChecked=False then
begin
  TERMOS.Visible:=True;
  termosOS;
end
else
begin
  TERMOS.Visible:=False;
end;
listagem;
end;

procedure Tftermos.fundoClick(Sender: TObject);
begin
fundo.Visible:=False;
assinatura.Clear;

end;

procedure Tftermos.listagem;
var
item:TListViewItem;
I:Integer;
begin
       lista.Items.Clear;
       lista.BeginUpdate;

       with servicos do
       begin
         Close;
         ParamByName('cod').Value:=fcapa.cod;
         Open;

         if RecordCount > 0 then
         begin
            First;
            for I := 0 to RecordCount - 1 do
            begin
            item := lista.Items.Add;
            item.Data['icone']:=ok.Bitmap;
            item.Data['prod'] := FieldByName('qtde').AsString+' X '+FieldByName('nome').AsString;
            item.Data['valor'] :='Unit.: '+CurrToStrF(FieldByName('valor').Value,ffCurrency,2);
            item.Data['total'] :='Total: '+CurrToStrF(FieldByName('total').Value,ffCurrency,2);
            Next;
            end;
          end
          else
          begin
            Close;
            ShowMessage('NENHUM SERVIÇO ADICIONADO A ESSE CÓDIGO !');
          end;
       end;

       lista.EndUpdate;
end;

procedure Tftermos.btcancelClick(Sender: TObject);
begin
Close;
end;

procedure Tftermos.termosOS;
var desc:TStringList;
begin

    desc:=TStringList.Create;
    desc.Add('Eu '+fcapa.cliente+' autorizo por meio desta a empresa '+fcapa.emitentefantasia.Value);
    desc.Add(' situada no endereço '+fcapa.emitenteend.Value+', com CNPJ '+fcapa.emitentecnpj.Value );
    desc.Add(' a realizar os serviços descritos abaixo.');
    ttexto.Text:=desc.Text;

end;


//envia e-mail
function Tftermos.OpenURL(const URL: string;const DisplayError: Boolean): Boolean;

var Intent: JIntent;
begin
Intent:= TJIntent.JavaClass.init(TJIntent.Javaclass.ACTION_SENDTO);
Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(URL)));
Intent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString('Teste de envio'));
Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString('<p style="color:#556688">Body do e-mail</p> '+ 'This continues in the same line as the above'+sLineBreak+'Segunda linha'));
try
  SharedActivity.startActivity(Intent);
  exit(true);
except
on e: Exception do
begin
    if DisplayError then
    ShowMessage('Erro: ' + e.Message);
    exit(false);
end;
end;

end;

end.
