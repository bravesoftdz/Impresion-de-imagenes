object FPrinc: TFPrinc
  Left = 235
  Top = 149
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Impresi'#243'n de Im'#225'genes v1.0'
  ClientHeight = 355
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Imagen: TImage
    Left = 328
    Top = 48
    Width = 225
    Height = 217
    Center = True
    Proportional = True
  end
  object Bevel1: TBevel
    Left = 328
    Top = 48
    Width = 225
    Height = 217
  end
  object LDim: TLabel
    Left = 336
    Top = 272
    Width = 3
    Height = 13
  end
  object LAncho: TLabel
    Left = 448
    Top = 280
    Width = 34
    Height = 13
    Caption = 'Ancho:'
  end
  object LAlto: TLabel
    Left = 328
    Top = 280
    Width = 23
    Height = 13
    Caption = 'Alto:'
  end
  object Label1: TLabel
    Left = 88
    Top = 179
    Width = 60
    Height = 13
    Caption = 'Tama'#241'o (%)'
  end
  object SBAcerca: TSpeedButton
    Left = 572
    Top = 8
    Width = 23
    Height = 22
    Caption = '*-*'
    OnClick = SBAcercaClick
  end
  object BSelec: TButton
    Left = 72
    Top = 48
    Width = 169
    Height = 25
    Caption = 'Seleccione imagen...'
    TabOrder = 0
    OnClick = BSelecClick
  end
  object RG1: TRadioGroup
    Left = 72
    Top = 96
    Width = 169
    Height = 57
    Caption = '  Tama'#241'o de hoja '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Carta'
      'Oficio')
    TabOrder = 1
  end
  object BSalir: TButton
    Left = 120
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 3
    OnClick = BSalirClick
  end
  object BImprimir: TButton
    Left = 88
    Top = 216
    Width = 137
    Height = 25
    Caption = 'Imprimir...'
    Enabled = False
    TabOrder = 2
    OnClick = BImprimirClick
  end
  object CBPorc: TComboBox
    Left = 168
    Top = 176
    Width = 57
    Height = 21
    CharCase = ecUpperCase
    ItemIndex = 3
    MaxLength = 3
    TabOrder = 4
    Text = '100'
    OnKeyPress = CBPorcKeyPress
    Items.Strings = (
      '25'
      '50'
      '75'
      '100'
      '125'
      '150'
      '175'
      '200')
  end
  object ODImagen: TOpenDialog
    Filter = '|*.jpg||*.jpeg||*.bmp||*.gif||*.png'
    Left = 24
    Top = 128
  end
end
