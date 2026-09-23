unit form_opcoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Ani, FMX.Effects,
  FMX.TMSBaseControl, FMX.TMSBadge, Data.DB, MemDS, DBAccess, Uni,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,U_MsgD, FMX.ListView,
  FMX.Edit, FMX.DateTimeCtrls;

type
  Tfopcoes = class(TForm)
    topo: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    log: TButton;
    painel: TCalloutRectangle;
    MENU: TLayout;
    pusuario: TRectangle;
    tusuario: TLabel;
    Label2: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Image1: TImage;
    Label3: TLabel;
    Layout3: TLayout;
    Image2: TImage;
    Label4: TLabel;
    Layout4: TLayout;
    Layout5: TLayout;
    Image3: TImage;
    Label5: TLabel;
    Layout6: TLayout;
    Image4: TImage;
    Label6: TLabel;
    ShadowEffect1: TShadowEffect;
    BOTAO: TLayout;
    add: TCircle;
    tsinal: TLabel;
    ShadowEffect2: TShadowEffect;
    babertas: TTMSFMXBadge;
    StyleBook1: TStyleBook;
    abertas: TUniQuery;
    GERAL: TLayout;
    Vabertas: TVertScrollBox;
    tab: TTabControl;
    tabMenu: TTabItem;
    tabAbertas: TTabItem;
    tabFinalizadas: TTabItem;
    tabReceber: TTabItem;
    ActionList1: TActionList;
    irabertas: TChangeTabAction;
    irfinalizadas: TChangeTabAction;
    irreceber: TChangeTabAction;
    irmenu: TChangeTabAction;
    CalloutRectangle1: TCalloutRectangle;
    Label7: TLabel;
    backA: TButton;
    Layout7: TLayout;
    listaA: TListView;
    editar: TImage;
    del: TImage;
    fundo: TImage;
    icone: TImage;
    osabertas: TUniQuery;
    ds_osabertas: TUniDataSource;
    auxiliar: TUniQuery;
    fechar: TImage;
    ActionList2: TActionList;
    Ac_Ok: TAction;
    Ac_Cancel: TAction;
    deleta: TUniQuery;
    abertasid: TIntegerField;
    abertascliente: TIntegerField;
    abertasusuario: TIntegerField;
    abertasdata: TDateField;
    abertashora: TTimeField;
    abertassubtotal: TFloatField;
    abertasdesconto: TFloatField;
    abertastotal: TFloatField;
    abertasdinheiro: TFloatField;
    abertascredito: TFloatField;
    abertasdebito: TFloatField;
    abertasboleto: TFloatField;
    abertascheque: TFloatField;
    abertasvenc: TDateField;
    abertasprazo: TStringField;
    abertasassinatura: TBlobField;
    abertasmotivo: TStringField;
    abertasimp: TStringField;
    abertastipo: TStringField;
    abertassaida: TDateField;
    abertashoraSaida: TTimeField;
    abertasdataEntrega: TDateTimeField;
    abertasatualizacao: TDateTimeField;
    abertasstatus: TStringField;
    abertassoma: TLargeintField;
    osabertasid: TIntegerField;
    osabertascliente: TIntegerField;
    osabertasusuario: TIntegerField;
    osabertasdata: TDateField;
    osabertashora: TTimeField;
    osabertassubtotal: TFloatField;
    osabertasdesconto: TFloatField;
    osabertastotal: TFloatField;
    osabertasdinheiro: TFloatField;
    osabertascredito: TFloatField;
    osabertasdebito: TFloatField;
    osabertasboleto: TFloatField;
    osabertascheque: TFloatField;
    osabertasvenc: TDateField;
    osabertasprazo: TStringField;
    osabertasassinatura: TBlobField;
    osabertasmotivo: TStringField;
    osabertasimp: TStringField;
    osabertastipo: TStringField;
    osabertassaida: TDateField;
    osabertashoraSaida: TTimeField;
    osabertasdataEntrega: TDateTimeField;
    osabertasatualizacao: TDateTimeField;
    osabertasstatus: TStringField;
    osabertasid_1: TIntegerField;
    osabertascod_1: TIntegerField;
    osabertasrazao: TStringField;
    osabertasfantasia: TStringField;
    osabertasend: TStringField;
    osabertascidade: TStringField;
    osabertasuf: TStringField;
    osabertasemail: TStringField;
    osabertastel: TStringField;
    osabertascel: TStringField;
    osabertascep: TStringField;
    osabertastipo_1: TStringField;
    osabertascnpj: TStringField;
    osabertasie: TStringField;
    osabertasdatacad: TDateField;
    osabertasatualizacao_1: TDateTimeField;
    osabertasstatus_1: TStringField;
    osabertascod: TStringField;
    abertascod: TStringField;
    edtBuscaA: TEdit;
    SearchEditButton1: TSearchEditButton;
    osfechadas: TUniQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    DateField1: TDateField;
    TimeField1: TTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    DateField2: TDateField;
    StringField1: TStringField;
    BlobField1: TBlobField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateField3: TDateField;
    TimeField2: TTimeField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField5: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    DateField4: TDateField;
    DateTimeField3: TDateTimeField;
    StringField18: TStringField;
    StringField19: TStringField;
    ds_osfechadas: TUniDataSource;
    vendas: TUniQuery;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    DateField5: TDateField;
    TimeField3: TTimeField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    DateField6: TDateField;
    StringField20: TStringField;
    BlobField2: TBlobField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    DateField7: TDateField;
    TimeField4: TTimeField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    StringField24: TStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    DateField8: TDateField;
    DateTimeField6: TDateTimeField;
    StringField37: TStringField;
    StringField38: TStringField;
    ds_vendas: TUniDataSource;
    CalloutRectangle2: TCalloutRectangle;
    Label8: TLabel;
    Button2: TButton;
    CalloutRectangle3: TCalloutRectangle;
    Label9: TLabel;
    Button3: TButton;
    Layout8: TLayout;
    listaF: TListView;
    edtBuscaF: TEdit;
    SearchEditButton2: TSearchEditButton;
    Layout9: TLayout;
    listaV: TListView;
    edtBuscaV: TEdit;
    SearchEditButton3: TSearchEditButton;
    tpF: TLayout;
    data1: TDateEdit;
    data2: TDateEdit;
    Label10: TLabel;
    Label11: TLabel;
    Layout10: TLayout;
    data3: TDateEdit;
    data4: TDateEdit;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure logClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure abertasAfterOpen(DataSet: TDataSet);
    procedure backAClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure listaAItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Ac_CancelExecute(Sender: TObject);
    procedure Ac_OkExecute(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure tabChange(Sender: TObject);
    procedure SearchEditButton2Click(Sender: TObject);
    procedure SearchEditButton3Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure listaVItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    { Private declarations }
    procedure buscaA(texto:string);//Busca os pedidos aberto por nomedo cliente
    procedure buscaF(texto:string);//Busca os pedidos aberto por nomedo cliente
    procedure buscaV(texto:string);//Busca os pedidos aberto por nomedo cliente
    var
    cod_os:string;//cod da OS para edição, fechamento e exclusão


  public
    { Public declarations }

    procedure listagemA; //lista as os abertas
    procedure listagemF; //lista as os abertas
    procedure listagemV; //lista as os abertas

  end;

var
  fopcoes: Tfopcoes;
  alerta:TMsgD;

implementation

uses
  form_capa, form_menu, form_servicos, form_termos,FMX.DialogService, form_clientes,
  form_fecha, form_cad_atendentes, form_cad_servicos, form_emitente;

{$R *.fmx}

procedure Tfopcoes.abertasAfterOpen(DataSet: TDataSet);
begin
babertas.Text:=IntToStr(abertas.FieldByName('soma').Value);
end;

procedure Tfopcoes.Ac_CancelExecute(Sender: TObject);
begin
  alerta.CloseMsgD;
 end;

procedure Tfopcoes.Ac_OkExecute(Sender: TObject);
begin

  //exclui os itens da OS
  with auxiliar do
  begin
    Close;
    Sql.Clear;
    Sql.Add('delete from itens where cod=:cod');
    ParamByName('cod').Value:=fcapa.cod;
    ExecSQL;
  end;

  //exclui  OS
  with deleta do
  begin
    Close;
    Sql.Clear;
    Sql.Add('delete from pedidos where cod=:cod');
    ParamByName('cod').Value:=fcapa.cod;
    ExecSQL;
  end;

 

  if tab.TabIndex=0 then
  begin
    buscaA('');
  end
  else if tab.TabIndex=1 then
  begin
    buscaF('');
  end
  else if tab.TabIndex=1 then
  begin
    buscaV('');
  end;

  TDialogService.ShowMessage('REGISTRO EXCLUÍDO COM SUCESSO !');

end;

procedure Tfopcoes.addClick(Sender: TObject);
begin
fcapa.tipo:=0;
if fservicos=nil then
fservicos:=Tfservicos.Create(Self);
fservicos.Show;
end;

procedure Tfopcoes.backAClick(Sender: TObject);
begin
irmenu.ExecuteTarget(Self);
end;

procedure Tfopcoes.buscaA(texto: string);
begin
   with osabertas do
   begin
     Close;
     ParamByName('busca').Value:=edtBuscaA.Text+'%';
     Open;
     if RecordCount=0 then
     begin
       listaA.Items.Clear;
       ShowMessage('NENHUM REGISTRO ENCONTRADO !');
     end
     else
     begin
       listagemA;
     end;
   end;
end;

procedure Tfopcoes.buscaF(texto: string);
begin
with osfechadas do
   begin
     Close;
     ParamByName('busca').Value:=edtBuscaF.Text+'%';
     ParamByName('data1').AsDate:=data1.Date;
     ParamByName('data2').AsDate:=data2.Date;
     Open;
     if RecordCount=0 then
     begin
       listaF.Items.Clear;
       ShowMessage('NENHUM REGISTRO ENCONTRADO !');
     end
     else
     begin
       listagemF;
     end;
   end;
end;

procedure Tfopcoes.buscaV(texto: string);
begin
with vendas do
   begin
     Close;
     ParamByName('busca').Value:=edtBuscaF.Text+'%';
     ParamByName('data1').AsDate:=data3.Date;
     ParamByName('data2').AsDate:=data4.Date;
     Open;
     if RecordCount=0 then
     begin
       listaV.Items.Clear;
       ShowMessage('NENHUM REGISTRO ENCONTRADO !');
     end
     else
     begin
       listagemV;
     end;
   end;
end;

procedure Tfopcoes.Button1Click(Sender: TObject);
begin
Close;
end;

procedure Tfopcoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
abertas.Close;
fopcoes:=nil;
end;

procedure Tfopcoes.FormCreate(Sender: TObject);
begin
tusuario.Text:='USUÁRIO: '+fcapa.usuario;
abertas.Open;

alerta:=TMsgD.Create;

end;

procedure Tfopcoes.FormShow(Sender: TObject);
begin
fopcoes.tab.TabIndex:=0;
abertas.Close;
abertas.Open;
end;

procedure Tfopcoes.Image1Click(Sender: TObject);
begin
fcapa.tipo:=0;
if fservicos=nil then
fservicos:=Tfservicos.Create(Self);
fservicos.Show;
end;

procedure Tfopcoes.Image2Click(Sender: TObject);
begin
irabertas.ExecuteTarget(Self);
buscaA('');
end;

procedure Tfopcoes.Image3Click(Sender: TObject);
begin
irfinalizadas.ExecuteTarget(Self);
end;

procedure Tfopcoes.Image4Click(Sender: TObject);
begin
irreceber.ExecuteTarget(Self);
end;

procedure Tfopcoes.listaAItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);

