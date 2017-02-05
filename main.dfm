object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'GLscene Test'
  ClientHeight = 585
  ClientWidth = 859
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
  object Splitter: TSplitter
    Left = 265
    Top = 0
    Height = 585
    ResizeStyle = rsUpdate
    ExplicitLeft = 216
    ExplicitTop = 280
    ExplicitHeight = 100
  end
  object GLSceneViewer: TGLSceneViewer
    Left = 268
    Top = 0
    Width = 591
    Height = 585
    Camera = GLCamera
    Buffer.BackgroundColor = clGray
    FieldOfView = 160.599212646484400000
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 585
    Align = alLeft
    TabOrder = 1
    DesignSize = (
      265
      585)
    object NodeValues: TStringGrid
      Left = 8
      Top = 8
      Width = 248
      Height = 510
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColCount = 3
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      OnClick = OnValuesClick
      ExplicitWidth = 232
    end
    object AddButton: TButton
      Left = 8
      Top = 551
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Add'
      TabOrder = 1
      OnClick = AddButtonClick
    end
    object RemoveButton: TButton
      Left = 89
      Top = 551
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Remove'
      TabOrder = 2
      OnClick = RemoveButtonClick
    end
    object XValue: TEdit
      Left = 8
      Top = 524
      Width = 57
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 3
      Text = '0.0'
    end
    object YValue: TEdit
      Left = 71
      Top = 524
      Width = 57
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 4
      Text = '0.0'
    end
    object ZValue: TEdit
      Left = 134
      Top = 524
      Width = 57
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 5
      Text = '0.0'
    end
    object ApplyButton: TButton
      Left = 171
      Top = 551
      Width = 75
      Height = 25
      Caption = 'Apply'
      Default = True
      TabOrder = 6
      OnClick = ApplyButtonClick
    end
  end
  object GLScene: TGLScene
    Left = 280
    Top = 32
    object GLCamera: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = GLRevolutionSolid
      Position.Coordinates = {0000000000008040000020410000803F}
    end
    object GLDummyCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      VisibleAtRunTime = True
    end
    object GLLightSource: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {0000004000000040000040400000803F}
      SpotCutOff = 180.000000000000000000
    end
    object GLRevolutionSolid: TGLRevolutionSolid
      Material.FrontProperties.Ambient.Color = {CDCC4C3E00000000000000000000803F}
      Material.FrontProperties.Diffuse.Color = {CDCC4C3F00000000000000000000803F}
      Nodes = <
        item
          X = 5.000000000000000000
          Y = 1.000000000000000000
        end
        item
          X = 4.000000000000000000
        end
        item
          X = 5.000000000000000000
          Y = -1.000000000000000000
        end>
      Parts = [rspOutside, rspInside]
      Slices = 32
      Normals = nsSmooth
    end
  end
end
