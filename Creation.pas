// --------------------------- Sacroment ---------------------------
// Last Update :    27/11/2018
// Project Name:    Creation
//------------------------------------------------------------------
// Description :    The purpose of this project is to draw the user-defined '* .jpeg' files to
//                 the R-G-B primary colors and to make them fit to the desired size.
//                 This will make it easier to use the
//                 picture in RGB LEDs. Color options can be added according
//                 to the need and situation.
//------------------------------------------------------------------
unit Creation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, StdCtrls, ExtCtrls, Buttons,Jpeg, pngimage, GIFImg,ComCtrls,
  CustomizeDlg,Word2000;

type
  TForm1 = class(TForm)
    SelectButton: TBitBtn;
    ImageScreen: TImage;
    SelectedText: TEdit;
    FolderText: TEdit;
    Folderbutton: TBitBtn;
    SaveButton: TBitBtn;
    ColorConfig: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    ColorCheck: TCheckBox;
    AutosizeCheck: TCheckBox;
    ApplyButton: TBitBtn;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    PictureShape: TShape;
    PictureLabel: TLabel;
    NewWidth: TEdit;
    NewHeight: TEdit;
    ResizeButton: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    procedure ColorCheckClick(Sender: TObject);
    procedure AutosizeCheckClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FolderbuttonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ResizeButtonClick(Sender: TObject);




  private
    { Private declarations }

  public
    { Public declarations }
       SelectedFolder : string;      // Ýhtiyaç durumuna göre kullanabilmek için deðeri deðiþmeyecek olan deðiþkenleri public tanýmladým
       SaveFolder : string;
  end;

var
  Form1: TForm1;
  Picture  : TJPEGImage;    //Picture ve Bitmap resimleri farklý fonksiyonlar içerisinde kullanýlacaðýndan burada tanýmlandý.
  Bitmap   : TBitmap;

implementation

uses   Unit2;   // Talimatlar - Bilgilendirme kýsmý için Unit2 oluþturdum

{$R *.dfm}

procedure ResizeBitmap(Bitmap: TBitmap; const NewWidth, NewHeight: integer);  // Resim boyutunu deðiþtirme fonksiyonu
var
  buffer: TBitmap;
begin
  buffer := TBitmap.Create;
  try
    buffer.SetSize(NewWidth, NewHeight);
    buffer.Canvas.StretchDraw(Rect(0, 0, NewWidth, NewHeight), Bitmap);
    Bitmap.SetSize(NewWidth, NewHeight);
    Bitmap.Canvas.Draw(0, 0, buffer);
  finally
    buffer.Free;
  end;
end;

procedure TForm1.ApplyButtonClick(Sender: TObject);   // Uygula butonu kodlarý
var

   PicColor : TColor;  // Resim üzerinde deðiþiklik yapabilmek için TColor deðiþken tanýmlandý
   x : integer;        // Resim picture panelinde bitmap formda saklanýr bu sayede piksel olarak incelenmesi kolaylaþýr.
   y : integer;        // x ve y isimli 2 deðiþken tanýmlanarak resmin en ve boyu incelenecektir.
   R : byte;           // R-G-B Renklerinin 0-255 arasý deðerler alacaðýndan byte türünde tanýmlanmasý gerekir.
   G : byte;
   B : byte;
