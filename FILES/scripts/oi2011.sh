mysql -h vandaae11.eleven.axc.nl -u vandaae11_root -p"qazwsx12" vandaae11_zencart < orders_ita_2011.sql |cut -f1| grep -v _ > orders.tmp
while read ORDER_ID
do
echo select orders.date_purchased, orders_products.products_model, orders_products.products_name, orders_products.products_prices from orders_products,orders where orders_products.orders_id = orders.orders_id AND orders.orders_id = $ORDER_ID \; 
done < orders.tmp >orders2011Ita.sql
mysql -h vandaae11.eleven.axc.nl -u vandaae11_root -p"qazwsx12" vandaae11_zencart < orders2011Ita.sql

