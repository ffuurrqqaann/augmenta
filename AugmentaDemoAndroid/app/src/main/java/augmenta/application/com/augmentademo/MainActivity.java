package augmenta.application.com.augmentademo;

import android.app.ListActivity;
import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

import augmenta.application.com.augmentademo.adapters.ProductListAdapter;
import augmenta.application.com.augmentademo.config.Config;
import augmenta.application.com.augmentademo.handlers.HttpHandler;
import augmenta.application.com.augmentademo.models.Product;


public class MainActivity extends ListActivity {

    private String TAG = MainActivity.class.getSimpleName();

    private ProgressDialog pDialog;
    private ListView lv;
    private Button reloadBtn;
    private ProductListAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        adapter = new ProductListAdapter(this);
        setListAdapter(adapter);

        new GetProducts(adapter).execute();

        reloadBtn = (Button) findViewById(R.id.reloadBtn);
        reloadBtn.setOnClickListener( new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new GetProducts(adapter).execute();
            }
        });

    }


    /**
     * Async task class to get json by making HTTP call
     */
    private class GetProducts extends AsyncTask<Void, Void, ArrayList<Product>> {

        private final ProductListAdapter pAdapter;

        public GetProducts(ProductListAdapter pAdapter) {
            this.pAdapter = pAdapter;
        }

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            // Showing progress dialog
            pDialog = new ProgressDialog(MainActivity.this);
            pDialog.setMessage("Please wait...");
            pDialog.setCancelable(false);
            pDialog.show();

        }

        @Override
        protected ArrayList<Product> doInBackground(Void... arg0) {

            HttpHandler sh = new HttpHandler();

            // Making a request to url and getting response
            String jsonStr = sh.makeServiceCall(Config.PRODUCT_LIST_URL);

            Log.e(TAG, "Response from url: " + jsonStr);

            ArrayList<Product> productList = new ArrayList<>();

            if (jsonStr != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStr);

                    // Getting JSON Array node
                    JSONArray products = jsonObj.getJSONArray("products");

                    // looping through All Products
                    for (int i = 0; i < products.length(); i++) {
                        JSONObject p = products.getJSONObject(i);

                        String name = p.getString("name");
                        String description = p.getString("description");

                        Product product = new Product();
                        product.setName(name);
                        product.setDescription(description);

                        productList.add(product);
                    }
                } catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG)
                                    .show();
                        }
                    });

                }
            } else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                                "Couldn't get json from server. Check LogCat for possible errors!",
                                Toast.LENGTH_LONG)
                                .show();
                    }
                });

            }

            return productList;

        }

        @Override
        protected void onPostExecute(ArrayList<Product> products) {
            super.onPostExecute(products);
            // Dismiss the progress dialog
            if (pDialog.isShowing())
                pDialog.dismiss();

            //update product list adapter.
            this.pAdapter.updateProducts(products);

        }

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}