begin

    //Exclusão
    if LocalClickPos.X >= listaA.Width - 45 then
   begin

    fcapa.cod:= listaA.Items[ItemIndex].Objects.FindDrawable('os').Data.AsString;
    if fcapa.nivel='ADM' then
    begin
    MessageDlg('TEM CERTEZA QUE DESEJA EXCLUIR O SERVIÇO ?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes,System.UITypes.TMsgDlgBtn.mbNo], 0,procedure(const AResult: System.UITypes.TModalResult)
     begin
      case AResult of
       mrYES:
       begin

            //exclui os itens da OS
            with auxiliar do
            begin
              Close;
              Sql.Clear;
              Sql.Add('delete from itens where cod=:cod');
              ParamByName('cod').Value:=fcapa.cod;
              ExecSQL;
            end;

            //exclui  OS
            with deleta do
            begin
              Close;
              Sql.Clear;
              Sql.Add('delete from pedidos where cod=:cod');
              ParamByName('cod').Value:=fcapa.cod;
              ExecSQL;
            end;



            if tab.TabIndex=1 then
            begin
              buscaA('');
              abertas.Close;
              abertas.Open;
            end
            else if tab.TabIndex=2 then
            begin
              buscaF('');
            end
            else if tab.TabIndex=3 then
            begin
              buscaV('');
            end;

       end;
       mrNo:
       // caso não
      end;
     end);
    end
    else
    begin
      ShowMessage('VOCÊ NÃO POSSUI PERMISSÃO PARA EXECUTAR ESSA AÇÃO ! CONTACTE O ADMINISTRADOR DO SISTEMA !');
    end;
   end


   // Fechamento -> Peermite retaguarda imprimir
   else if  (LocalClickPos.X < listaA.Width - 60) then
   begin
      fcapa.cod:= listaA.Items[ItemIndex].Objects.FindDrawable('os').Data.AsString;
      //fcapa.modo:='ORDEM DE SERVIÇO' ;
      tab.TabIndex:=0;
      if ffecha=nil then
      ffecha :=Tffecha.Create(Self);
      ffecha.Show;
   end


   // Edição
   else if  (LocalClickPos.X < listaA.Width - 110) then
   begin
      fcapa.cod:= listaA.Items[ItemIndex].Objects.FindDrawable('os').Data.AsString;
      //fcapa.modo:='ORDEM DE SERVIÇO' ;
      tab.TabIndex:=0;
      fcapa.tipo:=1;
      if fservicos=nil then
      fservicos :=Tfservicos.Create(Self);
      fservicos.Show;
   end;
