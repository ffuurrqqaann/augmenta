<h2><?php echo $title; ?></h2>
 
<?php echo validation_errors(); ?>
 
<?php echo form_open('products/edit/'.$products_item['id']); ?>
    <table>
        <tr>
            <td><label for="name">Name</label></td>
            <td><input type="input" name="name" size="50" value="<?php echo $products_item['name'] ?>" /></td>
        </tr>
        <tr>
            <td><label for="description">Description</label></td>
            <td><textarea name="description" rows="10" cols="40"><?php echo $products_item['description'] ?></textarea></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" name="submit" value="Edit products item" /></td>
        </tr>
    </table>
</form>