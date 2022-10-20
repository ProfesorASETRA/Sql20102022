USE Bahceisleri_iliskisiz_hatali
GO

-- hangi müşteri hangi siparişi almıştır
SELECT Siparişler.SiparişNo, Müşteriler.Adı, Müşteriler.Soyadı
FROM Siparişler
INNER JOIN Müşteriler ON Siparişler.MüşteriNO = Müşteriler.MüşteriNo

--Hangi müşteir hangi çalışanı almıştır
SELECT Siparişler.SiparişNo, 
Müşteriler.Adı+' '+ Müşteriler.Soyadı AS Müşteriler,
Çalışanlar.Adı AS ÇalışanAD, Çalışanlar.Soyadı AS ÇalışanSOYAD
FROM Siparişler
INNER JOIN Müşteriler ON Siparişler.MüşteriNO = Müşteriler.MüşteriNo
INNER JOIN Çalışanlar
ON Siparişler.ÇalışanNo = Çalışanlar.ÇalışanNo
--Hangi nakliyeci taşımıştır
SELECT Siparişler.SiparişNo, 
Müşteriler.Adı+' '+ Müşteriler.Soyadı AS Müşteriler,
Çalışanlar.Adı AS ÇalışanAD, Çalışanlar.Soyadı AS ÇalışanSOYAD,
Nakliyeciler.ŞİRKET AS KargoFirması
FROM Siparişler
INNER JOIN Müşteriler ON Siparişler.MüşteriNO = Müşteriler.MüşteriNo
INNER JOIN Çalışanlar
ON Siparişler.ÇalışanNo = Çalışanlar.ÇalışanNo
INNER JOIN Nakliyeciler ON Siparişler.Nakliyeci = Nakliyeciler.NAKLİYECİNO
--Hangi üründe kaç liraya satılmış, indirim uygulanmış mıdır?
SELECT Siparişler.SiparişNo, 
Müşteriler.Adı+' '+ Müşteriler.Soyadı AS Müşteriler,
Çalışanlar.Adı AS ÇalışanAD, Çalışanlar.Soyadı AS ÇalışanSOYAD,
Nakliyeciler.ŞİRKET AS KargoFirması,
SD.ÜrünNo, SD.BirimFiyat, SD.Miktar, SD.İndirim
FROM Siparişler
INNER JOIN Müşteriler 
ON Siparişler.MüşteriNO = Müşteriler.MüşteriNo
INNER JOIN Çalışanlar
ON Siparişler.ÇalışanNo = Çalışanlar.ÇalışanNo
INNER JOIN Nakliyeciler 
ON Siparişler.Nakliyeci = Nakliyeciler.NAKLİYECİNO
INNER JOIN [Sipariş Detayları] AS SD
ON Siparişler.SiparişNo = SD.SiparişNo 
--Ürünün Numarası yerine adını gösteriniz
SELECT Siparişler.SiparişNo, 
Müşteriler.Adı+' '+ Müşteriler.Soyadı AS Müşteriler,
Çalışanlar.Adı AS ÇalışanAD, Çalışanlar.Soyadı AS ÇalışanSOYAD,
Nakliyeciler.ŞİRKET AS KargoFirması,
SD.ÜrünNo,Ürünler.ÜrünAd, SD.BirimFiyat, SD.Miktar, SD.İndirim
FROM Siparişler
INNER JOIN Müşteriler 
ON Siparişler.MüşteriNO = Müşteriler.MüşteriNo
INNER JOIN Çalışanlar
ON Siparişler.ÇalışanNo = Çalışanlar.ÇalışanNo
INNER JOIN Nakliyeciler 
ON Siparişler.Nakliyeci = Nakliyeciler.NAKLİYECİNO
INNER JOIN [Sipariş Detayları] AS SD
ON Siparişler.SiparişNo = SD.SiparişNo
INNER JOIN Ürünler ON SD.ÜrünNo= Ürünler.ÜrünNo
-- Satıcı Firma Adını gösteriniz.
SELECT Siparişler.SiparişNo, 
Müşteriler.Adı+' '+ Müşteriler.Soyadı AS Müşteriler,
Çalışanlar.Adı AS ÇalışanAD, Çalışanlar.Soyadı AS ÇalışanSOYAD,
Nakliyeciler.ŞİRKET AS KargoFirması,
SD.ÜrünNo,Ürünler.ÜrünAd, SD.BirimFiyat, SD.Miktar, SD.İndirim, Ürünler.SatıcıFirmaNo,
Satıcılar.FirmaAdı AS TedarikçiFirma , Satıcılar.Kişi AS FirmaTemsilcisi, Satıcılar.Telefon AS FirmaTEL
FROM Siparişler
INNER JOIN Müşteriler 
ON Siparişler.MüşteriNO = Müşteriler.MüşteriNo
INNER JOIN Çalışanlar
ON Siparişler.ÇalışanNo = Çalışanlar.ÇalışanNo
INNER JOIN Nakliyeciler 
ON Siparişler.Nakliyeci = Nakliyeciler.NAKLİYECİNO
INNER JOIN [Sipariş Detayları] AS SD
ON Siparişler.SiparişNo = SD.SiparişNo
INNER JOIN Ürünler 
ON SD.ÜrünNo= Ürünler.ÜrünNo
INNER JOIN Satıcılar 
ON Ürünler.SatıcıFirmaNo = Satıcılar.SatıcıFirmaNo
--Ürünün Kategorisini yaz
SELECT Siparişler.SiparişNo, 
Müşteriler.Adı+' '+ Müşteriler.Soyadı AS Müşteriler,
Çalışanlar.Adı AS ÇalışanAD, Çalışanlar.Soyadı AS ÇalışanSOYAD,
Nakliyeciler.ŞİRKET AS KargoFirması,
SD.ÜrünNo,Ürünler.ÜrünAd, SD.BirimFiyat, SD.Miktar, SD.İndirim,
Ürünler.KategoriNo, Kategoriler.KategoriAdı, 
Ürünler.SatıcıFirmaNo,
Satıcılar.FirmaAdı AS TedarikçiFirma , Satıcılar.Kişi AS FirmaTemsilcisi, Satıcılar.Telefon AS FirmaTEL
FROM Siparişler
INNER JOIN Müşteriler 
ON Siparişler.MüşteriNO = Müşteriler.MüşteriNo
INNER JOIN Çalışanlar
ON Siparişler.ÇalışanNo = Çalışanlar.ÇalışanNo
INNER JOIN Nakliyeciler 
ON Siparişler.Nakliyeci = Nakliyeciler.NAKLİYECİNO
INNER JOIN [Sipariş Detayları] AS SD
ON Siparişler.SiparişNo = SD.SiparişNo
INNER JOIN Ürünler 
ON SD.ÜrünNo= Ürünler.ÜrünNo
INNER JOIN Satıcılar 
ON Ürünler.SatıcıFirmaNo = Satıcılar.SatıcıFirmaNo
INNER JOIN Kategoriler ON Ürünler.KategoriNo = Kategoriler.KategoriNo