begin
               ProgressBar1.Min := 0;               // Progressbar min deðeri 0 ' çekildi
               ProgressBar1.Max := Bitmap.Height;   // Progressbar'ýn max deðeri bitmap resmine göre ayarlandý
               ProgressBar1.Position := 0;          // Baþlangýç min deðerine çekildi
               ProgressBar1.Step := 1;              // Adým çözünürlüðü ayarlandý.
              case ColorConfig.ItemIndex of

                0 : begin

                      Bitmap := TBitmap.Create;
                      Bitmap.Assign(ImageScreen.Picture.Bitmap);

                       for x  := 1 to 2*Bitmap.Height - 1 do         // Resmi bu döngü sayesinde taratýyoruz.
                       begin
                         for y := 1 to Bitmap.Width - 1 do
                          begin
                             PicColor := Bitmap.Canvas.Pixels[x,y];  // Resmin piksellerini incelediðimiz fonksiyon
                                R :=GetRValue(PicColor);             // Kýrmýzý renk degerlerini R deðiþkenine
                                G :=GetGValue(PicColor);             // Yeþil renk deðerlerini G deðiþkenine
                                B :=GetBValue(PicColor);             // Mavi renk deðerlerini B deðiþkenine atayýp koþullarý oluþturuyoruz.
                             if (((R < 200) and (G >= 200) and (B < 200)) or ((R >= 200) or (B >= 150) and (B <= 50)) or ((R > 155) and (G > 117) and (B = 0) and (G < 220)) or ((R = 0) and (G >= 200) and (B = 0)))
                                  then Bitmap.Canvas.Pixels[x,y] := RGB(0,255,0)          // Yeþil - Amber renkleri için yapýlan ayar.
                                else if (((R >= 90) and (G < 200) and (B >= 200)) or ((R >= 90) and (B >= 150) and (G < 50)) or ((R <= 55) and (B >= 250) and (G < 180)) or ((R = 0) and (G = 0) and (B >= 200)) or (((R <= 130) and (G >= 45) and (B >= 90)) and ((B <= 239) and (G <= 180))) or ((R <= 60) and (G >= 100) and (G <= 200) and (B >= 170)))
                                 then  Bitmap.Canvas.Pixels[x,y] := RGB(0,0,255)        // Mavi rengi için yapýlan ayar.
                                else if ((R >= 200) and (G < 200) and (B < 200) or ((R >= 200) and (G = 0) and (B = 0)))
                                 then Bitmap.Canvas.Pixels[x,y] := RGB(255,0,0)          // Kýrmýzý rengi için yapýlan ayar.
                                else if (((R >= 200) and (G >= 200) and (B >= 200)) or ((G >= 220) and (B >= 220)))
                                 then Bitmap.Canvas.Pixels[x,y] := RGB(255,255,255)     // Beyaz elde etmek için yapýlan ayar.
                                else if ((R <= 200) and (G <= 200) and (B <= 200))
                                 then Bitmap.Canvas.Pixels[x,y] := RGB(0,0,0);          // Siyah elde etmek için yapýlan ayar.
                         end;
                         ProgressBar1.StepIt;           // Progressbar 1 adým ileri gider her bir for için
                         ProgressBar1.Update;
                        end;

                   ImageScreen.Picture.Assign(Bitmap);              // Deðiþtirilen renkler Form üzerindeki ekrana yansýtýlýr.
                   Bitmap.Free;                                     // deðiþken sýfýrlanmadan oluþturulan nesne hafýzasý serbest býrakýlýr.


                   end;

             1 :   begin          // Koyu tonlardaki tek fark açýk tonlarýn yarýsý olarak kabul edilmesidir. Örnek olarak beyaz 255 tonlarda ise beyaz tonunun yarýsý beyazý koyulaþtýrýr.

                      Bitmap := TBitmap.Create;
                      Bitmap.Assign(ImageScreen.Picture.Bitmap);

                       for x  := 1 to 2*Bitmap.Height - 1 do
                       begin
                         for y := 1 to Bitmap.Width - 1 do
                          begin
                             PicColor := Bitmap.Canvas.Pixels[x,y];
                                R :=GetRValue(PicColor);
                                G :=GetGValue(PicColor);
                                B :=GetBValue(PicColor);
                         if (((R < 200) and (G >= 200) and (B < 200)) or ((R >= 200) or (B >= 150) and (B <= 50)) or ((R > 155) and (G > 117) and (B = 0) and (G < 220)) or ((R = 0) and (G >= 200) and (B = 0)))
                          then Bitmap.Canvas.Pixels[x,y] := RGB(0,128,0)
                         else if (((R >= 90) and (G < 200) and (B >= 200)) or ((R >= 90) and (B >= 150) and (G < 50)) or ((R <= 55) and (B >= 250) and (G < 180)) or ((R = 0) and (G = 0) and (B >= 200)) or (((R <= 130) and (G >= 45) and (B >= 90)) and ((B <= 239) and (G <= 180))) or ((R <= 60) and (G >= 100) and (G <= 200) and (B >= 170)))
                          then  Bitmap.Canvas.Pixels[x,y] := RGB(0,0,128)
                         else if ((R >= 200) and (G < 200) and (B < 200) or ((R >= 200) and (G = 0) and (B = 0)))
                          then Bitmap.Canvas.Pixels[x,y] := RGB(128,0,0)
                         else if (((R >= 200) and (G >= 200) and (B >= 200)) or ((G >= 220) and (B >= 220)))
                          then Bitmap.Canvas.Pixels[x,y] := RGB(128,128,128)
                         else if ((R <= 200) and (G <= 200) and (B <= 200))
                          then Bitmap.Canvas.Pixels[x,y] := RGB(0,0,0);
                         end;
                           ProgressBar1.StepIt;
                           ProgressBar1.Update;
                       end;
                   ImageScreen.Picture.Assign(Bitmap);
                   Bitmap.Free;
                      end;
                    end;


