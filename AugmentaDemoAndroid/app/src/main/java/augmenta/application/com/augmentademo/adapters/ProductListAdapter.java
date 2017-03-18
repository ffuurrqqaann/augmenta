package augmenta.application.com.augmentademo.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;

import augmenta.application.com.augmentademo.R;
import augmenta.application.com.augmentademo.models.Product;

/**
 * Created by furqan on 3/17/2017.
 */
public class ProductListAdapter extends BaseAdapter {

    private Context mContext;
    private LayoutInflater mLayoutInflater;

    ArrayList<Product> productList = new ArrayList<>();

    public ProductListAdapter(Context context) {
        mContext = context;
        mLayoutInflater = (LayoutInflater) mContext
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @Override
    public int getCount() {
        return productList.size();
    }

    @Override
    public Object getItem(int position) {
        return productList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView,
                        ViewGroup parent) {
        LinearLayout itemView;
        if (convertView == null) {
            itemView = (LinearLayout) mLayoutInflater.inflate(
                    R.layout.list_item, parent, false);

        } else {
            itemView = (LinearLayout) convertView;
        }

        TextView nameText = (TextView)
                itemView.findViewById(R.id.name);
        TextView descriptionText = (TextView)
                itemView.findViewById(R.id.description);

        String name = productList.get(position).getName();
        nameText.setText(name);
        String description =
                productList.get(position).getDescription();
        if (description.trim().length() == 0) {
            description = "Sorry, no description for this image.";
        }
        descriptionText.setText(description);

        return itemView;
    }

    public void updateProducts(ArrayList<Product> pList) {
        this.productList = pList;
        notifyDataSetChanged();
    }


}