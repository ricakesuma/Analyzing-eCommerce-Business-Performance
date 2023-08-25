--1.
SELECT
    EXTRACT(YEAR FROM bulan) AS tahun,
    ROUND(AVG(jumlah_customer_aktif), 2) AS rata_rata_customer_aktif_bulanan
FROM (
    SELECT
        DATE_TRUNC('month', order_purchase_timestamp) AS bulan,
        COUNT(DISTINCT customer_id) AS jumlah_customer_aktif
    FROM public.orders_dataset
    GROUP BY DATE_TRUNC('month', order_purchase_timestamp)
) AS customer_aktif_bulanan
GROUP BY tahun
ORDER BY tahun;



--2.
SELECT
    EXTRACT(YEAR FROM first_order_date) AS tahun,
    COUNT(customer_id) AS jumlah_customer_baru
FROM (
    SELECT
        customer_id,
        MIN(order_purchase_timestamp) AS first_order_date
    FROM public.orders_dataset
    GROUP BY customer_id
) AS first_orders
GROUP BY tahun
ORDER BY tahun;

--3.
SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS tahun,
    COUNT(DISTINCT customer_id) AS jumlah_repeat_order
FROM (
    SELECT
        customer_id,
        order_purchase_timestamp
    FROM public.orders_dataset
    GROUP BY customer_id, order_purchase_timestamp
    HAVING COUNT(order_id) > 1
) AS repeat_orders
GROUP BY tahun
ORDER BY tahun;

--4. 
SELECT
    tahun,
    ROUND(AVG(frekuensi_order), 2) AS rata_rata_order_per_customer
FROM (
    SELECT
        EXTRACT(YEAR FROM order_purchase_timestamp) AS tahun,
        customer_id,
        COUNT(order_id) AS frekuensi_order
    FROM public.orders_dataset
    GROUP BY tahun, customer_id
) AS frekuensi_order_customer
GROUP BY tahun
ORDER BY tahun;

--5.
SELECT
    COALESCE(new_customers.tahun, repeat_orders.tahun, avg_orders.tahun) AS tahun,
    new_customers.jumlah_customer_baru,
    repeat_orders.jumlah_repeat_order,
    avg_orders.rata_rata_order_per_customer
FROM (
    SELECT
        EXTRACT(YEAR FROM first_order_date) AS tahun,
        COUNT(customer_id) AS jumlah_customer_baru
    FROM (
        SELECT
            customer_id,
            MIN(order_purchase_timestamp) AS first_order_date
        FROM public.orders_dataset
        GROUP BY customer_id
    ) AS first_orders
    GROUP BY tahun
) AS new_customers
LEFT JOIN (
    SELECT
        EXTRACT(YEAR FROM order_purchase_timestamp) AS tahun,
        COUNT(DISTINCT customer_id) AS jumlah_repeat_order
    FROM (
        SELECT
            customer_id,
            order_purchase_timestamp
        FROM public.orders_dataset
        GROUP BY customer_id, order_purchase_timestamp
        HAVING COUNT(order_id) > 1
    ) AS repeat_orders
    GROUP BY tahun
) AS repeat_orders ON new_customers.tahun = repeat_orders.tahun
LEFT JOIN (
    SELECT
        tahun,
        ROUND(AVG(frekuensi_order), 2) AS rata_rata_order_per_customer
    FROM (
        SELECT
            EXTRACT(YEAR FROM order_purchase_timestamp) AS tahun,
            customer_id,
            COUNT(order_id) AS frekuensi_order
        FROM public.orders_dataset
        GROUP BY tahun, customer_id
    ) AS frekuensi_order_customer
    GROUP BY tahun
) AS avg_orders ON new_customers.tahun = avg_orders.tahun
ORDER BY tahun;