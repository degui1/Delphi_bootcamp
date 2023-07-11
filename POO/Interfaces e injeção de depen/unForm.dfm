object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 293
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 40
    Width = 75
    Height = 25
    Caption = 'InsertPessoa'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 48
    Top = 71
    Width = 75
    Height = 25
    Caption = 'InsertProduto'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 376
    Top = 8
    Width = 577
    Height = 265
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button3: TButton
    Left = 48
    Top = 102
    Width = 75
    Height = 25
    Caption = 'DeletePessoa'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 48
    Top = 133
    Width = 75
    Height = 25
    Caption = 'DeleteProduto'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 37
    Top = 260
    Width = 75
    Height = 25
    Caption = 'UpdatePessoa'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 134
    Top = 260
    Width = 75
    Height = 25
    Caption = 'UpdateProduto'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Edit1: TEdit
    Left = 37
    Top = 179
    Width = 172
    Height = 21
    TabOrder = 7
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 37
    Top = 206
    Width = 172
    Height = 21
    TabOrder = 8
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 37
    Top = 233
    Width = 172
    Height = 21
    TabOrder = 9
    Text = 'Edit3'
  end
end
