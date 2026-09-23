unit form_fecha;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Edit,FMX.Ani,
  Data.DB, MemDS, DBAccess, Uni;

type
  Tffecha = class(TForm)
    topo: TToolBar;
    txt: TLabel;
    Button1: TButton;
    DESCRICOES: TLayout;
    pcod: TCalloutRectangle;
    tcod: TLabel;
    FORMS: TLayout;
    tcliente: TLabel;
    dinheiro: TLayout;
    ttipo: TLabel;
    Label1: TLabel;
    Layout1: TLayout;
    t: TLabel;
    Layout2: TLayout;
    Label3: TLabel;
    Layout3: TLayout;
    Label4: TLabel;
    Layout4: TLayout;
    Label5: TLabel;
    tdinheiro: TEdit;
    tcredito: TEdit;
    tdebito: TEdit;
    tboleto: TEdit;
    tcheque: TEdit;
    Layout6: TLayout;
    Label6: TLabel;
    tdesconto: TEdit;
    VertScrollBox1: TVertScrollBox;
    GERAL: TLayout;
    Layout5: TLayout;
    csubotal: TCalloutRectangle;
    ctroco: TCalloutRectangle;
    Label2: TLabel;
    ctotal: TCalloutRectangle;
    txt_total: TLabel;
    Label7: TLabel;
    tsub: TLabel;
    ttotal: TLabel;
    ttroco: TLabel;
    BOTOES: TLayout;
    btcancel: TRoundRect;
    botaoC: TColorAnimation;
    Label8: TLabel;
    bsalva: TRoundRect;
    botao: TColorAnimation;
    Label9: TLabel;
    pedido: TUniQuery;
    pedidoid: TIntegerField;
    pedidocod: TStringField;
    pedidocliente: TIntegerField;
    pedidousuario: TIntegerField;
    pedidodata: TDateField;
    pedidohora: TTimeField;
    pedidosubtotal: TFloatField;
    pedidodesconto: TFloatField;
    pedidototal: TFloatField;
    pedidodinheiro: TFloatField;
    pedidocredito: TFloatField;
    pedidodebito: TFloatField;
    pedidoboleto: TFloatField;
    pedidocheque: TFloatField;
    pedidovenc: TDateField;
    pedidoprazo: TStringField;
    pedidoassinatura: TBlobField;
    pedidomotivo: TStringField;
    pedidoimp: TStringField;
    pedidotipo: TStringField;
    pedidosaida: TDateField;
    pedidohoraSaida: TTimeField;
    pedidodataEntrega: TDateTimeField;
    pedidoatualizacao: TDateTimeField;
    pedidostatus: TStringField;
    pedidoid_1: TIntegerField;
    pedidocod_1: TIntegerField;
    pedidorazao: TStringField;
    pedidofantasia: TStringField;
    pedidoend: TStringField;
    pedidocidade: TStringField;
    pedidouf: TStringField;
    pedidoemail: TStringField;
    pedidotel: TStringField;
    pedidocel: TStringField;
    pedidocep: TStringField;
    pedidotipo_1: TStringField;
    pedidocnpj: TStringField;
    pedidoie: TStringField;
    pedidodatacad: TDateField;
    pedidoatualizacao_1: TDateTimeField;
    pedidostatus_1: TStringField;
    ScaledLayout1: TScaledLayout;
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure tdinheiroChangeTracking(Sender: TObject);
    procedure tcreditoChangeTracking(Sender: TObject);
    procedure tdebitoChangeTracking(Sender: TObject);
    procedure tboletoChangeTracking(Sender: TObject);
    procedure tchequeChangeTracking(Sender: TObject);
    procedure tdescontoChangeTracking(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tdinheiroExit(Sender: TObject);
    procedure tcreditoExit(Sender: TObject);
    procedure tdebitoExit(Sender: TObject);
    procedure tboletoExit(Sender: TObject);
    procedure tchequeExit(Sender: TObject);
    procedure tdescontoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btcancelClick(Sender: TObject);
    procedure bsalvaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure soma;//soma os valore colocados dinheiro e etc..
    var FTecladoShow:Boolean;
    var
    total:Currency; //Soma as forma de pagto
  public
    { Public declarations }
  end;

var
  ffecha: Tffecha;

implementation

{$R *.fmx}

uses form_capa, form_menu, form_opcoes, form_servicos, form_termos, form_clientes, form_emitente;

procedure Tffecha.bsalvaClick(Sender: TObject);
var
hoje:TDate;
hora:TTime;
begin
   botao.Start;
   if total >= pedidototal.Value then
   begin

   hoje:=TDate(Now);
   hora:=TTime(Now);
   pedidodesconto.Value:=StrToCurr(tdesconto.Text);
   pedidodinheiro.Value:=StrToCurr(tdinheiro.Text);
   pedidocredito.Value:=StrToCurr(tcredito.Text);
   pedidodebito.Value:=StrToCurr(tdebito.Text);
   pedidocheque.Value:=StrToCurr(tcheque.Text);
   pedidoboleto.Value:=StrToCurr(tboleto.Text);
   pedidosubtotal.Value:=pedidototal.Value;
   pedidototal.Value:=pedidosubtotal.Value -  pedidodesconto.Value;
   pedidosaida.Value:=hoje;
   pedidohoraSaida.Value:=hora;
   pedidoatualizacao.AsDateTime:=TDateTime(Now);
   pedidousuario.Value:=fcapa.id_usuario;
   pedidoimp.Value:='N';
   if fcapa.modo='ORDEM DE SERVIÇO' then
   begin
    pedidotipo.Value:='OS';
   end
   else
   begin
    pedidotipo.Value:='VENDA';
   end;
   pedidostatus.Value:='FINALIZADA';
   pedido.Post;
   ShowMessage(fcapa.modo + ' FINALIZADA COM SUCESSO !');
   fopcoes.abertas.Close;
   fopcoes.abertas.Open;
   fopcoes.tab.TabIndex:=0;
   Close;
   end
   else
   begin
   ShowMessage('VALORES TOTAIS DE PAGTO.NÃO COINCIDEM COM O VALOR TOTAL !');
   end;
end;

procedure Tffecha.btcancelClick(Sender: TObject);
begin
botaoC.Start;
Close;
end;

procedure Tffecha.Button1Click(Sender: TObject);
begin
Close;
end;

procedure Tffecha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ffecha:=nil;
pedido.Close;
end;

procedure Tffecha.FormCreate(Sender: TObject);
begin
  with pedido do
  begin


    Close;
    ParamByName('cod').Value:=fcapa.cod;
    Open;
    Edit;
    tcod.Text:=fcapa.modo+':'+fcapa.cod;
    tcliente.Text:='Cliente: '+ pedidofantasia.Value;
    ttipo.Text:='Tipo: '+pedidotipo.Value;

    tsub.Text:=FormatFloat('#,0.00',pedidosubtotal.Value);
    ttotal.Text:=FormatFloat('#,0.00',pedidototal.Value);
    tdinheiro.Text:=FormatFloat('#,0.00',pedidodinheiro.Value);
    tcredito.Text:=FormatFloat('#,0.00',0);
    tdebito.Text:=FormatFloat('#,0.00',0);
    tcheque.Text:=FormatFloat('#,0.00',0);
    tboleto.Text:=FormatFloat('#,0.00',0);
    tdesconto.Text:=FormatFloat('#,0.00',0);
    soma;

  end;
end;

procedure Tffecha.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
 FTecladoShow := false;

     if not KeyboardVisible then
        AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure Tffecha.FormVirtualKeyboardShown(Sender: TObject;
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

procedure Tffecha.soma;
var
din,cre,deb,che,bol,desc:Currency;
begin

  if (tdinheiro.Text <> '')  and (tcredito.Text <> '') and (tdebito.Text <> '') and (tcheque.Text <> '') and  (tboleto.Text <> '')    then
  begin

    //Dinheiro
    if tdinheiro.Text.Length > 6 then
    begin
      din:=StrToCurr(StringReplace(tdinheiro.Text,'.','',[rfReplaceAll, rfIgnoreCase])) ;
    end
    else
    begin
      din:=StrToCurr(tdinheiro.Text);
    end;

    //Crédito
     if tcredito.Text.Length > 6 then
    begin
      cre:=StrToCurr(StringReplace(tcredito.Text,'.','',[rfReplaceAll, rfIgnoreCase])) ;
    end
    else
    begin
      cre:=StrToCurr(tcredito.Text);
    end;

    //Débito
     if tdebito.Text.Length > 6 then
    begin
      deb:=StrToCurr(StringReplace(tdebito.Text,'.','',[rfReplaceAll, rfIgnoreCase])) ;
    end
    else
    begin
      deb:=StrToCurr(tdebito.Text);
    end;

    //Cheque
     if tcheque.Text.Length > 6 then
    begin
      che:=StrToCurr(StringReplace(tcheque.Text,'.','',[rfReplaceAll, rfIgnoreCase])) ;
    end
    else
    begin
      che:=StrToCurr(tcheque.Text);
    end;

    //Boleto
     if tboleto.Text.Length > 6 then
    begin
      bol:=StrToCurr(StringReplace(tboleto.Text,'.','',[rfReplaceAll, rfIgnoreCase])) ;
    end
    else
    begin
      bol:=StrToCurr(tboleto.Text);
    end;

    //Desconto
     if tdesconto.Text.Length > 6 then
    begin
      desc:=StrToCurr(StringReplace(tdesconto.Text,'.','',[rfReplaceAll, rfIgnoreCase])) ;
    end
    else
    begin
      desc:=StrToCurr(tdesconto.Text);
    end;


    total:= (din+cre+deb+che+bol)-desc;

    if total > (pedidototal.Value) then
    begin
      ttroco.Text:=CurrToStrF(total - (pedidototal.Value),ffCurrency,2 );
    end
    else if total < (pedidototal.Value) then
    begin
      ttroco.Text:='Restam ' + CurrToStrF((pedidototal.Value) - total,ffCurrency,2 );
    end
    else
    begin
     ttroco.Text:=CurrToStrF(0,ffCurrency,2 );
    end;

  end;

  pedidototal.Value:=(pedidosubtotal.Value) - desc;
  ttotal.Text:=CurrToStrF(pedidototal.Value,ffCurrency,2);


end;

procedure Tffecha.tboletoChangeTracking(Sender: TObject);
begin
fcapa.FormatarMoeda(tboleto);
end;

procedure Tffecha.tboletoExit(Sender: TObject);
begin
soma;
end;

procedure Tffecha.tchequeChangeTracking(Sender: TObject);
begin
fcapa.FormatarMoeda(tcheque);
end;

procedure Tffecha.tchequeExit(Sender: TObject);
begin

soma;
end;

procedure Tffecha.tcreditoChangeTracking(Sender: TObject);
begin
fcapa.FormatarMoeda(tcredito);
end;

procedure Tffecha.tcreditoExit(Sender: TObject);
begin
soma;
end;

procedure Tffecha.tdebitoChangeTracking(Sender: TObject);
begin
fcapa.FormatarMoeda(tdebito);
end;

procedure Tffecha.tdebitoExit(Sender: TObject);
begin

soma;
end;

procedure Tffecha.tdescontoChangeTracking(Sender: TObject);
begin
fcapa.FormatarMoeda(tdesconto);
end;

procedure Tffecha.tdescontoExit(Sender: TObject);
begin
soma;
end;

procedure Tffecha.tdinheiroChangeTracking(Sender: TObject);
begin
fcapa.FormatarMoeda(tdinheiro);
end;

procedure Tffecha.tdinheiroExit(Sender: TObject);
begin
soma;
end;

end.
