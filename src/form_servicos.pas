unit form_servicos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Data.DB, DBAccess, Uni, MemDS, FMX.ListBox, StrUtils, FMX.Edit,
  FMX.Filter.Effects,FMX.Ani, FMX.MultiView, FMX.SearchBox, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.EditBox,
  FMX.SpinBox, FMX.TMSBaseControl, FMX.TMSGraphicCheckLabel;

type
  Tfservicos = class(TForm)
    Layout1: TLayout;
    lista: TListView;
    check: TImage;
    uncheck: TImage;
    sql_itens: TUniQuery;
    ds_itens: TUniDataSource;
    sql_servicos: TUniQuery;
    ds_servicos: TUniDataSource;
    sql_atendentes: TUniQuery;
    ds_atendentes: TUniDataSource;
    VertScrollBox1: TVertScrollBox;
    pop: TRectangle;
    Layout2: TLayout;
    Label2: TLabel;
    Rectangle4: TRectangle;
    cb_atendente: TComboBox;
    sql_atendentes2: TUniQuery;
    ds_atendentes2: TUniDataSource;
    BOTOES: TLayout;
    deleta: TUniQuery;
    topo: TToolBar;
    Button1: TButton;
    log: TButton;
    GERAL: TLayout;
    pcliente: TCalloutRectangle;
    CalloutRectangle2: TCalloutRectangle;
    tcliente: TLabel;
    tstatus: TLabel;
    bsalva: TRoundRect;
    ptotal: TCalloutRectangle;
    txt_total: TLabel;
    Label6: TLabel;
    botao: TColorAnimation;
    overlay: TRectangle;
    badd: TRoundRect;
    efadd: TColorAnimation;
    Label3: TLabel;
    bcancela: TRoundRect;
    efcancela: TColorAnimation;
    Label4: TLabel;
    fundo: TImage;
    bcliente: TImage;
    multi: TMultiView;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    sql_clientes: TUniQuery;
    ds_clientes: TUniDataSource;
    Layout4: TLayout;
    Label5: TLabel;
    tqtde: TSpinBox;
    clientes: TListBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    StyleBook1: TStyleBook;
    ShadowEffect1: TShadowEffect;
    sql_atendentes2id: TIntegerField;
    sql_atendentes2nome: TStringField;
    sql_atendentes2comissao: TIntegerField;
    sql_atendentes2atualizacao: TDateTimeField;
    sql_atendentes2status: TStringField;
    sql_servicosid: TIntegerField;
    sql_servicosnome: TStringField;
    sql_servicosvalor: TFloatField;
    sql_itensid: TIntegerField;
    sql_itensatendente: TIntegerField;
    sql_itensservico: TIntegerField;
    sql_itensvalor: TFloatField;
    sql_itensqtde: TIntegerField;
    sql_itenstotal: TFloatField;
    sql_itensatualizacao: TDateTimeField;
    sql_itensstatus: TStringField;
    sql_clientesid: TIntegerField;
    sql_clientescod: TIntegerField;
    sql_clientesrazao: TStringField;
    sql_clientesfantasia: TStringField;
    sql_clientesend: TStringField;
    sql_clientescidade: TStringField;
    sql_clientesuf: TStringField;
    sql_clientesemail: TStringField;
    sql_clientestel: TStringField;
    sql_clientescel: TStringField;
    sql_clientescep: TStringField;
    sql_clientestipo: TStringField;
    sql_clientescnpj: TStringField;
    sql_clientesie: TStringField;
    sql_clientesdatacad: TDateField;
    sql_clientesatualizacao: TDateTimeField;
    sql_clientesstatus: TStringField;
    sql_atendentesid: TIntegerField;
    sql_atendentesnome: TStringField;
    sql_atendentescomissao: TIntegerField;
    sql_atendentesatualizacao: TDateTimeField;
    sql_atendentesstatus: TStringField;
    sql_itenscod: TStringField;
    edtBusca: TEdit;
    SearchEditButton1: TSearchEditButton;
    che: TCheckBox;
    tcod: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure listaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure bcancelaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure logClick(Sender: TObject);
    procedure bsalvaTap(Sender: TObject; const Point: TPointF);
    procedure clientesItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure bsalvaClick(Sender: TObject);
    procedure baddTap(Sender: TObject; const Point: TPointF);
    procedure bcancelaTap(Sender: TObject; const Point: TPointF);
    procedure multiHidden(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure multiShown(Sender: TObject);
    procedure bclienteClick(Sender: TObject);
  private
    { Private declarations }

    var preco:Currency; //pega o valo do seviço na lista
    procedure busca(texto:string);//Buscar Cliente

  public
    { Public declarations }
   var FTecladoShow:Boolean;
   var serv:Integer;

   procedure soma() ;
   procedure listar();//listar os itens

  end;

var
  fservicos: Tfservicos;

implementation

{$R *.fmx}

uses  form_clientes, form_opcoes, form_termos, form_capa, form_menu, form_fecha;

procedure Tfservicos.baddTap(Sender: TObject; const Point: TPointF);
begin
efadd.Start;
end;

procedure Tfservicos.bcancelaClick(Sender: TObject);
begin
overlay.Visible:=False;
pop.Visible:=False;
tqtde.Text:='1';
end;

procedure Tfservicos.bcancelaTap(Sender: TObject; const Point: TPointF);
begin
efcancela.Start;
end;

procedure Tfservicos.bclienteClick(Sender: TObject);
begin
clientes.Items.Clear;
end;

procedure Tfservicos.bsalvaClick(Sender: TObject);
begin
  if (fcapa.cliente <> '') and (fcapa.total > 0) then
  begin

    if ftermos=nil then
    ftermos:=Tftermos.Create(Self);
    ftermos.Show;


  end
  else
  begin
    ShowMessage('SELECIONE O CLIENTE E MARQUE PELO MENOS UM SERVIÇO !');
  end;
end;

procedure Tfservicos.bsalvaTap(Sender: TObject; const Point: TPointF);
begin
botao.Start;
end;

procedure Tfservicos.bt_cancelarClick(Sender: TObject);
begin
fservicos.Close;
end;

procedure Tfservicos.busca(texto: string);
begin
    with sql_clientes do
    begin
      Close;
      ParamByName('busca').Value:=texto+'%';
      Open;
      if RecordCount = 0 then
      begin
        ShowMessage('NENHUM REGISTRO ENCONTRADO ! CADASTRE UM CLIENTE PARA CONTINUAR A O.S/VENDA !');

      end;
    end;

    edtBusca.Text:='';
    edtBusca.SetFocus;

end;

procedure Tfservicos.Button1Click(Sender: TObject);
begin
if (fcapa.tipo=0) and (fcapa.total > 0) then
  begin
    with deleta do
    begin
      Close;
      sql.Clear;
      sql.Add('delete from itens where cod=:cod');
      ParamByName('cod').Value:=fcapa.cod;
      ExecSQL;
      Close;
      fcapa.cod:='';
    end;
  end;
Close;
end;

procedure Tfservicos.Button3Click(Sender: TObject);
var st:TStringList;
var id:Integer;
var nome:string;

begin


        if (cb_atendente.ItemIndex >=0) and (tqtde.Value > 0) and (tqtde.Text<>'') then
        begin

          //pegando o id da atendente
          st:=TStringList.Create;
          st.Delimiter:='-';
          st.DelimitedText:=cb_atendente.Items[cb_atendente.ItemIndex];

          id:=StrToInt(st[0]);
          nome:=st[1];

          //insere na tabela itens
          with fcapa.itens do
          begin
            Close;
            ParamByName('cod').Value:=fcapa.cod;
            Open;
            Insert;
            fcapa.itenscod.Value:=fcapa.cod;
            fcapa.itensservico.Value:=serv;
            fcapa.itensvalor.Value:=preco;
            fcapa.itensqtde.Value:=StrToInt(tqtde.Text);
            fcapa.itenstotal.Value:=StrToInt(tqtde.Text) * preco;
            fcapa.itensatendente.Value:=id;
            Post;
            Close;
            pop.Visible:=False;
            overlay.Visible:=False;
            sql_atendentes2.Close;
            listar;
            tqtde.Text:='1';
          end;

        end
        else
        begin
          ShowMessage('SELECIONE A ATENDENTE POR FAVOR !');
          tqtde.Text:='1';
        end;



end;

procedure Tfservicos.Button5Click(Sender: TObject);
var hora:TTime;
begin

  hora:=TTime(Now);

  if fcapa.total > 0 then
  begin



  end
  else
  begin
    ShowMessage('SELECIONE PELO MENOS UM SERVIÇO !');
  end;


end;

procedure Tfservicos.clientesItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
if sql_clientes.RecordCount > 0 then
begin
  fcapa.id_cliente:=StrToInt(Item.ItemData.Detail);
  fcapa.cliente:=Item.Text;
  tcliente.Text:=Item.Text;
  multi.HideMaster;

end
else
begin
  ShowMessage('NENHUM CLIENTE CADASTRADO !');
  multi.HideMaster;
end;
end;

procedure Tfservicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fservicos := nil;
  sql_atendentes.Close;
  sql_servicos.Close;
  sql_itens.Close;
  sql_atendentes2.Close;
  sql_clientes.Close;
  fcapa.cliente:='';
  fcapa.total:=0;
  fcapa.cod:='';
end;

procedure Tfservicos.FormCreate(Sender: TObject);
var data:TDate;
var hora:TTime;
begin

  data:=TDate(Now);
  hora:=TTime(Now);


  //verifica se é adição
  if fcapa.tipo=0 then
  begin
        fcapa.cod:=FormatDateTime('YYMMDD',Date)+ FormatDateTime('HHMMSS',Time)+IntToStr(fcapa.id_usuario);
        tcod.Text:='Cód.da OS: '+fcapa.cod;
        tstatus.Text:='Situação da OS: Nova';
        bcliente.Visible:=True;
        pcliente.Fill.Color:=$FFF74834;

       if fcapa.cliente<>'' then
       begin
         tcliente.Text:=fcapa.cliente;
       end
       else
       begin
         tcliente.Text:='Selecione um cliente...';
       end;

  end
  else if  fcapa.tipo=1 then
  begin
      // edita a comanda
      with fcapa.pedidos do
      begin
        Close;
        sql.Clear;
        sql.Add('select * from pedidos inner join clientes on pedidos.cliente=clientes.id where cod=:cod');
        ParamByName('cod').Value:=fcapa.cod;
        Open;
        pcliente.Fill.Color:=$FF613662;
        bcliente.Visible:=False;
        fcapa.cliente:=FieldByName('razao').Value;
        tcliente.Text:='Cliente: '+FieldByName('razao').Value;
        tcod.Text:='Cód.Ordem de Serviço: '+fcapa.cod;
        tstatus.Text:='ABERTA';

      end;
  end;

  listar;

end;

procedure Tfservicos.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
FTecladoShow := false;

     if not KeyboardVisible then
        AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure Tfservicos.FormVirtualKeyboardShown(Sender: TObject;
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

procedure Tfservicos.listaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
  var i:Integer;

begin

  serv:=AItem.Tag;
  preco:=StrToCurr(AItem.Objects.FindDrawable('preco').Data.AsString);


  if AItem.Data['atendente'].AsString = 'Serviço não selecionado' then
  begin
    overlay.Visible:=True;
    pop.Visible:=True;
    cb_atendente.Items.Clear;

   with sql_atendentes2 do
   begin
     Close;
     Open;
     First;

     if RecordCount > 0 then
     begin
         //lista no combbox
         for i := 0 to RecordCount -1 do
         begin
           cb_atendente.Items.Add(sql_atendentes2id.Value.ToString+'-'+sql_atendentes2nome.Value);
           Next;
         end;
          cb_atendente.ItemIndex:=0;
     end
     else
     begin
       ShowMessage('NÃO HÁ ATENDENTES CADASTRADOS !');
     end;

   end;
  end
  else
  begin

    //desmarca o serviço
    with deleta do
    begin
      Close;
      sql.Clear;
      sql.Add('delete from itens where servico=:serv and cod=:cod');
      ParamByName('serv').Value:=AItem.Tag;
      ParamByName('cod').Value:=fcapa.cod;
      ExecSQL;
      listar;
      Close;
    end;

  end;

end;

procedure Tfservicos.listar;
var
  item: TListViewItem;
  I: Integer;
begin

  // lista os serviços
  lista.Items.Clear;
  lista.BeginUpdate;

  with sql_servicos do
  begin
    Close;
    Open;

    if RecordCount > 0 then
    begin
      First;
      for I := 0 to RecordCount - 1 do
      begin

        item := lista.Items.Add;
        item.Data['fundo']:=fundo.Bitmap;
        item.Data['servico'] := FieldByName('nome').AsString;
        item.Data['preco'] := FieldByName('valor').AsString;
        item.Tag := FieldByName('id').AsInteger;

        // verifica se o serviço está na comanda
        // abre os itens
        with sql_itens do
        begin
          Close;
          ParamByName('cod').Value := fcapa.cod;
          ParamByName('serv').Value := item.Tag;
          Open;

          if RecordCount > 0 then
          begin
            First;
            // Procura a atendente
            with sql_atendentes do
            begin
              Close;
              ParamByName('id').Value := sql_itens.FieldByName('atendente').AsInteger;
              Open;
              if RecordCount > 0  then
              begin
               item.Data['atendente'] := 'Funcionário(a): '+FieldByName('nome').AsString ;
               item.Data['valor'] :=sql_itensqtde.AsString+' X '+'Unit.: '+CurrToStrF(sql_servicos.FieldByName('valor').Value,ffCurrency,2)+' = '+CurrToStrF(sql_servicos.FieldByName('valor').Value*sql_itensqtde.Value,ffCurrency,2);
               item.Data['preco'] := CurrToStr(sql_servicos.FieldByName('valor').Value);
               item.Data['imagem'] := check.Bitmap;
              end
              else
              begin
                 item.Data['atendente'] := 'Serviço não selecionado';
                  item.Data['valor'] := CurrToStrF(sql_servicos.FieldByName('valor').Value,ffCurrency,2);
                  item.Data['preco'] := CurrToStr(sql_servicos.FieldByName('valor').Value);
                  item.Data['imagem'] := uncheck.Bitmap;
              end;

            end;
          end
          else
          begin
                  item.Data['atendente'] := 'Serviço não selecionado';
                  item.Data['valor'] := CurrToStrF(sql_servicos.FieldByName('valor').Value,ffCurrency,2);
                  item.Data['preco'] := CurrToStr(sql_servicos.FieldByName('valor').Value);
                  item.Data['imagem'] := uncheck.Bitmap;
          end;
        end;

        Next;

      end;

    end;

  end;
  lista.EndUpdate;
  sql_atendentes.Close;
  soma;
end;

procedure Tfservicos.logClick(Sender: TObject);
begin
if (fcapa.tipo=0) and (fcapa.total > 0) then
  begin
    with deleta do
    begin
      Close;
      sql.Clear;
      sql.Add('delete from itens where cod=:cod');
      ParamByName('cod').Value:=fcapa.cod;
      ExecSQL;
      Close;
      fcapa.cod:='';
    end;
  end;
Close;
fopcoes.Close;
end;

procedure Tfservicos.multiHidden(Sender: TObject);
begin
if tcliente.Text='Selecione um cliente...' then
begin
  pcliente.Fill.Color:=$FFF74834;
end
else
begin
  pcliente.Fill.Color:=$FF613662;
end;
sql_clientes.Close;
edtBusca.Text:='';
end;

procedure Tfservicos.multiShown(Sender: TObject);
begin
edtBusca.Text:='';
edtBusca.SetFocus;
end;

procedure Tfservicos.SearchEditButton1Click(Sender: TObject);
begin
busca(edtBusca.Text);
end;

procedure Tfservicos.soma;
var I:Integer;
var valor:Currency;
begin

         valor:=0;
         fcapa.total:=0;

          with fcapa.itens do
          begin
            Close;
            ParamByName('cod').Value:=fcapa.cod;
            Open;
            if RecordCount >0 then
            begin
                  First;

                  for I := 0 to RecordCount - 1 do
                  begin
                  valor:=FieldByName('total').AsCurrency;
                  fcapa.total:=fcapa.total + (valor);
                  Next;
                  end;


                   txt_total.Text:='TOTAL DA OS: '+CurrToStrF(fcapa.total,ffCurrency,2);

            end
            else
            begin
              fcapa.total:=0;
              txt_total.Text:='TOTAL DA OS: '+CurrToStrF(fcapa.total,ffCurrency,2);
            end;
          end;



end;



end.
