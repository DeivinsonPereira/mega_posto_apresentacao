package main_activity.print.interfaces;

import android.content.Context;

public interface IPrint {
    void printNfce(String textHeader, String textBody, String qrCode, String text);
    void printTest();
}
