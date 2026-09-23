unit form_cad_servicos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox,
  FMX.Edit, FMX.SearchBox, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.DB, DBAccess,uGhiFuncoes, Uni, FMX.Ani,
  MemDS;

type
  Tfcad_servicos = class(TForm)
    cadastros: TUniQuery;
    ds_cadastros: TUniDataSource;
    excluir: TUniQuery;
    cadastrosid: TIntegerField;
    cadastrosnome: TStringField;
    cadastrosvalor: TFloatField;
    overlay: TRectangle;
    update: TUniQuery;
    updateid: TIntegerField;
    updatenome: TStringField;
    updatevalor: TFloatField;
    topo: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    bt_host: TButton;
    GERAL: TLayout;
    lista: TListView;
    editar: TImage;
    del: TImage;
    fundo: TImage;
    icone: TImage;
    pop: TRectangle;
    Layout1: TLayout;
    Label2: TLabel;
    Rectangle2: TRectangle;
    txt_nome: TEdit;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect3: TRoundRect;
    Label6: TLabel;
    Label3: TLabel;
    tvalor: TEdit;
    Layout3: TLayout;
    add: TCircle;
    tsinal: TLabel;
    ShadowEffect1: TShadowEffect;
    anima: TFloatAnimation;
    roda: TFloatAnimation;
    edtBusca: TEdit;
    SearchEditButton1: TSearchEditButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure listaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure bt_hostClick(Sender: TObject);
    procedure animaFinish(Sender: TObject);
    procedure tvalorChangeTracking(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure edtBuscaExit(Sender: TObject);
  private
    { Private declarations }
    procedure listar();
     procedure busca(texto:string);//Busca Clientes

    var FTecladoShow : Boolean;

  public
    { Public declarations }

  end;

var
  fcad_servicos: Tfcad_servicos;

implementation

{$R *.fmx}

uses form_capa, form_menu;

procedure Tfcad_servicos.animaFinish(Sender: TObject);
begin
if overlay.Visible=False then
begin
  pop.Visible:=False;
  tvalor.Text:='';
  txt_nome.Text:='';
  roda.Stop;
  tsinal.Text:='+';
  add.RotationAngle:=0;
end
else
begin

  roda.Start;
  tsinal.Text:='!';

end;
end;

procedure Tfcad_servicos.bt_hostClick(Sender: TObject);
begin
Close;
fmenu.Close;
end;

procedure Tfcad_servicos.busca(texto: string);
begin
    with cadastros do
        begin
          Close;
          sql.Clear;
          sql.Add('select * from servicos where nome like :busca order by nome asc');
          ParamByName('busca').value:=trim(texto)+'%';
          Open;

          if (RecordCount = 0) and (edtBusca.Text <> '') then
          begin
            ShowMessage('NENHUM REGISTRO ENCONTRADO !');
          end
          else
          begin
            listar;
          end;

          add.Visible:=True;
        end;

        edtBusca.Text:='';
        edtBusca.SetFocus;
end;

procedure Tfcad_servicos.Button1Click(Sender: TObject);
begin
  fcad_servicos.Close;

end;

procedure Tfcad_servicos.Button2Click(Sender: TObject);
begin
  cadastros.Insert;
  overlay.Visible:=True;
  anima.StartValue:=-pop.Height;
  anima.StopValue:=(Screen.Height / 2) - (pop.Height / 2)  ;
  pop.Visible:=True;
  anima.Start;
  txt_nome.Text:='';
  tvalor.Text:= '';
end;

procedure Tfcad_servicos.Button3Click(Sender: TObject);
begin
overlay.Visible:=False;
anima.StartValue:=pop.Position.Y;
anima.StopValue:=-pop.Height;
anima.Start;

    if cadastros.State in [dsInsert,dsEdit] then
    begin
      cadastros.Cancel;
    end;

end;

procedure Tfcad_servicos.Button4Click(Sender: TObject);
begin
  if txt_nome.Text <> '' then
  begin

        if cadastros.State in [dsInsert] then
        begin
          cadastrosnome.Value:=Uppercase(txt_nome.Text);
          cadastrosvalor.Value:=StrtoFloat(tvalor.Text);
          cadastros.Post;
          ShowMessage('CADASTRO REALIZADO COM SUCESSO !');
          overlay.Visible:=False;
          anima.StartValue:=pop.Position.Y;
          anima.StopValue:=-pop.Height;
          anima.Start;

        end
        else if update.State in [dsEdit] then
        begin
          updatenome.Value:=Uppercase(txt_nome.Text);
          updatevalor.Value:=StrtoFloat(tvalor.Text);;
          update.Post;
          update.Close;
           ShowMessage('CADASTRO EDITADO COM SUCESSO !');
          overlay.Visible:=False;
          anima.StartValue:=pop.Position.Y;
          anima.StopValue:=-pop.Height;
          anima.Start;
        end;
        listar;
  end
  else
  begin
    ShowMessage('COLOQUE O NOME DO SERVIÇO POR FAVOR !');
  end;
end;

procedure Tfcad_servicos.edtBuscaExit(Sender: TObject);
begin
busca(edtBusca.Text);
end;

procedure Tfcad_servicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   fcad_servicos:=nil;
   cadastros.Close;
   excluir.Close;
end;
procedure Tfcad_servicos.FormCreate(Sender: TObject);
begin
busca('');
end;

procedure Tfcad_servicos.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
FTecladoShow := false;

     if not KeyboardVisible then
        AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure Tfcad_servicos.FormVirtualKeyboardShown(Sender: TObject;
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

procedure Tfcad_servicos.listaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if  (LocalClickPos.X < lista.Width-45) then
  begin

  if fcapa.nivel='ADM' then
  begin
    overlay.Visible:=True;
     pop.Visible:=True;
     anima.StartValue:=-pop.Height;
     anima.StopValue:=(Screen.Height / 2) - (pop.Height / 2)  ;
     anima.Start;

    with update do
    begin
      Close;
      ParamByName('id').Value:=StrToInt(lista.Items[ItemIndex].Objects.FindDrawable('id').Data.AsString);
      Open;
      Edit;
    end;
    txt_nome.Text:=lista.Items[ItemIndex].Objects.FindDrawable('nome').Data.AsString;
    tvalor.Text:= lista.Items[ItemIndex].Objects.FindDrawable('valor').Data.AsString;
  end
  else
  begin
    ShowMessage('VOCÊ NÃO POSSUI PERMISSÃO PARA EXECUTAR ESSA AÇÃO ! CONTACTE O ADMINISTRADOR DO SISTEMA !');
  end;

  end
  else if (LocalClickPos.X >= lista.Width-42) then
  begin

    if fcapa.nivel='ADM' then
    begin
    MessageDlg('TEM CERTEZA QUE DESEJA EXCLUIR O SERVIÇO ?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes,System.UITypes.TMsgDlgBtn.mbNo], 0,procedure(const AResult: System.UITypes.TModalResult)
     begin
      case AResult of
       mrYES:
       begin
             //deleta os itens das comandas
             with excluir do
             begin
               Close;
               Sql.Clear;
               sql.Add('delete from itens where servico=:id');
               ParamByName('id').Value:=StrToInt(lista.Items[ItemIndex].Objects.FindDrawable('id').Data.AsString);
               ExecSQL;
             end;

              //deleta   servico
             with excluir do
             begin
               Close;
               Sql.Clear;
               sql.Add('delete from servicos where id=:id');
               ParamByName('id').Value:=StrToInt(lista.Items[ItemIndex].Objects.FindDrawable('id').Data.AsString);
               ExecSQL;
             end;

             ShowMessage('SERVIÇO EXCLUÍDO COM SUCESSO !');
             listar;
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

procedure Tfcad_servicos.listar;
var
item:TListViewItem;
I:Integer;
begin

    //limpa a lista
    lista.Items.Clear;
    lista.BeginUpdate;

    //abre a query
    with cadastros do
    begin
        //lista os resultados se houver
       if RecordCount > 0 then
       begin
         First;

         //loop
         for I := 0 to RecordCount - 1 do
         begin

          item:=lista.Items.Add;
          item.Tag:=FieldByName('id').AsInteger;
          item.data['fundo']:=fundo.Bitmap;
          item.data['icone']:=icone.Bitmap;
          item.Data['nome']:= FieldByName('nome').AsString;
          item.Data['valor']:= FormatFloat('#0.00',FieldByName('valor').AsCurrency);
          item.Data['id']:= IntToStr(FieldByName('id').Value);
          item.Data['del']:= del.Bitmap;
          item.Data['editar']:= editar.Bitmap;
          Next;
         end;



       end;

     lista.EndUpdate;

    end;

end;

procedure Tfcad_servicos.SearchEditButton1Click(Sender: TObject);
begin
busca(edtBusca.Text);
end;

procedure Tfcad_servicos.tvalorChangeTracking(Sender: TObject);
begin
fcapa.FormatarMoeda(tvalor);
end;


end.
