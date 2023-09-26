package jp.pokepay.pokepay_sdk;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

import androidx.annotation.NonNull;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import jp.pokepay.pokepaylib.BankAPI.Account.CreateAccount;
import jp.pokepay.pokepaylib.BankAPI.Account.CreateAccountCpmToken;
import jp.pokepay.pokepaylib.BankAPI.Account.GetAccount;
import jp.pokepay.pokepaylib.BankAPI.Account.GetAccountBalances;
import jp.pokepay.pokepaylib.BankAPI.Account.GetAccountCouponDetail;
import jp.pokepay.pokepaylib.BankAPI.Account.GetAccountCoupons;
import jp.pokepay.pokepaylib.BankAPI.Account.GetAccountTransactions;
import jp.pokepay.pokepaylib.BankAPI.Account.PatchAccountCouponDetail;
import jp.pokepay.pokepaylib.BankAPI.Account.IdentifyIndividual;
import jp.pokepay.pokepaylib.BankAPI.BankRequestError;
import jp.pokepay.pokepaylib.BankAPI.Bill.CreateBill;
import jp.pokepay.pokepaylib.BankAPI.Bill.DeleteBill;
import jp.pokepay.pokepaylib.BankAPI.Bill.GetBill;
import jp.pokepay.pokepaylib.BankAPI.Bill.UpdateBill;
import jp.pokepay.pokepaylib.BankAPI.Cashtray.CreateCashtray;
import jp.pokepay.pokepaylib.BankAPI.Cashtray.DeleteCashtray;
import jp.pokepay.pokepaylib.BankAPI.Cashtray.GetCashtray;
import jp.pokepay.pokepaylib.BankAPI.Cashtray.GetCashtrayAttempts;
import jp.pokepay.pokepaylib.BankAPI.Cashtray.UpdateCashtray;
import jp.pokepay.pokepaylib.BankAPI.Check.CreateCheck;
import jp.pokepay.pokepaylib.BankAPI.Check.DeleteCheck;
import jp.pokepay.pokepaylib.BankAPI.Check.GetCheck;
import jp.pokepay.pokepaylib.BankAPI.Check.UpdateCheck;
import jp.pokepay.pokepaylib.BankAPI.CpmToken.GetCpmToken;
import jp.pokepay.pokepaylib.BankAPI.Account.PatchAccountCouponDetail;
import jp.pokepay.pokepaylib.BankAPI.PrivateMoney.GetPrivateMoney;
import jp.pokepay.pokepaylib.BankAPI.PrivateMoney.GetPrivateMoneyCoupons;
import jp.pokepay.pokepaylib.BankAPI.PrivateMoney.SearchPrivateMoneys;
import jp.pokepay.pokepaylib.BankAPI.Terminal.AddTerminalPublicKey;
import jp.pokepay.pokepaylib.BankAPI.Terminal.GetTerminal;
import jp.pokepay.pokepaylib.BankAPI.Terminal.UpdateTerminal;
import jp.pokepay.pokepaylib.BankAPI.Transaction.CancelTransaction;
import jp.pokepay.pokepaylib.BankAPI.Transaction.CreateTransactionWithBill;
import jp.pokepay.pokepaylib.BankAPI.Transaction.CreateTransactionWithCashtray;
import jp.pokepay.pokepaylib.BankAPI.Transaction.CreateTransactionWithCheck;
import jp.pokepay.pokepaylib.BankAPI.Transaction.CreateTransactionWithCpm;
import jp.pokepay.pokepaylib.BankAPI.Transaction.CreateTransactionWithJwt;
import jp.pokepay.pokepaylib.BankAPI.Transaction.GetTransaction;
import jp.pokepay.pokepaylib.BankAPI.Transaction.SendToAccount;
import jp.pokepay.pokepaylib.BankAPI.Transaction.SendToUser;
import jp.pokepay.pokepaylib.BankAPI.User.DeleteUserEmail;
import jp.pokepay.pokepaylib.BankAPI.User.GetUserAccounts;
import jp.pokepay.pokepaylib.BankAPI.User.GetUserTransactions;
import jp.pokepay.pokepaylib.BankAPI.User.RegisterUserEmail;
import jp.pokepay.pokepaylib.BankAPI.User.SendConfirmationEmail;
import jp.pokepay.pokepaylib.BankAPI.User.UpdateUser;
import jp.pokepay.pokepaylib.BankAPI.User.GetUserWithAuthFactors;
import jp.pokepay.pokepaylib.BankAPI.User.CreateBankPay;
import jp.pokepay.pokepaylib.BankAPI.User.GetBankPay;
import jp.pokepay.pokepaylib.BankAPI.User.BankPayTopUp;
import jp.pokepay.pokepaylib.Env;
import jp.pokepay.pokepaylib.JsonConverter;
import jp.pokepay.pokepaylib.MessagingAPI.GetMessage;
import jp.pokepay.pokepaylib.MessagingAPI.GetUnreadCount;
import jp.pokepay.pokepaylib.MessagingAPI.ListMessages;
import jp.pokepay.pokepaylib.MessagingAPI.ReceiveMessageAttachment;
import jp.pokepay.pokepaylib.MessagingAPI.SendMessage;
import jp.pokepay.pokepaylib.OAuthAPI.OAuthRequestError;
import jp.pokepay.pokepaylib.OAuthAPI.Token.ExchangeAuthCode;
import jp.pokepay.pokepaylib.OAuthAPI.Token.RefreshAccessToken;
import jp.pokepay.pokepaylib.Parameters.TransactionStrategy;
import jp.pokepay.pokepaylib.Parameters.Gender;
import jp.pokepay.pokepaylib.Parameters.Product;
import jp.pokepay.pokepaylib.Parameters.Metadata;
import jp.pokepay.pokepaylib.Pokepay;
import jp.pokepay.pokepaylib.Response;
import jp.pokepay.pokepaylib.Responses.AccessToken;
import jp.pokepay.pokepaylib.Responses.Account;
import jp.pokepay.pokepaylib.Responses.AccountCpmToken;
import jp.pokepay.pokepaylib.Responses.Bill;
import jp.pokepay.pokepaylib.Responses.Cashtray;
import jp.pokepay.pokepaylib.Responses.CashtrayAttempts;
import jp.pokepay.pokepaylib.Responses.Check;
import jp.pokepay.pokepaylib.Responses.CouponDetail;
import jp.pokepay.pokepaylib.Responses.JwtResult;
import jp.pokepay.pokepaylib.Responses.Message;
import jp.pokepay.pokepaylib.Responses.MessageAttachment;
import jp.pokepay.pokepaylib.Responses.MessageUnreadCount;
import jp.pokepay.pokepaylib.Responses.NoContent;
import jp.pokepay.pokepaylib.Responses.PaginatedAccountBalances;
import jp.pokepay.pokepaylib.Responses.PaginatedAccounts;
import jp.pokepay.pokepaylib.Responses.PaginatedCoupons;
import jp.pokepay.pokepaylib.Responses.PaginatedMessages;
import jp.pokepay.pokepaylib.Responses.PaginatedPrivateMoneys;
import jp.pokepay.pokepaylib.Responses.PaginatedTransactions;
import jp.pokepay.pokepaylib.Responses.PrivateMoney;
import jp.pokepay.pokepaylib.Responses.ServerKey;
import jp.pokepay.pokepaylib.Responses.Terminal;
import jp.pokepay.pokepaylib.Responses.User;
import jp.pokepay.pokepaylib.Responses.UserTransaction;
import jp.pokepay.pokepaylib.Responses.UserWithAuthFactors;
import jp.pokepay.pokepaylib.Responses.BankPay;
import jp.pokepay.pokepaylib.Responses.BankPayRedirectUrl;
import jp.pokepay.pokepaylib.Responses.IdentificationResult;
import jp.pokepay.pokepaylib.TokenInfo;

