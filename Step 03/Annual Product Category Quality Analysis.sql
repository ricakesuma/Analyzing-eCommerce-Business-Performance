--1.
SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS tahun,
    SUM(oi.price + oi.freight_value) AS total_revenue
FROM public.orders_dataset o
JOIN public.order_items_dataset oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY tahun
ORDER BY tahun;

--2.
SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS tahun,
    COUNT(order_id) AS jumlah_cancel_order
FROM public.orders_dataset
WHERE order_status = 'canceled'
GROUP BY tahun
ORDER BY tahun;

--3.
WITH revenue_per_category AS (
    SELECT
        EXTRACT(YEAR FROM o.order_purchase_timestamp) AS tahun,
        p.product_category_name,
        SUM(oi.price + oi.freight_value) AS revenue
    FROM public.orders_dataset o
    JOIN public.order_items_dataset oi ON o.order_id = oi.order_id
    JOIN public.product_dataset p ON oi.product_id = p.product_id
    WHERE o.order_status = 'delivered'
    GROUP BY tahun, p.product_category_name
)
, ranked_categories AS (
    SELECT
        tahun,
        product_category_name,
        revenue,
        RANK() OVER (PARTITION BY tahun ORDER BY revenue DESC) AS rank
    FROM revenue_per_category
)
SELECT
    tahun,
    product_category_name AS kategori_produk_tertinggi,
    revenue AS pendapatan_total_tertinggi
FROM ranked_categories
WHERE rank = 1
ORDER BY tahun;

--4.
WITH cancel_orders_per_category AS (
    SELECT
        EXTRACT(YEAR FROM o.order_purchase_timestamp) AS tahun,
        p.product_category_name,
        COUNT(o.order_id) AS cancel_orders
    FROM public.orders_dataset o
    JOIN public.order_items_dataset oi ON o.order_id = oi.order_id
    JOIN public.product_dataset p ON oi.product_id = p.product_id
    WHERE o.order_status = 'canceled'
    GROUP BY tahun, p.product_category_name
)
, ranked_categories AS (
    SELECT
        tahun,
        product_category_name,
        cancel_orders,
        RANK() OVER (PARTITION BY tahun ORDER BY cancel_orders DESC) AS rank
    FROM cancel_orders_per_category
)
SELECT
    tahun,
    product_category_name AS kategori_produk_dengan_cancel_terbanyak,
    cancel_orders AS jumlah_cancel_order_terbanyak
FROM ranked_categories
WHERE rank = 1
ORDER BY tahun;

--5.
WITH revenue_per_year AS (
    SELECT
        EXTRACT(YEAR FROM o.order_purchase_timestamp) AS tahun,
        SUM(oi.price + oi.freight_value) AS total_revenue
    FROM public.orders_dataset o
    JOIN public.order_items_dataset oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY tahun
),
cancel_orders_per_year AS (
    SELECT
        EXTRACT(YEAR FROM order_purchase_timestamp) AS tahun,
        COUNT(order_id) AS jumlah_cancel_order
    FROM public.orders_dataset
    WHERE order_status = 'canceled'
    GROUP BY tahun
),
top_revenue_category AS (
    SELECT
        tahun,
        product_category_name AS kategori_produk_tertinggi
    FROM (
        SELECT
            tahun,
            product_category_name,
            revenue,
            RANK() OVER (PARTITION BY tahun ORDER BY revenue DESC) AS rank
        FROM (
            SELECT
                EXTRACT(YEAR FROM o.order_purchase_timestamp) AS tahun,
                p.product_category_name,
                SUM(oi.price + oi.freight_value) AS revenue
            FROM public.orders_dataset o
            JOIN public.order_items_dataset oi ON o.order_id = oi.order_id
            JOIN public.product_dataset p ON oi.product_id = p.product_id
            WHERE o.order_status = 'delivered'
            GROUP BY tahun, p.product_category_name
        ) AS revenue_per_category
    ) AS ranked_categories
    WHERE rank = 1
),
top_cancel_category AS (
    SELECT
        tahun,
        product_category_name AS kategori_produk_dengan_cancel_terbanyak
    FROM (
        SELECT
            tahun,
            product_category_name,
            cancel_orders,
            RANK() OVER (PARTITION BY tahun ORDER BY cancel_orders DESC) AS rank
        FROM (
            SELECT
                EXTRACT(YEAR FROM o.order_purchase_timestamp) AS tahun,
                p.product_category_name,
                COUNT(o.order_id) AS cancel_orders
            FROM public.orders_dataset o
            JOIN public.order_items_dataset oi ON o.order_id = oi.order_id
            JOIN public.product_dataset p ON oi.product_id = p.product_id
            WHERE o.order_status = 'canceled'
            GROUP BY tahun, p.product_category_name
        ) AS cancel_orders_per_category
    ) AS ranked_categories
    WHERE rank = 1
)
SELECT
    r.tahun,
    r.total_revenue,
    c.jumlah_cancel_order,
    trc.kategori_produk_tertinggi,
    tcc.kategori_produk_dengan_cancel_terbanyak
FROM revenue_per_year r
LEFT JOIN cancel_orders_per_year c ON r.tahun = c.tahun
LEFT JOIN top_revenue_category trc ON r.tahun = trc.tahun
LEFT JOIN top_cancel_category tcc ON r.tahun = tcc.tahun
ORDER BY r.tahun;
