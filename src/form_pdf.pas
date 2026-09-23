unit form_pdf;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSBitmapContainer, FMX.TMSCustomComponent, FMX.TMSPDFIO,
  FMX.TMSRichEditorPDFIO, FMX.TMSBaseControl, FMX.TMSScrollControl,
  FMX.TMSRichEditorBase, FMX.TMSRichEditor;

type
  Tfpdf = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    var
    autor,titulo,:string;


  public
    { Public declarations }
  end;

var
  fpdf: Tfpdf;

implementation


{$R *.fmx}

procedure Tfpdf.FormCreate(Sender: TObject);
begin


end;

end.
