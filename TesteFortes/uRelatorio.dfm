object fmRelatorio: TfmRelatorio
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 390
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlFolha: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de Abastecimentos'
    BeforePrint = rlFolhaBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btHeader
      Color = 12615680
      ParentColor = False
      Transparent = False
      object RLSystemInfo1: TRLSystemInfo
        Left = 596
        Top = 0
        Width = 122
        Height = 16
        Align = faRightTop
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = 'Pag..:'
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 0
        Top = 0
        Width = 40
        Height = 16
        Align = faLeftTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = itTitle
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object lbAgrupamento: TRLLabel
        Left = 0
        Top = 19
        Width = 85
        Height = 16
        Align = faLeftBottom
        Caption = 'Agrupado por '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object lbFiltroData: TRLLabel
        Left = 648
        Top = 19
        Width = 70
        Height = 16
        Align = faRightBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 236
      Width = 718
      Height = 40
      BandType = btFooter
      object RLLabel1: TRLLabel
        Left = 0
        Top = 26
        Width = 105
        Height = 14
        Align = faLeftBottom
        Caption = 'Teste Fortes Vinicius'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 655
        Top = 21
        Width = 60
        Height = 14
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Info = itHour
        ParentFont = False
        Text = 'Hora:'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 654
        Top = 3
        Width = 61
        Height = 14
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Data: '
      end
    end
    object rlGrupo: TRLGroup
      Left = 38
      Top = 73
      Width = 718
      Height = 128
      DataFields = 'TANQUE'
      object RLBand4: TRLBand
        Left = 0
        Top = 59
        Width = 718
        Height = 32
        object RLDBText1: TRLDBText
          Left = 3
          Top = 10
          Width = 38
          Height = 16
          DataField = 'DATA'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 87
          Top = 10
          Width = 57
          Height = 16
          DataField = 'TANQUE'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 192
          Top = 10
          Width = 52
          Height = 16
          DataField = 'BOMBA'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 402
          Top = 10
          Width = 48
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = DataSource1
          DisplayMask = 'R$ #0.00'
          Text = ''
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 91
        Width = 718
        Height = 31
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBResult1: TRLDBResult
          Left = 320
          Top = 9
          Width = 130
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = DataSource1
          DisplayMask = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = 'Total: '
          OnCompute = RLDBResult1Compute
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 29
        Width = 718
        Height = 30
        BandType = btHeader
        object RLLabel2: TRLLabel
          Left = 3
          Top = 8
          Width = 70
          Height = 16
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 86
          Top = 8
          Width = 52
          Height = 16
          Caption = 'Tanque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 192
          Top = 8
          Width = 49
          Height = 16
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 380
          Top = 8
          Width = 70
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 29
        BandType = btHeader
        Color = 16573630
        ParentColor = False
        Transparent = False
        object lbdbAgrup: TRLDBText
          Left = 25
          Top = 7
          Width = 77
          Height = 18
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 35
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 281
        Top = 8
        Width = 169
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = DataSource1
        DisplayMask = 'R$ ###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = 'Total Geral: '
        OnCompute = RLDBResult2Compute
      end
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = dmConexao.fdqRel
    Left = 464
  end
end
