object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Ysa'#8482
  ClientHeight = 326
  ClientWidth = 775
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ImageScreen: TImage
    Left = 308
    Top = 8
    Width = 449
    Height = 300
  end
  object Label1: TLabel
    Left = 120
    Top = 9
    Width = 121
    Height = 13
    Caption = 'Se'#231'ilen Dosyan'#305'n Konumu'
  end
  object Label2: TLabel
    Left = 120
    Top = 50
    Width = 97
    Height = 13
    Caption = 'Kaydedilecek Konum'
  end
  object PictureShape: TShape
    Left = 308
    Top = 8
    Width = 449
    Height = 300
    Brush.Color = clRed
    Brush.Style = bsBDiagonal
  end
  object PictureLabel: TLabel
    Left = 360
    Top = 96
    Width = 343
    Height = 116
    Caption = 'Picture'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 143
    Top = 175
    Width = 37
    Height = 18
    Caption = 'Width'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 223
    Top = 175
    Width = 41
    Height = 18
    Caption = 'Height'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SelectButton: TBitBtn
    Left = 8
    Top = 16
    Width = 65
    Height = 33
    Caption = 'Dosya Se'#231
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = SelectButtonClick
  end
  object SelectedText: TEdit
    Left = 79
    Top = 28
    Width = 203
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object FolderText: TEdit
    Left = 79
    Top = 69
    Width = 203
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object Folderbutton: TBitBtn
    Left = 8
    Top = 55
    Width = 65
    Height = 33
    Caption = 'Kay'#305't Yeri'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = FolderbuttonClick
  end
  object SaveButton: TBitBtn
    Left = 167
    Top = 262
    Width = 75
    Height = 33
    Caption = 'Kaydet'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = SaveButtonClick
  end
  object ColorConfig: TRadioGroup
    Left = 8
    Top = 173
    Width = 113
    Height = 135
    Caption = 'ColorConfig'
    Enabled = False
    Items.Strings = (
      'A'#231#305'k Renkler'
      'Kapal'#305' Renkler')
    TabOrder = 5
  end
  object ColorCheck: TCheckBox
    Left = 8
    Top = 129
    Width = 97
    Height = 17
    Caption = 'Renk Ayar'#305
    TabOrder = 6
    OnClick = ColorCheckClick
  end
  object AutosizeCheck: TCheckBox
    Left = 8
    Top = 106
    Width = 97
    Height = 17
    Caption = 'S'#305#287'd'#305'r'
    TabOrder = 7
    OnClick = AutosizeCheckClick
  end
  object ApplyButton: TBitBtn
    Left = 167
    Top = 96
    Width = 115
    Height = 73
    Caption = 'Renkleri Uygula'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = ApplyButtonClick
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 293
    Width = 75
    Height = 25
    Caption = 'Talimatlar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 9
    OnClick = BitBtn1Click
  end
  object NewWidth: TEdit
    Left = 127
    Top = 191
    Width = 74
    Height = 21
    NumbersOnly = True
    TabOrder = 10
  end
  object NewHeight: TEdit
    Left = 207
    Top = 191
    Width = 74
    Height = 21
    NumbersOnly = True
    TabOrder = 11
  end
  object ResizeButton: TBitBtn
    Left = 166
    Top = 218
    Width = 75
    Height = 33
    Caption = 'Resize'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 12
    OnClick = ResizeButtonClick
  end
  object ProgressBar1: TProgressBar
    Left = 152
    Top = 301
    Width = 150
    Height = 17
    TabOrder = 13
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '.jpg'
    Filter = 
      'Image File|*.png;*.jpg;*.jpeg;*.bmp|JPEG Image File (*.jpeg)|*.j' +
      'peg|Bitmap File|*.bmp'
    Left = 720
    Top = 272
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '.jpg'
    Filter = 
      'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Po' +
      'rtable Network Graphics (*.png)|*.png|Bitmaps (*.bmp)|*.bmp'
    Left = 688
    Top = 272
  end
  object OpenDialog1: TOpenDialog
    Left = 656
    Top = 272
  end
end
