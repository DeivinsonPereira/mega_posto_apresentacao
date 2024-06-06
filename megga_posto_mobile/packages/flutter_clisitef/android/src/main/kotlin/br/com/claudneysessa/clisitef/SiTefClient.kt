package br.com.claudneysessa.clisitef

import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.Log

import br.com.softwareexpress.sitef.android.CliSiTef

open class SiTefClient(protected val cliSiTef: CliSiTef) {
    private var resultHandler: Result? = null

    fun setResultHandler(result: Result) {
        resultHandler = result
    }

    fun success(result: Any?) {
        if (resultHandler != null) {
            resultHandler!!.success(result);
        } else {
            Log.v("br.com.claudneysessa.clisitef.SiTefClient::success", result.toString())
        }
    }

    fun error(errorCode: String, errorMessage: String?, errorDetails: Any? = null) {
        if (resultHandler != null) {
            resultHandler!!.error(errorCode, errorMessage, errorDetails);
        } else {
            Log.v("br.com.claudneysessa.clisitef.SiTefClient::error::$errorCode", errorMessage.toString())
        }
    }

    fun notImplemented() {
        if (resultHandler != null) {
            resultHandler!!.notImplemented();
        } else {
            Log.v("br.com.claudneysessa.clisitef.SiTefClient::notImplemented", "")
        }
    }
}