end;



procedure Tfopcoes.listagemA;
var
item:TListViewItem;
I:Integer;
begin

    //limpa a lista
    listaA.Items.Clear;
    listaA.BeginUpdate;

    //abre a query
    with osabertas do
    begin
       
       //lista os resultados se houver
       if RecordCount > 0 then
       begin
         First;

         //loop
         for I := 0 to RecordCount - 1 do
         begin

          item:=listaA.Items.Add;
          item.Tag:=FieldByName('id').AsInteger;
          item.data['fundo']:=fundo.Bitmap;
          item.data['icone']:=icone.Bitmap;
          item.Data['cod']:=FieldByName('data').AsString +' - '+ FieldByName('cod').AsString;
          item.Data['nome']:= FieldByName('razao').AsString;
          item.Data['os']:= FieldByName('cod').AsString;
          item.Data['prazo']:= 'Prazo: '+FieldByName('prazo').AsString+' dia(s)';
          item.Data['valor']:= FormatFloat('#0.00',FieldByName('total').AsCurrency);
          item.Data['id']:= IntToStr(FieldByName('id').Value);
          item.Data['del']:= del.Bitmap;
          item.Data['fechar']:= fechar.Bitmap;
          Next;
         end;



       end;

     listaA.EndUpdate;


    end;

