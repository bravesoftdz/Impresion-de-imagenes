unit VistaPrevia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Samples.Spin, QRPrntr, QRPDFFilt;

type
  TFVPrevia = class(TForm)
    QRPreview: TQRPreview;
    SEZoom: TSpinEdit;
    BBImprimir: TBitBtn;
    Button1: TButton;
    Label2: TLabel;
    LPorc: TLabel;
    LAlto: TLabel;
    LAncho: TLabel;
    ChBExpPDF: TCheckBox;
    SaveDialog: TSaveDialog;
    PrSDialog: TPrinterSetupDialog;
    PrintDialog: TPrintDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBImprimirClick(Sender: TObject);
    procedure SEZoomChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVPrevia: TFVPrevia;

const
  Pixel=0.0264583333333334;

implementation

uses TamCarta,Principal;

{$R *.dfm}

procedure TFVPrevia.BBImprimirClick(Sender: TObject);
begin
{  FCarta.QuickRep.PrinterSetup;
  if FCarta.QuickRep.Tag=0 then FCarta.QuickRep.Print;}
  with QRPreview.QRPrinter do
    if ChBExpPDF.Checked then
    begin
      SaveDialog.Execute();
      if SaveDialog.Tag=0 then
        ExportToFilter(TQRPDFDocumentFilter.Create(SaveDialog.FileName));
    end
    else
    begin
      {resolver la impresión. se necesita obtener los valores para imprimir
      PrintDialog.Execute();
      QRPreview.QRPrinter.PrinterIndex:=PrintDialog.Options;
      QRPreview.QRPrinter
      showmessage(inttostr(QRPreview.QRPrinter.Printers.Count));
      //QRPreview.QRPrinter.Print;                                         }
    end;
end;

procedure TFVPrevia.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFVPrevia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QRPreview.QRPrinter:=nil;
  Action:=caFree;
end;

procedure TFVPrevia.FormCreate(Sender: TObject);
begin
  //las imágenes de los botones:
  BBImprimir.Glyph.Handle:=LoadBitmap(HInstance,'QRPRINTBITMAP');
  //otros valores:
  SEZoom.Value:=60;
  SEZoom.MaxValue:=200;
  SEZoom.MinValue:=1;
  QRPreview.Zoom:=SEZoom.Value;
  QRPreview.Width:=ClientWidth;
end;

procedure TFVPrevia.FormShow(Sender: TObject);
var
  Alto,Ancho: integer;
begin
  WindowState:=wsMaximized;
  //las medidas originales de la imagen:
  Alto:=FCarta.QRImage.Height;
  Ancho:=FCarta.QRImage.Width;
  LPorc.Caption:=LPorc.Caption+FPrinc.CBPorc.Text;
  LAncho.Caption:='Ancho: '+IntToStr(Ancho)+' ('+FormatFloat('0.##',Ancho*Pixel)+' cm)';
  LAlto.Caption:='Alto: '+IntToStr(Alto)+' ('+FormatFloat('0.##',Alto*Pixel)+' cm)';
end;

procedure TFVPrevia.SEZoomChange(Sender: TObject);
begin
  QRPreview.Zoom:=SEZoom.Value;
end;

end.
