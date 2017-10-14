unit TamCarta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, QRPrntr;

type
  TFCarta = class(TForm)
    QuickRep: TQuickRep;
    QRBand: TQRBand;
    QRImage: TQRImage;
    procedure QuickRepPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCarta: TFCarta;

implementation

{$R *.dfm}

uses Principal,VistaPrevia;

procedure TFCarta.QuickRepPreview(Sender: TObject);
begin
  with TFVPrevia.Create(nil) do
  try
    QRPreview.QRPrinter:=TQRPrinter(Sender);
    ShowModal;
  finally
    Free;
  end;
end;

end.
