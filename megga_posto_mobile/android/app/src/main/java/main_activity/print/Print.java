package main_activity.print;

import android.content.Context;
import android.util.Log;

import br.com.gertec.gedi.GEDI;
import br.com.gertec.gedi.enums.GEDI_PRNTR_e_BarCodeType;
import br.com.gertec.gedi.interfaces.IGEDI;
import br.com.gertec.gedi.interfaces.IPRNTR;
import main_activity.print.interfaces.IPrint;

public class Print implements IPrint {
    private Context context;
    private IGEDI iGedi = null;
    private IPRNTR iprntr = null;
    private final String CENTER = "CENTER";
    private final String LEFT = "LEFT";
    private final String RIGHT = "RIGHT";

    public Print(Context context) {
        this.context = context;
    }

    @Override
    public void printNfce( String textHeader, String textBody, String qrCode, String text) {
        try {
            iGedi = GEDI.getInstance(context);
            iprntr = iGedi.getPRNTR();

            printText(CENTER, textHeader);
            printText(LEFT, textBody);
            printQrCode(qrCode);
            printText(LEFT, text);

            iprntr.DrawBlankLine(50);

        } catch (Exception e){
            Log.d("MAIN_PRINT_TEXT", e.getMessage());
            e.printStackTrace();
        }
    }

    //Impressão de teste
    @Override
    public void printTest() {
        String testPrint = "\n\n\n\n ----- Teste de impressão ------ \n\n\n\n";
        printText(LEFT, testPrint);
    }

    // Imprime textos
    private void printText(String position, String text){
        tPRNTR.DrawString(context , iprntr, position, 20, 20,
                "NORMAL", true, false, false, 20, text);
    }

    //Imprime QrCode
    private void printQrCode(String urlQrCode){
        tPRNTR.DrawBarCode(iprntr, GEDI_PRNTR_e_BarCodeType.QR_CODE, 100, 100 , urlQrCode);
    }
}
