unit Model.Cidades.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao.DM;

type
  TModelCidadesDM = class(TDataModule)
    QCidadesCadastro: TFDQuery;
    QCidadesBusca: TFDQuery;
    QCidadesCadastroID: TFDAutoIncField;
    QCidadesCadastroNome: TWideStringField;
    QCidadesCadastroUF: TWideStringField;
    QCidadesCadastroCodigo_IBGE: TIntegerField;
    QCidadesBuscaID: TFDAutoIncField;
    QCidadesBuscaNome: TWideStringField;
    QCidadesBuscaUF: TWideStringField;
    QCidadesBuscaCodigo_IBGE: TIntegerField;
  private

  public
    procedure CidadesBuscar(const ACondicao: string);
  end;

var
  ModelCidadesDM: TModelCidadesDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TModelCidadesDM.CidadesBuscar(const ACondicao: string);
begin
 QCidadesBusca.Close;
 QCidadesBusca.SQL.Clear;
 QCidadesBusca.SQL.Add('select * from cidades');
 QCidadesBusca.SQL.Add(ACondicao);
 QCidadesBusca.Open;
end;

end.