end;

procedure TForm1.AutosizeCheckClick(Sender: TObject);
begin

             ImageScreen.Stretch := AutosizeCheck.Checked;     //Sýðdýrma

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin

           Form2.Show;                                         // Talimat butonunun iþlevi




end;

procedure TForm1.ColorCheckClick(Sender: TObject);
var
sayac : integer;
begin
             if ColorCheck.Checked then
              ShowMessage('Dikkat :Program resim çözünürlüðü arttýkça yavaþlayacaktýr!');

             ColorConfig.Enabled := ColorCheck.Checked;  // Renk ayarý kýsmýný renk ayarý checkbox durumuna göre aktiflik pasiflik durumlarý oluþturdum
             ApplyButton.Enabled := ColorCheck.Checked;  // Uygula butonu içinde ayný durum söz konusu

end;

procedure TForm1.FolderbuttonClick(Sender: TObject);
begin

          SavePictureDialog1.Execute;                          // Dosya kayýt konumu
          SaveFolder := SavePictureDialog1.FileName;
          FolderText.Text := (SaveFolder);



end;

procedure TForm1.ResizeButtonClick(Sender: TObject);
var
 width  : integer;
 height : integer;
begin

         width := StrToInt(NewWidth.Text);                          // string to integer
         height:= StrToInt(NewHeight.Text);
         if (width < 4000) and (height < 4000) then                 // kýsýtlama yapýldý
         begin
         Bitmap := TBitmap.Create;
         Bitmap.Assign(ImageScreen.Picture.Bitmap);
         ResizeBitmap(Bitmap,width,height);
         ImageScreen.Picture.Assign(Bitmap);
         bitmap.Free;
         end else
          ShowMessage('Çok yüksek deðerler girildi!');


end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin

           ImageScreen.Picture.SaveToFile(SaveFolder);

end;

procedure TForm1.SelectButtonClick(Sender: TObject);
begin

       ProgressBar1.Position := 0;
                 PictureShape.Visible := False;
                 PictureLabel.Visible := False;
                 Bitmap := TBitmap.Create;                              // jpeg resmi incelemek için bitmap hale getirilir.
                 Picture:= TJPEGImage.Create;
                 OpenPictureDialog1.Execute();
                 SelectedFolder := OpenPictureDialog1.FileName;
                 Picture.LoadFromFile(SelectedFolder);
                 Picture.DIBNeeded;
                 Bitmap.Assign(Picture);
                 ImageScreen.Picture.Assign(Bitmap);
                 SelectedText.Text :=(SelectedFolder);




end;



end.
