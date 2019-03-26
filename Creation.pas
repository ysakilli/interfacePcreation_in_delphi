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
       SelectedFolder : string;      // �htiya� durumuna g�re kullanabilmek i�in de�eri de�i�meyecek olan de�i�kenleri public tan�mlad�m
       SaveFolder : string;
  end;

var
  Form1: TForm1;
  Picture  : TJPEGImage;    //Picture ve Bitmap resimleri farkl� fonksiyonlar i�erisinde kullan�laca��ndan burada tan�mland�.
  Bitmap   : TBitmap;

implementation

uses   Unit2;   // Talimatlar - Bilgilendirme k�sm� i�in Unit2 olu�turdum

{$R *.dfm}

procedure ResizeBitmap(Bitmap: TBitmap; const NewWidth, NewHeight: integer);  // Resim boyutunu de�i�tirme fonksiyonu
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

procedure TForm1.ApplyButtonClick(Sender: TObject);   // Uygula butonu kodlar�
var

   PicColor : TColor;  // Resim �zerinde de�i�iklik yapabilmek i�in TColor de�i�ken tan�mland�
   x : integer;        // Resim picture panelinde bitmap formda saklan�r bu sayede piksel olarak incelenmesi kolayla��r.
   y : integer;        // x ve y isimli 2 de�i�ken tan�mlanarak resmin en ve boyu incelenecektir.
   R : byte;           // R-G-B Renklerinin 0-255 aras� de�erler alaca��ndan byte t�r�nde tan�mlanmas� gerekir.
   G : byte;
   B : byte;
begin
               ProgressBar1.Min := 0;               // Progressbar min de�eri 0 ' �ekildi
               ProgressBar1.Max := Bitmap.Height;   // Progressbar'�n max de�eri bitmap resmine g�re ayarland�
               ProgressBar1.Position := 0;          // Ba�lang�� min de�erine �ekildi
               ProgressBar1.Step := 1;              // Ad�m ��z�n�rl��� ayarland�.
              case ColorConfig.ItemIndex of

                0 : begin

                      Bitmap := TBitmap.Create;
                      Bitmap.Assign(ImageScreen.Picture.Bitmap);

                       for x  := 1 to 2*Bitmap.Height - 1 do         // Resmi bu d�ng� sayesinde tarat�yoruz.
                       begin
                         for y := 1 to Bitmap.Width - 1 do
                          begin
                             PicColor := Bitmap.Canvas.Pixels[x,y];  // Resmin piksellerini inceledi�imiz fonksiyon
                                R :=GetRValue(PicColor);             // K�rm�z� renk degerlerini R de�i�kenine
                                G :=GetGValue(PicColor);             // Ye�il renk de�erlerini G de�i�kenine
                                B :=GetBValue(PicColor);             // Mavi renk de�erlerini B de�i�kenine atay�p ko�ullar� olu�turuyoruz.
                             if (((R < 200) and (G >= 200) and (B < 200)) or ((R >= 200) or (B >= 150) and (B <= 50)) or ((R > 155) and (G > 117) and (B = 0) and (G < 220)) or ((R = 0) and (G >= 200) and (B = 0)))
                                  then Bitmap.Canvas.Pixels[x,y] := RGB(0,255,0)          // Ye�il - Amber renkleri i�in yap�lan ayar.
                                else if (((R >= 90) and (G < 200) and (B >= 200)) or ((R >= 90) and (B >= 150) and (G < 50)) or ((R <= 55) and (B >= 250) and (G < 180)) or ((R = 0) and (G = 0) and (B >= 200)) or (((R <= 130) and (G >= 45) and (B >= 90)) and ((B <= 239) and (G <= 180))) or ((R <= 60) and (G >= 100) and (G <= 200) and (B >= 170)))
                                 then  Bitmap.Canvas.Pixels[x,y] := RGB(0,0,255)        // Mavi rengi i�in yap�lan ayar.
                                else if ((R >= 200) and (G < 200) and (B < 200) or ((R >= 200) and (G = 0) and (B = 0)))
                                 then Bitmap.Canvas.Pixels[x,y] := RGB(255,0,0)          // K�rm�z� rengi i�in yap�lan ayar.
                                else if (((R >= 200) and (G >= 200) and (B >= 200)) or ((G >= 220) and (B >= 220)))
                                 then Bitmap.Canvas.Pixels[x,y] := RGB(255,255,255)     // Beyaz elde etmek i�in yap�lan ayar.
                                else if ((R <= 200) and (G <= 200) and (B <= 200))
                                 then Bitmap.Canvas.Pixels[x,y] := RGB(0,0,0);          // Siyah elde etmek i�in yap�lan ayar.
                         end;
                         ProgressBar1.StepIt;           // Progressbar 1 ad�m ileri gider her bir for i�in
                         ProgressBar1.Update;
                        end;

                   ImageScreen.Picture.Assign(Bitmap);              // De�i�tirilen renkler Form �zerindeki ekrana yans�t�l�r.
                   Bitmap.Free;                                     // de�i�ken s�f�rlanmadan olu�turulan nesne haf�zas� serbest b�rak�l�r.


                   end;

             1 :   begin          // Koyu tonlardaki tek fark a��k tonlar�n yar�s� olarak kabul edilmesidir. �rnek olarak beyaz 255 tonlarda ise beyaz tonunun yar�s� beyaz� koyula�t�r�r.

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

             ImageScreen.Stretch := AutosizeCheck.Checked;     //S��d�rma

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin

           Form2.Show;                                         // Talimat butonunun i�levi




end;

procedure TForm1.ColorCheckClick(Sender: TObject);
var
sayac : integer;
begin
             if ColorCheck.Checked then
              ShowMessage('Dikkat :Program resim ��z�n�rl��� artt�k�a yava�layacakt�r!');

             ColorConfig.Enabled := ColorCheck.Checked;  // Renk ayar� k�sm�n� renk ayar� checkbox durumuna g�re aktiflik pasiflik durumlar� olu�turdum
             ApplyButton.Enabled := ColorCheck.Checked;  // Uygula butonu i�inde ayn� durum s�z konusu

end;

procedure TForm1.FolderbuttonClick(Sender: TObject);
begin

          SavePictureDialog1.Execute;                          // Dosya kay�t konumu
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
         if (width < 4000) and (height < 4000) then                 // k�s�tlama yap�ld�
         begin
         Bitmap := TBitmap.Create;
         Bitmap.Assign(ImageScreen.Picture.Bitmap);
         ResizeBitmap(Bitmap,width,height);
         ImageScreen.Picture.Assign(Bitmap);
         bitmap.Free;
         end else
          ShowMessage('�ok y�ksek de�erler girildi!');


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
                 Bitmap := TBitmap.Create;                              // jpeg resmi incelemek i�in bitmap hale getirilir.
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
