abstract class IPrint {
  Future<void> printNfce(String text1, String text2, String qrCode, String text4);
  Future<void> printTef(String xml);
  Future<void> printQrCodeAndText();
  Future<void> printTeste();
}
