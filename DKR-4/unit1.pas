unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TFmain }

  TFmain = class(TForm)
    Izdelie: TEdit;
    Nextt: TButton;
    Raz: TLabel;
    Previouss: TButton;
    Metall: TEdit;
    Razmer: TEdit;
    Cena: TEdit;
    Stoimost: TLabel;
    LightCheckbox: TCheckBox;
    Naimen: TLabel;
    Met: TLabel;
    Nal: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NexttClick(Sender: TObject);
    procedure PrevioussClick(Sender: TObject);
    procedure NaimenClick(Sender: TObject);
    procedure IzdelieChange(Sender: TObject);
    procedure RazClick(Sender: TObject);
  private
    procedure GetRow(i: integer);
    procedure editdata(i:integer);
  public

  end;

var
  Fmain: TFmain;
  Data: TStringList;
  cur_row: integer;

implementation

{$R *.lfm}

{ TFmain }


procedure TFmain.FormShow(Sender: TObject);
Begin
  Data := TStringList.create;
  cur_row := 0;
  if FileExists('data.txt') then begin
     Data.LoadFromFile('data.txt');
      getRow(cur_row);
  end;
end;

procedure TFmain.NexttClick(Sender: TObject);
begin
 editdata(cur_row);
 if cur_row < data.count-1 then
    begin
      cur_row := cur_row + 1;
      getRow(cur_row);
    end
    else
   begin
     data.add('');
     cur_row += 1;
     Izdelie.Clear;
     Metall.clear;
     lightcheckbox.checked := False;
     Razmer.clear;
     Cena.clear;
   end;
end;

procedure TFmain.PrevioussClick(Sender: TObject);
begin
 editdata(cur_row);
 if cur_row > 0 then
    begin
      cur_row := cur_row - 1;
      getRow(cur_row);
    end;
end;

procedure TFmain.NaimenClick(Sender: TObject);
begin

end;

procedure TFmain.IzdelieChange(Sender: TObject);
begin

end;

procedure TFmain.RazClick(Sender: TObject);
begin

end;

procedure TFmain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  editdata(cur_row);
  data.saveToFile('data.txt')
end;

procedure TFmain.FormCreate(Sender: TObject);
begin

end;

procedure TFmain.GetRow(i: integer);
var str: string;
begin
   str := Data.Strings[i];

   Izdelie.text:=copy(str, 1, pos(',',str)-1);
   delete(str,1,pos(',',str));

   Metall.text:=copy(str, 1, pos(',',str)-1);
   delete(str,1,pos(',',str));

   if copy(str, 1, pos(',',str)-1) = 'True' then
      LightCheckbox.checked := True
   else
      LightCheckbox.checked := False;
   delete(str,1,pos(',',str));

   Razmer.text:=copy(str, 1, pos(',',str)-1);
   delete(str,1,pos(',',str));

   Cena.text:=str;
end;

procedure TFmain.editdata(i:integer);
var str:string;
begin
   if LightCheckbox.checked = True then
      str:= 'True'
   else str:='False';
   data.strings[i]:= Izdelie.text + ',' + Metall.text + ',' +  str + ',' + Razmer.text + ',' + Cena.Text;
end;

end.

