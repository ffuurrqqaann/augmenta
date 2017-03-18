<h2><?php echo $title; ?></h2>
 
<table border='1' cellpadding='4'>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Action</strong></td>
    </tr>
<?php foreach ($products as $products_item): ?>
        <tr>
            <td><?php echo $products_item['name']; ?></td>
            <td><?php echo $products_item['description']; ?></td>
            <td>
                <a href="<?php echo site_url('products/'.$products_item['id']); ?>">View</a> | 
                <a href="<?php echo site_url('products/edit/'.$products_item['id']); ?>">Edit</a> | 
                <a href="<?php echo site_url('products/delete/'.$products_item['id']); ?>" onClick="return confirm('Are you sure you want to delete?')">Delete</a>
            </td>
        </tr>
<?php endforeach; ?>
</table>