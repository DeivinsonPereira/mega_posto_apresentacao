package main_activity;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import main_activity.print.Print;

public class MainActivity extends FlutterActivity {

    private static final String METHOD_CHANNEL = "com.example.megga_posto_mobile/method_channel";
    private Print print = new Print(this);

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), METHOD_CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            switch (call.method) {
                                case "printNfce":
                                    String textHeader = call.argument("textHeader");
                                    String textBody = call.argument("textBody");
                                    String qrCode = call.argument("qrCode");
                                    String text = call.argument("text");
                                    print.printNfce(textHeader, textBody, qrCode, text);
                                    break;
                                case "printTest":
                                    print.printTest();
                                    break;
                                default:
                                    result.notImplemented();
                                    break;
                            }
                        }
                );
    }

}