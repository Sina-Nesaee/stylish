from .repository_product_crud import (
    get_product_by_id,
    get_products,
    update_product,
    create_product,
    delete_product,
    decrease_stock,
)
from .repository_product_queries import (
    get_discounted_products,
    get_recommended_products,
    get_trending_products,
    new_arrivals_products,
)
