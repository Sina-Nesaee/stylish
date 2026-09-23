from ..repository.repository_product_queries import (
    get_discounted_products,
    new_arrivals_products,
    get_trending_products,
    get_recommended_products,
)
from sqlalchemy.orm import Session


# get discounted products
def get_discounted_products_service(db: Session):
    return get_discounted_products(db)


# get NewArrivals products
def get_new_arrivals_product_service(db: Session):
    return new_arrivals_products(db)


# get rending products
def get_trending_products_service(db: Session):
    products = get_trending_products(db)

    return [product for product, order_count in products]


# get recommended products
def get_recommended_products_service(db: Session):
    return get_recommended_products(db)
