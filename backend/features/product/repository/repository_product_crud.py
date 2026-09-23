from sqlalchemy.orm import Session
from ..model import ProductModel


# get products
def get_products(db: Session):
    return db.query(ProductModel).all()


# get product by Id
def get_product_by_id(db: Session, product_id: int):
    return db.query(ProductModel).filter(ProductModel.id == product_id).first()


# repository create product
def create_product(db: Session, product: ProductModel):
    db.add(product)
    db.commit()
    db.refresh(product)
    return product


# repository update product
def update_product(db: Session, product_id: int, data: dict):
    product = db.query(ProductModel).filter(ProductModel.id == product_id).first()
    if product is None:
        return None
    for key, value in data.items():
        setattr(product, key, value)

    db.commit()
    db.refresh(product)
    return product


# repositorry delete product:
def delete_product(db: Session, product_id: int):
    product = db.query(ProductModel).filter(ProductModel.id == product_id).first()
    if product is None:
        return None

    db.delete(product)
    db.commit()
    return product


# decrease product
def decrease_stock(db: Session, product_id: int, quantity: int):
    product = db.query(ProductModel).filter(ProductModel.id == product_id).first()

    if product is None:
        return None
    product.stock -= quantity
    return product
