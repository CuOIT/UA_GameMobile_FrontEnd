package com.uamarketing.bootcamp;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.content.res.AssetManager;
import android.graphics.Insets;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.webkit.ConsoleMessage;
import android.webkit.MimeTypeMap;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;

public final class MainActivity extends Activity {
    private static final String LOG_TAG = "UaBootcampWebView";
    private static final String APP_HOST = "app.local";
    private static final String APP_URL = "https://" + APP_HOST + "/index.html";

    private WebView webView;

    @Override
    @SuppressLint("SetJavaScriptEnabled")
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        webView = new WebView(this);
        webView.setWebViewClient(new BundledAssetWebViewClient());
        webView.setBackgroundColor(0xFFF7F8FC);

        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(0xFFF7F8FC);
        root.addView(
            webView,
            new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT
            )
        );
        applySystemBarInsets(root, webView);

        if ((getApplicationInfo().flags & ApplicationInfo.FLAG_DEBUGGABLE) != 0) {
            WebView.setWebContentsDebuggingEnabled(true);
            webView.setWebChromeClient(new WebChromeClient() {
                @Override
                public boolean onConsoleMessage(ConsoleMessage message) {
                    Log.d(
                        LOG_TAG,
                        message.message() + " @" + message.sourceId() + ":" + message.lineNumber()
                    );
                    return true;
                }
            });
        }

        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setDatabaseEnabled(true);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_COMPATIBILITY_MODE);

        setContentView(root);
        root.post(root::requestApplyInsets);
        webView.loadUrl(APP_URL);
    }

    private void applySystemBarInsets(View root, View content) {
        root.setOnApplyWindowInsetsListener((target, windowInsets) -> {
            int top;
            int bottom;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                Insets systemBars = windowInsets.getInsets(WindowInsets.Type.systemBars());
                top = systemBars.top;
                bottom = systemBars.bottom;
            } else {
                top = windowInsets.getSystemWindowInsetTop();
                bottom = windowInsets.getSystemWindowInsetBottom();
            }

            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) content.getLayoutParams();
            if (params.topMargin != top || params.bottomMargin != bottom) {
                params.topMargin = top;
                params.bottomMargin = bottom;
                content.setLayoutParams(params);
            }

            return windowInsets;
        });
    }

    @Override
    public void onBackPressed() {
        if (webView != null && webView.canGoBack()) {
            webView.goBack();
            return;
        }

        super.onBackPressed();
    }

    @Override
    protected void onDestroy() {
        if (webView != null) {
            webView.destroy();
            webView = null;
        }

        super.onDestroy();
    }

    private final class BundledAssetWebViewClient extends WebViewClient {
        @Override
        public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
            Uri url = request.getUrl();
            if (!"https".equals(url.getScheme()) || !APP_HOST.equals(url.getHost())) {
                return super.shouldInterceptRequest(view, request);
            }

            return openBundledAsset(url.getPath());
        }
    }

    private WebResourceResponse openBundledAsset(String requestPath) {
        String relativePath = requestPath == null ? "" : requestPath.replaceFirst("^/+", "");
        if (relativePath.isEmpty()) relativePath = "index.html";
        if (relativePath.contains("..") || relativePath.contains("\\")) {
            return errorResponse(403, "Forbidden");
        }

        try {
            InputStream stream = getAssets().open("public/" + relativePath, AssetManager.ACCESS_STREAMING);
            String mimeType = mimeTypeFor(relativePath);
            String encoding = isTextMimeType(mimeType) ? "UTF-8" : null;
            Map<String, String> headers = Collections.singletonMap("Cache-Control", "no-store");
            return new WebResourceResponse(mimeType, encoding, 200, "OK", headers, stream);
        } catch (IOException error) {
            return errorResponse(404, "Not Found");
        }
    }

    private WebResourceResponse errorResponse(int statusCode, String reason) {
        return new WebResourceResponse(
            "text/plain",
            "UTF-8",
            statusCode,
            reason,
            Collections.emptyMap(),
            new ByteArrayInputStream(new byte[0])
        );
    }

    private String mimeTypeFor(String path) {
        String extension = MimeTypeMap.getFileExtensionFromUrl(path).toLowerCase(Locale.US);
        String detected = MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension);
        if (detected != null) return detected;
        if ("md".equals(extension)) return "text/markdown";
        if ("js".equals(extension)) return "text/javascript";
        if ("json".equals(extension)) return "application/json";
        if ("svg".equals(extension)) return "image/svg+xml";
        return "application/octet-stream";
    }

    private boolean isTextMimeType(String mimeType) {
        return mimeType.startsWith("text/")
            || "application/json".equals(mimeType)
            || "application/javascript".equals(mimeType)
            || "image/svg+xml".equals(mimeType);
    }
}