end;

procedure Tfopcoes.listagemF;
var
item:TListViewItem;
I:Integer;
begin

    //limpa a lista
    listaF.Items.Clear;
    listaF.BeginUpdate;

    //abre a query
    with osfechadas do
    begin

       //lista os resultados se houver
       if RecordCount > 0 then
       begin
         First;

         //loop
         for I := 0 to RecordCount - 1 do
         begin

          item:=listaF.Items.Add;
          item.Tag:=FieldByName('id').AsInteger;
          item.data['fundo']:=fundo.Bitmap;
          item.data['icone']:=icone.Bitmap;
          item.Data['cod']:=FieldByName('data').AsString +' - '+ FieldByName('cod').AsString;
          item.Data['nome']:= FieldByName('razao').AsString;
          item.Data['os']:= FieldByName('cod').AsString;
          item.Data['prazo']:= 'Prazo: '+FieldByName('prazo').AsString+' dia(s)';
          item.Data['valor']:= FormatFloat('#0.00',FieldByName('total').AsCurrency);
          item.Data['id']:= IntToStr(FieldByName('id').Value);

          Next;
         end;

       end;

     listaF.EndUpdate;


    end;

end;

procedure Tfopcoes.listagemV;
var
item:TListViewItem;
I:Integer;
begin
       //limpa a lista
    listaV.Items.Clear;
    listaV.BeginUpdate;

    //abre a query
    with vendas do
    begin

       //lista os resultados se houver
       if RecordCount > 0 then
       begin
         First;

         //loop
         for I := 0 to RecordCount - 1 do
         begin

          item:=listaV.Items.Add;
          item.Tag:=FieldByName('id').AsInteger;
          item.data['fundo']:=fundo.Bitmap;
          item.data['icone']:=icone.Bitmap;
          item.Data['cod']:=FieldByName('data').AsString +' - '+ FieldByName('cod').AsString;
          item.Data['nome']:= FieldByName('razao').AsString;
          item.Data['os']:= FieldByName('cod').AsString;
          item.Data['prazo']:= 'Prazo: '+FieldByName('prazo').AsString+' dia(s)';
          item.Data['valor']:= FormatFloat('#0.00',FieldByName('total').AsCurrency);
          item.Data['id']:= IntToStr(FieldByName('id').Value);
          item.Data['del']:= del.Bitmap;
          Next;
         end;

       end;

     listaV.EndUpdate;


    end;
