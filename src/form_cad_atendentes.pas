unit form_cad_atendentes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox,
  FMX.Edit, FMX.SearchBox, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.DB, DBAccess, Uni, MemDS,
  FMX.EditBox, FMX.SpinBox,FMX.Ani, FMX.Filter.Effects;

type
  Tfcad_atendentes = class(TForm)
    lista: TListView;
    editar: TImage;
    del: TImage;
    cadastros: TUniQuery;
    ds_cadastros: TUniDataSource;
    excluir: TUniQuery;
    overlay: TRectangle;
    pop: TRectangle;
    Layout1: TLayout;
    Label2: TLabel;
    Rectangle2: TRectangle;
    txt_nome: TEdit;
    Layout2: TLayout;
    update: TUniQuery;
    cadastrosid: TIntegerField;
    cadastrosnome: TStringField;
    cadastroscomissao: TIntegerField;
    updateid: TIntegerField;
    updatenome: TStringField;
    updatecomissao: TIntegerField;
    txt_valor: TSpinBox;
    Label3: TLabel;
    Label4: TLabel;
    topo: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    log: TButton;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect3: TRoundRect;
    Label6: TLabel;
    icone: TImage;
    fundo: TImage;
    Layout3: TLayout;
    Layout4: TLayout;
    add: TCircle;
    tsinal: TLabel;
    ShadowEffect1: TShadowEffect;
    roda: TFloatAnimation;
    anima: TFloatAnimation;
    edtBusca: TEdit;
    SearchEditButton1: TSearchEditButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure listaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure bt_hostClick(Sender: TObject);
    procedure logClick(Sender: TObject);
    procedure animaFinish(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure edtBuscaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure listar();
    procedure busca(texto:string);
  public
    { Public declarations }
    var FTecladoShow:Boolean;
  end;

var
  fcad_atendentes: Tfcad_atendentes;

implementation

{$R *.fmx}

uses form_capa, form_menu;

procedure Tfcad_atendentes.animaFinish(Sender: TObject);
begin
if overlay.Visible=False then
begin
  pop.Visible:=False;
  txt_valor.Text:='';
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

procedure Tfcad_atendentes.bt_hostClick(Sender: TObject);
begin
  cadastros.Insert;
  overlay.Visible:=True;
  anima.StartValue:=-pop.Height;
  anima.StopValue:=(Screen.Height / 2) - (pop.Height / 2)  ;
  pop.Visible:=True;
  anima.Start;
  txt_nome.Text:='';
  txt_valor.Value:=0;
end;

procedure Tfcad_atendentes.busca(texto: string);
begin
 with cadastros do
        begin
          Close;
          sql.Clear;
          sql.Add('select * from atendentes where nome like :busca order by nome asc');
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

procedure Tfcad_atendentes.Button1Click(Sender: TObject);
begin
  fcad_atendentes.Close;
 
end;

procedure Tfcad_atendentes.Button3Click(Sender: TObject);
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

procedure Tfcad_atendentes.Button4Click(Sender: TObject);
begin
  if (txt_nome.Text <> '') and (txt_valor.Text <> '') then
  begin

        if cadastros.State in [dsInsert] then
        begin
          cadastrosnome.Value:=Uppercase(txt_nome.Text);
          cadastroscomissao.Value:=StrToInt(txt_valor.Text);
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
          updatecomissao.Value:=StrToInt(txt_valor.Text);
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
    ShowMessage('COLOQUE O NOME DO ATENDENTE E A COMISSÃO POR FAVOR !');
  end;
end;

procedure Tfcad_atendentes.edtBuscaExit(Sender: TObject);
begin
busca(edtBusca.Text);
end;

procedure Tfcad_atendentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   fcad_atendentes:=nil;
   cadastros.Close;
   excluir.Close;
   update.Close;
end;
procedure Tfcad_atendentes.FormCreate(Sender: TObject);
begin
busca('');
end;

procedure Tfcad_atendentes.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
FTecladoShow := false;

     if not KeyboardVisible then
        AnimateFloat('Padding.Top', 0, 0.1);
end;

procedure Tfcad_atendentes.FormVirtualKeyboardShown(Sender: TObject;
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

procedure Tfcad_atendentes.listaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if (LocalClickPos.X < lista.Width-45) then
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
    txt_valor.Value:=StrToInt(lista.Items[ItemIndex].Objects.FindDrawable('comissao').Data.AsString);


  end
  else
  begin
    ShowMessage('VOCÊ NÃO POSSUI NÍVEL DE ACESSO PARA EXECUTAR ESSA FUNÇÃO ! ENTRE EM CONTATO COM O ADMINISTRADOR DO SISTEMA !');
  end;


  end
  else if (LocalClickPos.X >= lista.Width-42) then
  begin

     MessageDlg('TEM CERTEZA QUE DESEJA EXCLUIR O ATENDENTE ?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes,
    System.UITypes.TMsgDlgBtn.mbNo
    ], 0,
    procedure(const AResult: System.UITypes.TModalResult)
    begin
    case AResult of
    mrYES:
    begin
             //deleta os itens das comandas
             with excluir do
             begin
               Close;
               Sql.Clear;
               sql.Add('delete from itens where atendente=:id');
               ParamByName('id').Value:=StrToInt(lista.Items[ItemIndex].Objects.FindDrawable('id').Data.AsString);
               ExecSQL;
             end;

              //deleta   servico
             with excluir do
             begin
               Close;
               Sql.Clear;
               sql.Add('delete from atendentes where id=:id');
               ParamByName('id').Value:=StrToInt(lista.Items[ItemIndex].Objects.FindDrawable('id').Data.AsString);
               ExecSQL;
             end;

             ShowMessage('ATENDENTE EXCLUÍDO COM SUCESSO !');
             listar;
            end;
            mrNo:
            // caso não
            end;
            end);

  end;

end;

procedure Tfcad_atendentes.listar;
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
          item.Data['fundo']:= fundo.Bitmap;
          item.Data['nome']:= FieldByName('nome').AsString;
          item.Data['comissao']:=FieldByName('comissao').AsString;
          item.Data['simbolo']:='%';
          item.Data['id']:= IntToStr(FieldByName('id').Value);
          item.Data['icone']:= icone.Bitmap;
          item.Data['del']:= del.Bitmap;
          item.Data['editar']:= editar.Bitmap;
          Next;
         end;



       end
       else
       begin
         ShowMessage('NENHUM REGISTRO ENCONTRADO !');
       end;

     lista.EndUpdate;

    end;

end;

procedure Tfcad_atendentes.logClick(Sender: TObject);
begin
Close;
fmenu.Close;
end;

procedure Tfcad_atendentes.SearchEditButton1Click(Sender: TObject);
begin
busca(edtBusca.Text);
end;

end.


