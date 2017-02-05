unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GLScene, GLObjects, GLExtrusion,
  GLCoordinates, GLWin32Viewer, GLCrossPlatform, GLBaseClasses, GLNodes,
  Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    GLScene: TGLScene;
    GLSceneViewer: TGLSceneViewer;
    GLCamera: TGLCamera;
    GLLightSource: TGLLightSource;
    GLRevolutionSolid: TGLRevolutionSolid;
    GLDummyCube: TGLDummyCube;
    Panel1: TPanel;
    Splitter: TSplitter;
    NodeValues: TStringGrid;
    AddButton: TButton;
    RemoveButton: TButton;
    XValue: TEdit;
    YValue: TEdit;
    ZValue: TEdit;
    ApplyButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OnValuesClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
  private
    procedure BuildNodeValues;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.AddButtonClick(Sender: TObject);
begin
  GLRevolutionSolid.Nodes.Add;
  BuildNodeValues;
end;

procedure TMainForm.ApplyButtonClick(Sender: TObject);
var
  selected: integer;
  x, y, z: single;
  node: TGLNode;

begin
  x := StrToFloat(XValue.Text);
  y := StrToFloat(YValue.Text);
  z := StrToFloat(ZValue.Text);

  selected := NodeValues.Selection.Top - 1;
  if (selected >= 0) and (selected < GLRevolutionSolid.Nodes.Count) then
  begin
    node := GLRevolutionSolid.Nodes[selected];
    node.X := x;
    node.Y := y;
    node.Z := z;
    NodeValues.Cells[0, selected + 1] := FloatToStr(node.X);
    NodeValues.Cells[1, selected + 1] := FloatToStr(node.Y);
    NodeValues.Cells[2, selected + 1] := FloatToStr(node.Z);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);

begin
  NodeValues.Cells[0, 0] := 'X';
  NodeValues.Cells[1, 0] := 'Y';
  NodeValues.Cells[2, 0] := 'Z';
  BuildNodeValues;
end;

procedure TMainForm.OnValuesClick(Sender: TObject);
var
  selected: integer;
  node: TGLNode;

begin
  selected := NodeValues.Selection.Top - 1;
  if (selected >= 0) and (selected < GLRevolutionSolid.Nodes.Count) then
  begin
    node := GLRevolutionSolid.Nodes[selected];
    XValue.Text := FloatToStr(node.X);
    YValue.Text := FloatToStr(node.Y);
    ZValue.Text := FloatToStr(node.Z);
  end;
end;

procedure TMainForm.RemoveButtonClick(Sender: TObject);
var
  selected: integer;

begin
  selected := NodeValues.Selection.Top;
  if selected > 0 then
  begin
    GLRevolutionSolid.Nodes.Delete(selected - 1);
    BuildNodeValues;
  end;
end;

procedure TMainForm.BuildNodeValues;
var
  i: Integer;
  node: TGLNode;

begin
  NodeValues.RowCount := GLRevolutionSolid.Nodes.Count + 1;
  for i := 0 to GLRevolutionSolid.Nodes.Count - 1 do
  begin
    node := GLRevolutionSolid.Nodes[i];
    NodeValues.Cells[0, i + 1] := FloatToStr(node.X);
    NodeValues.Cells[1, i + 1] := FloatToStr(node.Y);
    NodeValues.Cells[2, i + 1] := FloatToStr(node.Z);
  end;
end;

end.