/** PokepaySdkPlugin */
public class PokepaySdkPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context context;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "jp.pokepay/pokepay_sdk");
        channel.setMethodCallHandler(this);
        context = flutterPluginBinding.getApplicationContext();
    }

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "jp.pokepay/pokepay_sdk");
        channel.setMethodCallHandler(new PokepaySdkPlugin());
    }

    static private class MethodCallAsyncTask extends AsyncTask<String, Void, MethodCallAsyncTask.TaskResult> {

        private static class TaskResult {
            private final Exception error;
            private final String data;
            TaskResult(Exception e, String d) {
                error = e;
                data = d;
            }
        }

        private final MethodCall call;
        private final Result result;
        private final Context context;

        private MethodCallAsyncTask(MethodCall call, Result result,Context context) {
            this.call = call;
            this.result = result;
            this.context = context;
        }

        private Env flutterEnvToSDKEnv(int env) {
            switch (env) {
                case 0: return Env.PRODUCTION;
                case 1: return Env.SANDBOX;
                case 2: return Env.QA;
                case 3: return Env.DEVELOPMENT;
                default: return Env.DEVELOPMENT;
            }
        }

        private TransactionStrategy parseTxStrategy(String strategy){
            switch (strategy){
                case "money-only": return TransactionStrategy.MONEY_ONLY;
                case "point-preferred": return TransactionStrategy.POINT_PREFERRED;
                default: return TransactionStrategy.POINT_PREFERRED;
            }
        }

        private Gender parseGender(String gender){
            if (gender == null) return null;

            switch (gender){
                case "male": return Gender.MALE;
                case "female": return Gender.FEMALE;
                case "other": return Gender.OTHER;
                default: return null;
            }
        }

        private Date stringToDate(String s) {
            if (s == null) return null;
            try {
                return Response.formatter.parse(s);
            } catch (Exception e) {
                return null;
            }
        }

        private TaskResult invokeMethod()  {
            try {
                switch (call.method) {
                    case "addTerminalPublicKey": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String key = call.argument("key");
                        AddTerminalPublicKey req = new AddTerminalPublicKey(key);
                        Pokepay.setEnv(env);
                        ServerKey res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "cancelUserTransaction": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        CancelTransaction req = new CancelTransaction(id);
                        Pokepay.setEnv(env);
                        NoContent res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createAccount": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String name = call.argument("name");
                        String privateMoneyId = call.argument("privateMoneyId");
                        String externalId = call.argument("externalId");
                        CreateAccount req = new CreateAccount(name, privateMoneyId, externalId);
                        Pokepay.setEnv(env);
                        Account res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createAccountCpmToken": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        CreateAccountCpmToken req;
                        String accessToken = call.argument("accessToken");
                        String accountId = call.argument("accountId");
                        int scopes = call.argument("scopes");
                        Map<String, String> metadataMap = call.argument("metadata");
                        if(call.hasArgument("expiresIn") && call.argument("expiresIn") != null){
                            int expiresIn = call.argument("expiresIn");
                            req = new CreateAccountCpmToken(accountId, scopes, expiresIn, new Metadata(metadataMap));
                        }else{
                            req = new CreateAccountCpmToken(accountId,scopes,new Metadata(metadataMap));
                        }
                        Pokepay.setEnv(env);
                        AccountCpmToken res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createBill": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        CreateBill req;
                        String accessToken = call.argument("accessToken");
                        String accountId = call.argument("accountId");
                        String description = call.argument("description");
                        String productsString = call.argument("products");
                        final ObjectMapper mapper = JsonConverter.createObjectMapper();
                        Product[] products = mapper.readValue(productsString,  Product[].class);
                        if (call.hasArgument("amount") && call.argument("amount") != null){
                            double amount = call.argument("amount");
                            req = new CreateBill(amount, accountId, description, products);
                        }else{
                            req = new CreateBill(accountId, description, products);
                        }
                        Pokepay.setEnv(env);
                        Bill res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createCashtray": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        CreateCashtray req;
                        String accessToken = call.argument("accessToken");
                        double amount = call.argument("amount");
                        String description = call.argument("description");
                        String productsString = call.argument("products");
                        final ObjectMapper mapper = JsonConverter.createObjectMapper();
                        Product[] products = mapper.readValue(productsString,  Product[].class);
                        if(call.hasArgument("expiresIn") && call.argument("expiresIn") != null){
                            int expiresIn = call.argument("expiresIn");
                            req = new CreateCashtray(amount, description, expiresIn, products);
                        }else{
                            req = new CreateCashtray(amount, description, products);
                        }
                        Pokepay.setEnv(env);
                        Cashtray res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createCheck": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        double amount = call.argument("amount");
                        String accountId = call.argument("accountId");
                        String description = call.argument("description");
                        String dateStr = call.argument("expires_at");
                        CreateCheck req = new CreateCheck(amount, accountId, description,stringToDate(dateStr));
                        Pokepay.setEnv(env);
                        Check res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }

                    case "createToken": {
                        Env env = flutterEnvToSDKEnv((int) call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        Boolean isMerchant = call.argument("isMerchant");
                        double amount = call.argument("amount");
                        String description = call.argument("description");
                        String accountId = call.argument("accountId");
                        Product[] products = call.argument("products");
                        String privateMoneyId = call.argument("privateMoneyId");
                        Pokepay.setEnv(env);
                        Pokepay.Client client;

                        if (privateMoneyId != null){
                            client = Pokepay.Client.withCustomDomain(accessToken,this.context, isMerchant, privateMoneyId);
                        }else{
                            client = new Pokepay.Client(accessToken, null, isMerchant);
                        }
                        String result;
                        Integer expiresIn = call.argument("expiresIn");
                        if (expiresIn!= null){
                            result = client.createToken(amount, description, expiresIn.intValue(), accountId, products);
                        }else {
                            result = client.createToken(amount,description,null,accountId,products);
                        }

                        return new TaskResult(null, result);
                    }
                    case "createUserTransactionWithBill": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        CreateTransactionWithBill req;
                        String accessToken = call.argument("accessToken");
                        String billId = call.argument("billId");
                        String accountId = call.argument("accountId");
                        String couponId = call.argument("couponId");
                        String rawStrategy = call.argument("tx_strategy");
                        TransactionStrategy txStrategy = parseTxStrategy(rawStrategy);
                        Double amount = call.argument("amount");
                        String rawRequestId = call.argument("requestId");
                        UUID requestId = UUID.fromString(rawRequestId);
                        if (amount != null){
                            req = new CreateTransactionWithBill(billId, accountId, amount, couponId, txStrategy, requestId);
                        }else{
                            req = new CreateTransactionWithBill(billId, accountId, 0, couponId,txStrategy, requestId);
                        }

                        Pokepay.setEnv(env);
                        UserTransaction res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createUserTransactionWithCashtray": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String cashtrayId = call.argument("cashtrayId");
                        String accountId = call.argument("accountId");
                        String couponId = call.argument("couponId");
                        String rawStrategy = call.argument("tx_strategy");
                        String rawRequestId = call.argument("requestId");
                        UUID requestId = UUID.fromString(rawRequestId);
                        TransactionStrategy txStrategy = parseTxStrategy(rawStrategy);
                        CreateTransactionWithCashtray req = new CreateTransactionWithCashtray(cashtrayId, accountId, couponId,txStrategy,requestId);
                        Pokepay.setEnv(env);
                        UserTransaction res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createUserTransactionWithCheck": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String checkId = call.argument("checkId");
                        String accountId = call.argument("accountId");
                        String rawRequestId = call.argument("requestId");
                        UUID requestId = UUID.fromString(rawRequestId);
                        CreateTransactionWithCheck req = new CreateTransactionWithCheck(checkId, accountId, requestId);
                        Pokepay.setEnv(env);
                        UserTransaction res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createUserTransactionWithCpm": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String cpmToken = call.argument("cpmToken");
                        String accountId = call.argument("accountId");
                        double amount = call.argument("amount");
                        String productsString = call.argument("products");
                        final ObjectMapper mapper = JsonConverter.createObjectMapper();
                        Product[] products = mapper.readValue(productsString,  Product[].class);
                        String rawRequestId = call.argument("requestId");
                        UUID requestId = UUID.fromString(rawRequestId);
                        CreateTransactionWithCpm req = new CreateTransactionWithCpm(cpmToken, accountId, amount, products, requestId);
                        Pokepay.setEnv(env);
                        UserTransaction res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createUserTransactionWithJwt": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String data = call.argument("data");
                        String accountId = call.argument("accountId");
                        String couponId = call.argument("couponId");
                        String rawStrategy = call.argument("tx_strategy");
                        TransactionStrategy txStrategy = parseTxStrategy(rawStrategy);
                        CreateTransactionWithJwt req = new CreateTransactionWithJwt(accountId, data, couponId,txStrategy);
                        Pokepay.setEnv(env);
                        JwtResult res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "deleteBill": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        DeleteBill req = new DeleteBill(id);
                        Pokepay.setEnv(env);
                        NoContent res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "deleteCashtray": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        DeleteCashtray req = new DeleteCashtray(id);
                        Pokepay.setEnv(env);
                        NoContent res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "deleteCheck": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        DeleteCheck req = new DeleteCheck(id);
                        Pokepay.setEnv(env);
                        NoContent res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "deleteUserEmail": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String email = call.argument("email");
                        DeleteUserEmail req = new DeleteUserEmail(id, email);
                        Pokepay.setEnv(env);
                        NoContent res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "exchangeAuthCode": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String code = call.argument("code");
                        String clientId = call.argument("clientId");
                        String clientSecret = call.argument("clientSecret");
                        ExchangeAuthCode req = new ExchangeAuthCode(code, clientId, clientSecret);
                        Pokepay.setEnv(env);
                        AccessToken res = req.send();
                        return new TaskResult(null, res.toString());
                    }
                    case "getAccount": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        GetAccount req = new GetAccount(id);
                        Pokepay.setEnv(env);
                        Account res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getAccountBalances": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        GetAccountBalances req;
                        String id = call.argument("id");
                        String before = call.argument("before");
                        String after = call.argument("after");
                        Integer perPage = call.argument("perPage");
                        if(perPage != null){
                            req = new GetAccountBalances(id, before, after, perPage);
                        }else{
                            req = new GetAccountBalances(id, before, after);
                        }
                        Pokepay.setEnv(env);
                        PaginatedAccountBalances res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getAccountCoupons":{
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        GetAccountCoupons req;
                        String accessToken = call.argument("accessToken");
                        String accountId = call.argument("accountId");
                        boolean isAvailable = call.argument("isAvailable");
                        String before = call.argument("before");
                        String after = call.argument("after");
                        Integer perPage = call.argument("perPage");
                        if(perPage != null){
                            req = new GetAccountCoupons(accountId,isAvailable,before,after,perPage);
                        }else{
                            req = new GetAccountCoupons(accountId,isAvailable,before,after);
                        }
                        Pokepay.setEnv(env);
                        PaginatedCoupons res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getAccountCouponDetail":{
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        Pokepay.setEnv(env);
                        String accountId = call.argument("accountId");
                        String couponId = call.argument("couponId");
                        GetAccountCouponDetail req = new GetAccountCouponDetail(accountId,couponId);
                        CouponDetail res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getAccountTransactions": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        GetAccountTransactions req;
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String before = call.argument("before");
                        String after = call.argument("after");
                        Integer perPage = call.argument("perPage");
                        if(perPage != null){
                            req = new GetAccountTransactions(id, before, after, perPage);
                        }else {
                            req = new GetAccountTransactions(id, before, after);
                        }
                        Pokepay.setEnv(env);
                        PaginatedTransactions res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getBill": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        GetBill req = new GetBill(id);
                        Pokepay.setEnv(env);
                        Bill res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getCashtray": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        GetCashtray req = new GetCashtray(id);
                        Pokepay.setEnv(env);
                        Cashtray res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getCashtrayAttempts": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        GetCashtrayAttempts req = new GetCashtrayAttempts(id);
                        Pokepay.setEnv(env);
                        CashtrayAttempts res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getCheck": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        GetCheck req = new GetCheck(id);
                        Pokepay.setEnv(env);
                        Check res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getCpmToken": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String cpmToken = call.argument("cpmToken");
                        GetCpmToken req = new GetCpmToken(cpmToken);
                        Pokepay.setEnv(env);
                        AccountCpmToken res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getMessage": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        GetMessage req = new GetMessage(id);
                        Pokepay.setEnv(env);
                        Message res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getMessageUnreadCount": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        GetUnreadCount req = new GetUnreadCount();
                        Pokepay.setEnv(env);
                        MessageUnreadCount res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getPrivateMoneyCoupons" :{
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        GetPrivateMoneyCoupons req;
                        String accessToken = call.argument("accessToken");
                        String privateMoneyId = call.argument("privateMoneyId");
                        String before = call.argument("before");
                        String after = call.argument("after");
                        Integer perPage = call.argument("perPage");
                        if(perPage != null ){
                            req = new GetPrivateMoneyCoupons(privateMoneyId,before,after,perPage);
                        }else{
                            req = new GetPrivateMoneyCoupons(privateMoneyId,before,after);
                        }
                        Pokepay.setEnv(env);
                        PaginatedCoupons res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getTerminal": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        GetTerminal req = new GetTerminal();
                        Pokepay.setEnv(env);
                        Terminal res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getUserAccounts": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        GetUserAccounts req;
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String before = call.argument("before");
                        String after = call.argument("after");
                        Integer perPage = call.argument("perPage");
                        if(perPage != null){
                            req = new GetUserAccounts(id, before, after, perPage);
                        }else {
                            req = new GetUserAccounts(id, before, after);
                        }
                        Pokepay.setEnv(env);
                        PaginatedAccounts res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getUserTransaction": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        GetTransaction req = new GetTransaction(id);
                        Pokepay.setEnv(env);
                        UserTransaction res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getUserTransactions": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        GetUserTransactions req;
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String before = call.argument("before");
                        String after = call.argument("after");
                        Integer perPage = call.argument("perPage");
                        if (perPage != null){
                            req = new GetUserTransactions(id, before, after, perPage);
                        }else {
                            req = new GetUserTransactions(id, before, after);
                        }
                        Pokepay.setEnv(env);
                        PaginatedTransactions res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "listMessages": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        ListMessages req;
                        String accessToken = call.argument("accessToken");
                        String before = call.argument("before");
                        String after = call.argument("after");
                        Integer perPage = call.argument("perPage");
                        if (perPage != null){
                            req = new ListMessages(before, after, perPage);
                        }else {
                            req = new ListMessages(before, after);
                        }
                        Pokepay.setEnv(env);
                        PaginatedMessages res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "patchAccountCouponDetail": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        PatchAccountCouponDetail req;
                        String accessToken = call.argument("accessToken");
                        Pokepay.setEnv(env);
                        String accountId = call.argument("accountId");
                        String couponId = call.argument("couponId");
                        String code = call.argument("code");
                        Boolean isReceived = call.argument("is_received");
                        if (isReceived != null){
                            req = new PatchAccountCouponDetail(accountId,couponId,isReceived, code);
                        }else{
                            req = new PatchAccountCouponDetail(accountId,couponId, code);
                        }
                        CouponDetail res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "receiveMessageAttachment": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        ReceiveMessageAttachment req = new ReceiveMessageAttachment(id);
                        Pokepay.setEnv(env);
                        MessageAttachment res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "refreshAccessToken": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String refreshToken = call.argument("refreshToken");
                        String clientId = call.argument("clientId");
                        String clientSecret = call.argument("clientSecret");
                        RefreshAccessToken req = new RefreshAccessToken(refreshToken, clientId, clientSecret);
                        Pokepay.setEnv(env);
                        AccessToken res = req.send();
                        return new TaskResult(null, res.toString());
                    }
                    case "registerUserEmail": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String token = call.argument("token");
                        RegisterUserEmail req = new RegisterUserEmail(token);
                        Pokepay.setEnv(env);
                        NoContent res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "scanToken": {
                        Env env = flutterEnvToSDKEnv((int) call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String scanToken = call.argument("scanToken");
                        String accountId = call.argument("accountId");
                        Product[] products = call.argument("products");
                        String couponId = call.argument("couponId");
                        Pokepay.setEnv(env);
                        String rawStrategy = call.argument("tx_strategy");
                        TransactionStrategy txStrategy = parseTxStrategy(rawStrategy);
                        String privateMoneyId = call.argument("privateMoneyId");
                        String rawRequestId = call.argument("requestId");
                        UUID requestId = UUID.fromString(rawRequestId);
                        Pokepay.Client client;
                        UserTransaction userTransaction;

                        if (privateMoneyId != null){
                            client = Pokepay.Client.withCustomDomain(accessToken,this.context, false, privateMoneyId);
                        }else{
                            client = new Pokepay.Client(accessToken, this.context);
                        }

                        Double amount = call.argument("amount");
                        if (amount != null){
                            userTransaction = client.scanToken(scanToken,amount,accountId,products, couponId,txStrategy, requestId);
                        }else {
                            userTransaction = client.scanToken(scanToken,0.0,accountId,products, couponId,txStrategy, requestId);
                        }
                        return new TaskResult(null, userTransaction.toString());
                    }
                    case "searchPrivateMoneys": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String name = call.argument("name");
                        boolean includeExclusive = false;
                        if (call.hasArgument("includeExclusive") && call.argument("includeExclusive") != null){
                            includeExclusive = call.argument("includeExclusive");
                        }
                        String before = call.argument("before");
                        String after = call.argument("after");
                        int perPage = 30;
                        if (call.hasArgument("perPage") && call.argument("perPage") != null){
                            perPage = call.argument("perPage");
                        }
                        SearchPrivateMoneys req = new SearchPrivateMoneys(name, includeExclusive, before, after, perPage);
                        Pokepay.setEnv(env);
                        PaginatedPrivateMoneys res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getPrivateMoney":{
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String privateMoneyId = call.argument("privateMoneyId");
                        Pokepay.setEnv(env);
                        PrivateMoney privateMoney =  new GetPrivateMoney(privateMoneyId).send(accessToken);
                        return new TaskResult(null, privateMoney.toString());
                    }
                    case "sendConfirmationEmail": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String email = call.argument("email");
                        SendConfirmationEmail req = new SendConfirmationEmail(id, email);
                        Pokepay.setEnv(env);
                        NoContent res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "sendMessage": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        SendMessage req;
                        String accessToken = call.argument("accessToken");
                        String toUserId = call.argument("toUserId");
                        String subject = call.argument("subject");
                        String body = call.argument("body");
                        String fromAccountId = call.argument("fromAccountId");
                        String senderStr = call.argument("sender");
                        ObjectMapper mapper = JsonConverter.createObjectMapper();
                        User sender = mapper.readValue(senderStr,User.class);
                        Double amount = call.argument("amount");
                        if(amount != null){
                            req = new SendMessage(toUserId, amount.doubleValue(), subject, body,sender, fromAccountId);
                        }else{
                            req = new SendMessage(toUserId, subject, body,sender, fromAccountId);
                        }
                        Pokepay.setEnv(env);
                        Message res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "sendToAccount": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String accountId = call.argument("accountId");
                        double amount = call.argument("amount");
                        String receiverTerminalId = call.argument("receiverTerminalId");
                        String senderAccountId = call.argument("senderAccountId");
                        String description = call.argument("description");
                        SendToAccount req = new SendToAccount(accountId, amount, receiverTerminalId, senderAccountId, description);
                        Pokepay.setEnv(env);
                        UserTransaction res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "sendToUser": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String userId = call.argument("userId");
                        double amount = call.argument("amount");
                        String receiverTerminalId = call.argument("receiverTerminalId");
                        String senderAccountId = call.argument("senderAccountId");
                        String description = call.argument("description");
                        SendToUser req = new SendToUser(userId, amount, receiverTerminalId, senderAccountId, description);
                        Pokepay.setEnv(env);
                        UserTransaction res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "updateBill": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        UpdateBill req;
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String description = call.argument("description");
                        Double amount = call.argument("amount");
                        if(amount != null){
                            req = new UpdateBill(id, amount, description);
                        }else {
                            req = new UpdateBill(id, description);
                        }
                        Pokepay.setEnv(env);
                        Bill res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "updateCashtray": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        UpdateCashtray req;
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        double amount = call.argument("amount");
                        String description = call.argument("description");
                        Integer expiresIn = call.argument("expiresIn");
                        if(expiresIn != null){
                            req = new UpdateCashtray(id, amount, description, expiresIn.intValue());
                        }else{
                            req = new UpdateCashtray(id, description, amount);
                        }
                        Pokepay.setEnv(env);
                        Cashtray res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "updateCheck": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        double amount = call.argument("amount");
                        String description = call.argument("description");
                        UpdateCheck req = new UpdateCheck(id, amount, description);
                        Pokepay.setEnv(env);
                        Check res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "updateTerminal": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String accountId = call.argument("accountId");
                        String name = call.argument("name");
                        String pushToken = call.argument("pushToken");
                        UpdateTerminal req = new UpdateTerminal(accountId, name, pushToken);
                        Pokepay.setEnv(env);
                        Terminal res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "updateUser": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String name = call.argument("name");
                        UpdateUser req = new UpdateUser(id, name);
                        Pokepay.setEnv(env);
                        User res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getUserWithAuthFactors": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String userId = call.argument("userId");
                        GetUserWithAuthFactors req = new GetUserWithAuthFactors(userId);
                        Pokepay.setEnv(env);
                        UserWithAuthFactors res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "createBankPay": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String callbackUrl = call.argument("callbackUrl");
                        String privateMoneyId = call.argument("privateMoneyId");
                        CreateBankPay req = new CreateBankPay(id, callbackUrl, privateMoneyId);
                        Pokepay.setEnv(env);
                        BankPayRedirectUrl res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "getBankPay": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String privateMoneyId = call.argument("privateMoneyId");
                        GetBankPay req = new GetBankPay(id, privateMoneyId);
                        Pokepay.setEnv(env);
                        BankPay[] res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    case "bankpayTopUp": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String id = call.argument("id");
                        String accountId = call.argument("accountId");
                        String bankId = call.argument("bankId");
                        String amount = call.argument("amount");
                        BankPayTopUp req = new BankPayTopUp(id, accountId, bankId, amount);
                        Pokepay.setEnv(env);
                        UserTransaction res = req.send(accessToken);
                      return new TaskResult(null, res.toString());
                    case "identifyIndividual": {
                        Env env = flutterEnvToSDKEnv((int)call.argument("env"));
                        String accessToken = call.argument("accessToken");
                        String accountId = call.argument("accountId");
                        String signature = call.argument("signature");
                        String signingCert = call.argument("signingCert");
                        String expectedHash = call.argument("expectedHash");
                        String name = call.argument("name");
                        String rawGender = call.argument("gender");
                        Gender gender = parseGender(rawGender);
                        String address = call.argument("address");
                        String dateOfBirth = call.argument("dateOfBirth");

                        IdentifyIndividual req = new IdentifyIndividual(accountId, signature, signingCert, expectedHash, name, gender, address, dateOfBirth);
                        Pokepay.setEnv(env);
                        IdentificationResult res = req.send(accessToken);
                        return new TaskResult(null, res.toString());
                    }
                    default:
                        throw new java.lang.UnsupportedOperationException();
                }
            } catch (Exception e) {
                return new TaskResult(e, null);
            }
        }

        @Override
        protected TaskResult doInBackground(String... args) {
            return invokeMethod();
        }
        @Override
        protected void onPostExecute(TaskResult res) {
            if (res.error != null) {
                if (res.error instanceof java.lang.UnsupportedOperationException) {
                    result.notImplemented();
                } else if (res.error instanceof BankRequestError) {
                    BankRequestError err = (BankRequestError) res.error;
                    String errorMessage = "{\"status_code\":" + err.statusCode +",\"error\":" + err.error.toString() + "}";
                    result.error("APIRequestError", errorMessage, null);
                } else if (res.error instanceof OAuthRequestError) {
                    OAuthRequestError err = (OAuthRequestError) res.error;
                    String errorMessage = "{\"status_code\":" + err.statusCode +",\"error\":" + err.error.toString() + "}";
                    result.error("OAuthRequestError", errorMessage, null);
                } else {
                    Writer writer = new StringWriter();
                    res.error.printStackTrace(new PrintWriter(writer));
                    String message = res.error.toString() + writer.toString();
                    JSONObject jsonObj = new JSONObject();
                    try {
                        jsonObj.put("message", message);
                    } catch (JSONException e) {
                        Log.e("pokepay_sdk", e.getMessage());
                    }
                    String errorMessage = jsonObj.toString();
                    result.error("ProcessingError", errorMessage, null);
                }
            } else {
                result.success(res.data);
            }
        }
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        new MethodCallAsyncTask(call, result,context).execute("");
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
