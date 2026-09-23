from sqlalchemy.orm import Session
from ..model import ProductModel
from sqlalchemy import func
from features.order.model import OrderModel


# get discounted products
def get_discounted_products(db: Session):
    return db.query(ProductModel).filter(ProductModel.discount > 50).all()


# get New Arrivals repository product
def new_arrivals_products(db: Session):
    return (
        db.query(ProductModel).order_by(ProductModel.created_at.desc()).limit(10).all()
    )


# get trending products
def get_trending_products(db: Session):
    return (
        db.query(ProductModel, func.count(OrderModel.id).label("order_count"))
        .join(OrderModel, ProductModel.id == OrderModel.product_id)
        .group_by(ProductModel.id)
        .order_by(func.count(OrderModel.id).desc())
        .all()
    )


# get recommended products
def get_recommended_products(db: Session):
    return db.query(ProductModel).order_by(ProductModel.rate.desc()).all()
