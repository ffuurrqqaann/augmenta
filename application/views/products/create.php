<h2><?php echo $title; ?></h2>
 
<?php echo validation_errors(); ?>
 
<?php echo form_open('products/create'); ?>    
    <table>
        <tr>
            <td><label for="name">Name</label></td>
            <td><input type="input" name="name" size="50" /></td>
        </tr>
        <tr>
            <td><label for="description">description</label></td>
            <td><textarea name="description" rows="10" cols="40"></textarea></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" name="submit" value="Create products item" /></td>
        </tr>
    </table>    
</form>