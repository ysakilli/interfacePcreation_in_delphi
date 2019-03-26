object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Kullan'#305'm Talimatlar'#305
  ClientHeight = 334
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClick = FormClick
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 9
    Width = 121
    Height = 13
    Caption = 'Se'#231'ilen Dosyan'#305'n Konumu'
  end
  object Label2: TLabel
    Left = 128
    Top = 50
    Width = 97
    Height = 13
    Caption = 'Kaydedilecek Konum'
  end
  object Shape1: TShape
    Left = 304
    Top = 8
    Width = 466
    Height = 308
    Brush.Color = clRed
    Brush.Style = bsFDiagonal
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
    Left = 152
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
    Left = 232
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
  object Label5: TLabel
    Left = 536
    Top = 317
    Width = 250
    Height = 19
    Caption = 'Kullan'#305'm Talimatlar'#305' Penceresi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SelectButton: TBitBtn
    Left = 16
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
    Left = 87
    Top = 28
    Width = 203
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'SelectedText'
    OnClick = SelectedTextClick
  end
  object FolderText: TEdit
    Left = 87
    Top = 69
    Width = 203
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'FolderText'
    OnClick = FolderTextClick
  end
  object Folderbutton: TBitBtn
    Left = 16
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
    Left = 215
    Top = 270
    Width = 75
    Height = 33
    Caption = 'Kaydet'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = SaveButtonClick
  end
  object ColorConfig: TRadioGroup
    Left = 16
    Top = 168
    Width = 113
    Height = 135
    Caption = 'ColorConfig'
    Items.Strings = (
      'A'#231#305'k Renkler'
      'Kapal'#305' Renkler')
    TabOrder = 5
    OnClick = ColorConfigClick
  end
  object ColorCheck: TCheckBox
    Left = 16
    Top = 129
    Width = 97
    Height = 17
    Caption = 'Renk Ayar'#305
    TabOrder = 6
    OnClick = ColorCheckClick
  end
  object AutosizeCheck: TCheckBox
    Left = 16
    Top = 106
    Width = 97
    Height = 17
    Caption = 'S'#305#287'd'#305'r'
    TabOrder = 7
    OnClick = AutosizeCheckClick
  end
  object ApplyButton: TBitBtn
    Left = 183
    Top = 96
    Width = 115
    Height = 73
    Caption = 'Renkleri Uygula'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = ApplyButtonClick
  end
  object BitBtn1: TBitBtn
    Left = 135
    Top = 274
    Width = 75
    Height = 25
    Caption = 'Tamam'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 9
    OnClick = BitBtn1Click
  end
  object Memo1: TMemo
    Left = 304
    Top = 8
    Width = 466
    Height = 308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
    Visible = False
  end
  object StaticText1: TStaticText
    Left = 512
    Top = 72
    Width = 4
    Height = 4
    TabOrder = 11
  end
  object NewWidth: TEdit
    Left = 136
    Top = 191
    Width = 74
    Height = 21
    NumbersOnly = True
    TabOrder = 12
  end
  object NewHeight: TEdit
    Left = 216
    Top = 191
    Width = 74
    Height = 21
    NumbersOnly = True
    TabOrder = 13
  end
  object ResizeButton: TBitBtn
    Left = 175
    Top = 218
    Width = 75
    Height = 33
    Caption = 'Resize'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 14
    OnClick = ResizeButtonClick
  end
end
