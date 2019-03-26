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
         Memo1.Text := 'Renkleri Uygula : Bu buton ile resim üzerine yapýlacak deðiþiklik ekranda gösterilir.'

end;

procedure TForm2.AutosizeCheckClick(Sender: TObject);
begin

            Memo1.Visible := True;
            Memo1.Text :='Sýðdýr : Ýþaretlendiðinde resmi alana sýðdýrýr.';


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
            Memo1.Text :='Renk Ayarý:Bu kutucuk iþaretlendiðinde resim üzerinde renk ayarý yapýlabilecektir.Resim renkleri ana renklere çekilecek ve örneklenmiþ bir resim elde edilecektir';



end;

procedure TForm2.ColorConfigClick(Sender: TObject);
begin

        Memo1.Visible := True;
        Memo1.Text :='Bu kutu açýk ve kapalý renk dönüþümü seçeneklerini sunar ve Renk ayarý aktifken gözükür. ' ;





end;

procedure TForm2.FolderbuttonClick(Sender: TObject);
begin
          Memo1.Visible := True;
            Memo1.Text :='Kayýt Yeri : Bu buton ile resmin kaydedileceði konum seçilir.Kaydetmek için kaydet butonuna basmanýz gereklidir.';
end;

procedure TForm2.FolderTextClick(Sender: TObject);
begin

              Memo1.Text := 'Kaydetme konumunu gösterir.Kaydetmek için kaydet butonuna basmanýz gereklidir.';

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
          Memo1.Text := 'Width ve Height bölmelerine girilen deðerler ile form üzerindeki resmi yeniden boyutlandýrýr.';

end;

procedure TForm2.SaveButtonClick(Sender: TObject);
begin
            Memo1.Visible := True;
            Memo1.Text := 'Kaydet : Seçilmiþ olan kayýt yerine resmi kaydeder.';

end;

procedure TForm2.SelectButtonClick(Sender: TObject);
begin

           Memo1.Visible := True;
            Memo1.Text :='Dosya Seç = Bu buton ile resmin olduðu konum seçilir.';

end;

procedure TForm2.SelectedTextClick(Sender: TObject);
begin
           Memo1.Visible := True;
           Memo1.Text := 'Seçilen dosyanýn konumunun gösterildiði alandýr.'

end;

end.
