object FVPrevia: TFVPrevia
  Left = 235
  Top = 149
  Caption = 'Imprimir'
  ClientHeight = 602
  ClientWidth = 995
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    995
    602)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 13
    Width = 26
    Height = 13
    Caption = 'Zoom'
  end
  object LPorc: TLabel
    Left = 160
    Top = 13
    Width = 119
    Height = 13
    Caption = 'Tama'#241'o de imagen (%): '
  end
  object LAlto: TLabel
    Left = 360
    Top = 6
    Width = 23
    Height = 13
    Caption = 'Alto:'
  end
  object LAncho: TLabel
    Left = 360
    Top = 24
    Width = 34
    Height = 13
    Caption = 'Ancho:'
  end
  object QRPreview: TQRPreview
    AlignWithMargins = True
    Left = 1
    Top = 43
    Width = 992
    Height = 558
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    PageNumber = 1
    Zoom = 100
  end
  object SEZoom: TSpinEdit
    Left = 56
    Top = 10
    Width = 52
    Height = 22
    MaxValue = 200
    MinValue = 1
    TabOrder = 1
    Value = 1
    OnChange = SEZoomChange
  end
  object BBImprimir: TBitBtn
    Left = 690
    Top = 8
    Width = 111
    Height = 25
    Hint = 'Imprimir documento'
    Caption = 'Imprimir...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    OnClick = BBImprimirClick
  end
  object Button1: TButton
    Left = 904
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ChBExpPDF: TCheckBox
    Left = 560
    Top = 12
    Width = 121
    Height = 17
    Caption = 'S'#243'lo exportar a PDF'
    TabOrder = 4
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.pdf'
    Filter = 'Portable Document Format|*.pdf'
    Title = 'Guardar a archivo PDF'
    Left = 192
    Top = 97
  end
  object PrSDialog: TPrinterSetupDialog
    Left = 249
    Top = 99
  end
  object PrintDialog: TPrintDialog
    Left = 305
    Top = 97
  end
end
