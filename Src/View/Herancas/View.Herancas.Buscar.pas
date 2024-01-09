unit View.Herancas.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus;

type
  TViewHerancasBuscar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnRodape: TPanel;
    Label1: TLabel;
    edtBuscar: TEdit;
    rdGroupFiltros: TRadioGroup;
    btnCadastrar: TBitBtn;
    btnUltilizar: TBitBtn;
    btnFechar: TBitBtn;
    DBGrid1: TDBGrid;
    pnTotal: TPanel;
    lbTotal: TLabel;
    DataSource1: TDataSource;
    btnAlterar: TBitBtn;
    PopupMenu1: TPopupMenu;
    Atualizar1: TMenuItem;
    N1: TMenuItem;
    Excluir1: TMenuItem;
    procedure btnFecharClick(Sender: TObject);
    procedure btnUltilizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdGroupFiltrosClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Atualizar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
  private

  protected
    procedure BuscarDados; virtual;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewHerancasBuscar: TViewHerancasBuscar;

implementation

{$R *.dfm}

procedure TViewHerancasBuscar.Atualizar1Click(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.btnAlterarClick(Sender: TObject);
begin
  if (DataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Selecione um registro');
end;

procedure TViewHerancasBuscar.btnFecharClick(Sender: TObject);
begin
  if(DataSource1.DataSet.IsEmpty) then
  raise Exception.Create('Selecione um registro');

  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TViewHerancasBuscar.btnUltilizarClick(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrOk;
end;

procedure TViewHerancasBuscar.edtBuscarChange(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.BuscarDados;
begin
  lbTotal.Caption := 'Registro localizados: 000000';
  if (DataSource1.DataSet.IsEmpty) then
    Exit;

  lbTotal.Caption := 'Registro localizados: ' + FormatFloat('000000', DataSource1.DataSet.RecordCount);

end;

procedure TViewHerancasBuscar.DBGrid1DblClick(Sender: TObject);
begin
  btnUltilizar.Click;
end;

procedure TViewHerancasBuscar.DBGrid1DrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (not Odd(DataSource1.DataSet.RecNo)) then
    DBGrid1.Canvas.Brush.Color := $00DDDDDD;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TViewHerancasBuscar.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  btnUltilizar.Click;

end;

procedure TViewHerancasBuscar.edtBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case(Key) of
    VK_UP: DataSource1.DataSet.Prior;
    VK_DOWN: DataSource1.DataSet.Next;
  end;
end;

procedure TViewHerancasBuscar.edtBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13)and(not DataSource1.DataSet.IsEmpty) then
  btnUltilizar.Click;

end;

procedure TViewHerancasBuscar.Excluir1Click(Sender: TObject);
begin
  if DataSource1.DataSet.IsEmpty then
    raise Exception.Create('Selecione um registro');

    if (Application.MessageBox(
    'Confirma exclus�o deste registro ?',
    'Confirma exclus�o?',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYes)
    then
      Exit ;

     DataSource1.DataSet.Delete;
     Self.BuscarDados;

end;

procedure TViewHerancasBuscar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case(Key) of
    VK_F4:
    begin
      if (ssAlt in Shift) then
        Key := 0;
    end;
    VK_ESCAPE :
    btnFechar.Click;
    end;

    if(Key in [VK_F1..VK_F12])then
    begin
      if(rdGroupFiltros.Items.Count >= Key - VK_F1)then
      rdGroupFiltros.ItemIndex := Key - VK_F1;
    end;

  end;

procedure TViewHerancasBuscar.FormShow(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
  edtBuscar.SetFocus;
end;

procedure TViewHerancasBuscar.rdGroupFiltrosClick(Sender: TObject);
begin
  edtBuscar.SetFocus;
end;

end.
