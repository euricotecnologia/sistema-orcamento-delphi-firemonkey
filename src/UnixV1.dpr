program UnixV1;

uses
  System.StartUpCopy,
  FMX.Forms,
  form_capa in 'form_capa.pas' {fcapa},
  form_clientes in 'form_clientes.pas' {fclientes},
  uGhiFuncoes in 'uGhiFuncoes.pas',
  form_opcoes in 'form_opcoes.pas' {fopcoes},
  form_termos in 'form_termos.pas' {ftermos},
  U_MsgD in 'U_MsgD.pas',
  form_fecha in 'form_fecha.pas' {ffecha},
  form_servicos in 'form_servicos.pas' {fservicos},
  form_cad_servicos in 'form_cad_servicos.pas' {fcad_servicos},
  form_cad_atendentes in 'form_cad_atendentes.pas' {fcad_atendentes},
  form_menu in 'form_menu.pas' {fmenu};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(Tfcapa, fcapa);
  Application.Run;
end.