end;

procedure Tfopcoes.listaVItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
begin
if LocalClickPos.X >= listaA.Width - 45 then
   begin

    fcapa.cod:= listaV.Items[ItemIndex].Objects.FindDrawable('os').Data.AsString;
    if fcapa.nivel='ADM' then
    begin
    MessageDlg('TEM CERTEZA QUE DESEJA EXCLUIR O SERVIÇO ?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes,System.UITypes.TMsgDlgBtn.mbNo], 0,procedure(const AResult: System.UITypes.TModalResult)
     begin
      case AResult of
       mrYES:
       begin

          //exclui os itens da OS
            with auxiliar do
            begin
              Close;
              Sql.Clear;
              Sql.Add('delete from itens where cod=:cod');
              ParamByName('cod').Value:=fcapa.cod;
              ExecSQL;
            end;

            //exclui  OS
            with deleta do
            begin
              Close;
              Sql.Clear;
              Sql.Add('delete from pedidos where cod=:cod');
              ParamByName('cod').Value:=fcapa.cod;
              ExecSQL;
            end;



            if tab.TabIndex=1 then
            begin
              buscaA('');
              abertas.Close;
              abertas.Open;
            end
            else if tab.TabIndex=2 then
            begin
              buscaF('');
            end
            else if tab.TabIndex=3 then
            begin
              buscaV('');
            end;

       end;
       mrNo:
       // caso não
      end;
     end);

    end
    else
    begin
      ShowMessage('VOCÊ NÃO POSSUI PERMISSÃO PARA EXECUTAR ESSA AÇÃO ! CONTACTE O ADMINISTRADOR DO SISTEMA !');
    end;

   end;

end;

procedure Tfopcoes.logClick(Sender: TObject);
begin
Close;
fmenu.Close;
end;

procedure Tfopcoes.SearchEditButton1Click(Sender: TObject);
begin
buscaA(edtBuscaA.Text);
end;

procedure Tfopcoes.SearchEditButton2Click(Sender: TObject);
begin
buscaF(edtBuscaF.Text);
end;

procedure Tfopcoes.SearchEditButton3Click(Sender: TObject);
begin
buscaV(edtBuscaV.Text);
end;

procedure Tfopcoes.tabChange(Sender: TObject);
begin
if tab.TabIndex=1 then
begin
  buscaA('');
end
else if tab.TabIndex=2 then
begin
  data1.Date:=TDate(Now)-7;
  data2.Date:=TDate(Now);
  buscaF('');
end
else if tab.TabIndex=3 then
begin
  data3.Date:=TDate(Now)-7;
  data4.Date:=TDate(Now);
  buscaV('');
end;
end;

end.
