unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, QuickRpt, QRCtrls, QRPrntr, Vcl.Buttons, Math;

type
  TFPrinc = class(TForm)
    BSelec: TButton;
    Imagen: TImage;
    ODImagen: TOpenDialog;
    RG1: TRadioGroup;
    BSalir: TButton;
    Bevel1: TBevel;
    BImprimir: TButton;
    LDim: TLabel;
    LAncho: TLabel;
    LAlto: TLabel;
    CBPorc: TComboBox;
    Label1: TLabel;
    SBAcerca: TSpeedButton;
    procedure BSalirClick(Sender: TObject);
    procedure BSelecClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure SBAcercaClick(Sender: TObject);
    procedure CBPorcKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CentrarImagen(var QRImg: TQRImage; AnchoH,AltoH: integer);
  public
    { Public declarations }
  end;

var
  FPrinc: TFPrinc;

implementation

uses TamCarta, VistaPrevia, TamOficio;

{$R *.dfm}

procedure TFPrinc.CBPorcKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9'])) then Key:=#0;
end;

procedure TFPrinc.CentrarImagen(var QRImg: TQRImage; AnchoH,AltoH: integer);
begin
  QRImg.Top:=(AltoH-QRImg.Height) div 2;
  QRImg.Left:=(AnchoH-QRImg.Width) div 2;
end;

procedure TFPrinc.BSalirClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFPrinc.BSelecClick(Sender: TObject);
const
  Pixel=0.0264583333333334;  //1 pixel (X) = 0.0264583333333334 cms
begin
  ODImagen.Execute();
  Imagen.Picture.LoadFromFile(ODImagen.FileName);
  BImprimir.Enabled:=ODImagen.FileName<>'';
  if BImprimir.Enabled then
  begin
    LAncho.Caption:='Ancho: '+IntToStr(Imagen.Picture.Width)+' ('+
      FormatFloat('0.##',Imagen.Picture.Width*Pixel)+' cm)';
    LAlto.Caption:='Alto: '+IntToStr(Imagen.Picture.Height)+' ('+
      FormatFloat('0.##',Imagen.Picture.Height*Pixel)+' cm)';
  end;
end;

procedure TFPrinc.SBAcercaClick(Sender: TObject);
begin
  FAcerca:=TFAcerca.Create(Self);
  FAcerca.ShowModal;
  FAcerca.Free;
end;

procedure TFPrinc.BImprimirClick(Sender: TObject);
var
  Alt,Anch: integer;
begin
   Application.CreateForm(TFCarta,FCarta);
  //se ajusta la banda de acuerdo al tamaño de hoja seleccionado:
  FCarta.QRBand.Height:=FCarta.QuickRep.Height-1;
  //se muestra la imagen con la configuración seleccionada:
  FCarta.QRImage.Picture.LoadFromFile(ODImagen.FileName);
  Alt:=Imagen.Picture.Height;
  Anch:=Imagen.Picture.Width;
  FCarta.QRImage.Height:=Round(Alt*StrToInt(FPrinc.CBPorc.Text)/100);
  FCarta.QRImage.Width:=Round(Anch*StrToInt(FPrinc.CBPorc.Text)/100);
              {
  if RG1.ItemIndex=0 then FCarta.QuickRep.PrinterSettings.PaperSize:=Letter
                     else FCarta.QuickRep.PrinterSettings.PaperSize:=Folio;
  if RG1.ItemIndex=0 then FCarta.QuickRep.Page.PaperSize:=Letter
                     else FCarta.QuickRep.Page.PaperSize:=Folio;     }
  if RG1.ItemIndex=0 then CentrarImagen(FCarta.QRImage,816,1056)  //carta
                     else CentrarImagen(FCarta.QRImage,816,1248); //oficio o folio
  FCarta.QuickRep.PreviewModal;

end;

end.

//  FCarta.QRMemo.Caption:='Esto es una prueba muy simple que trata sobre la justificación de texto en un memo de QReport. Necesito que esta vaina funcione, para ver si así puedo hacer el siguiente punto de mi pequeña aplicación. Listo, me cansé!!!';
