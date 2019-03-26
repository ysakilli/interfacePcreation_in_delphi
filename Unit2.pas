unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    SelectButton: TBitBtn;
    SelectedText: TEdit;
    FolderText: TEdit;
    Folderbutton: TBitBtn;
    SaveButton: TBitBtn;
    ColorConfig: TRadioGroup;
    ColorCheck: TCheckBox;
    AutosizeCheck: TCheckBox;
    ApplyButton: TBitBtn;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Shape1: TShape;
    StaticText1: TStaticText;
    PictureLabel: TLabel;
    NewWidth: TEdit;
    NewHeight: TEdit;
    ResizeButton: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure SelectButtonClick(Sender: TObject);
    procedure FolderbuttonClick(Sender: TObject);
    procedure AutosizeCheckClick(Sender: TObject);
    procedure ColorCheckClick(Sender: TObject);
    procedure ColorConfigClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure SelectedTextClick(Sender: TObject);
    procedure FolderTextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure ResizeButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.ApplyButtonClick(Sender: TObject);
begin

         Memo1.Visible := True;
         Memo1.Text := 'Renkleri Uygula : Bu buton ile resim �zerine yap�lacak de�i�iklik ekranda g�sterilir.'

end;

procedure TForm2.AutosizeCheckClick(Sender: TObject);
begin

            Memo1.Visible := True;
            Memo1.Text :='S��d�r : ��aretlendi�inde resmi alana s��d�r�r.';


end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin

          Memo1.Clear;
          Memo1.Visible := False;
          Form2.Close;

end;

procedure TForm2.ColorCheckClick(Sender: TObject);
begin
            Memo1.Visible := True;
            Memo1.Text :='Renk Ayar�:Bu kutucuk i�aretlendi�inde resim �zerinde renk ayar� yap�labilecektir.Resim renkleri ana renklere �ekilecek ve �rneklenmi� bir resim elde edilecektir';



end;

procedure TForm2.ColorConfigClick(Sender: TObject);
begin

        Memo1.Visible := True;
        Memo1.Text :='Bu kutu a��k ve kapal� renk d�n���m� se�eneklerini sunar ve Renk ayar� aktifken g�z�k�r. ' ;





end;

procedure TForm2.FolderbuttonClick(Sender: TObject);
begin
          Memo1.Visible := True;
            Memo1.Text :='Kay�t Yeri : Bu buton ile resmin kaydedilece�i konum se�ilir.Kaydetmek i�in kaydet butonuna basman�z gereklidir.';
end;

procedure TForm2.FolderTextClick(Sender: TObject);
begin

              Memo1.Text := 'Kaydetme konumunu g�sterir.Kaydetmek i�in kaydet butonuna basman�z gereklidir.';

end;

procedure TForm2.FormClick(Sender: TObject);
begin
           Memo1.Clear;
           Memo1.Visible := False;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

          Memo1.Clear;
          Memo1.Visible := False;


end;

procedure TForm2.ResizeButtonClick(Sender: TObject);
begin

          Memo1.Visible := True;
          Memo1.Text := 'Width ve Height b�lmelerine girilen de�erler ile form �zerindeki resmi yeniden boyutland�r�r.';

end;

procedure TForm2.SaveButtonClick(Sender: TObject);
begin
            Memo1.Visible := True;
            Memo1.Text := 'Kaydet : Se�ilmi� olan kay�t yerine resmi kaydeder.';

end;

procedure TForm2.SelectButtonClick(Sender: TObject);
begin

           Memo1.Visible := True;
            Memo1.Text :='Dosya Se� = Bu buton ile resmin oldu�u konum se�ilir.';

end;

procedure TForm2.SelectedTextClick(Sender: TObject);
begin
           Memo1.Visible := True;
           Memo1.Text := 'Se�ilen dosyan�n konumunun g�sterildi�i aland�r.'

end;

end.
