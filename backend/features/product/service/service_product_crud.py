from features.gender.model.gender_model import ProductGenderModel
from features.product.model.product_images_model import ProductImageModel
from features.product.model.product_model import ProductModel
from features.product.model.product_size_model import ProductSizeModel
from features.season.model.season_model import ProductSeasonModel
from features.style.model.style_model import ProductStyleModel
from sqlalchemy.orm import Session
from ..repository import (
    create_product,
    get_product_by_id,
    update_product as update_product_repository,
    get_products as get_all_products,
    delete_product as delete_product_repository,
)
from ..exception.exception import NotEnoughStockError, ProductNotFoundError
from ..schema import ProductCreate


# get products
def get_products(db: Session, search=None):
    products = get_all_products(db)
    if search is None:
        return products
    result = []
    for product in products:
        if search.lower() in product.name.lower():
            result.append(product)
    return result


# get product by id
def get_product(db: Session, product_id: int):
    product = get_product_by_id(db, product_id)
    if product is None:
        raise ProductNotFoundError
    return product


# create product
def create_new_product(db: Session, product: ProductCreate):
    images = [ProductImageModel(image_url=image.image_url) for image in product.images]
    sizes = [
        ProductSizeModel(size=size.size, stock=size.stock) for size in product.sizes
    ]
    genders = (
        db.query(ProductGenderModel)
        .filter(ProductGenderModel.id.in_(product.genders_id))
        .all()
    )
    seasons = (
        db.query(ProductSeasonModel)
        .filter(ProductSeasonModel.id.in_(product.seasons_id))
        .all()
    )
    styles = (
        db.query(ProductStyleModel)
        .filter(ProductStyleModel.id.in_(product.styles_id))
        .all()
    )

    product = ProductModel(
        title=product.title,
        subTitle=product.subTitle,
        price=product.price,
        description=product.description,
        rate=product.rate,
        discount=product.discount,
        brand_id=product.brand_id,
        category_id=product.category_id,
        images=images,
        sizes=sizes,
        genders=genders,
        seasons=seasons,
        styles=styles,
    )

    return create_product(db, product)


# update product
def update_product(db: Session, product_id: int, data: UpdateProduct):
    product = get_product_by_id(db, product_id)

    if product is None:
        raise ProductNotFoundError()
    return update_product_repository(db, product_id, data)


# delete product
def delete_product(db: Session, product_id: int):
    product = get_product_by_id(db, product_id)
    if product is None:
        raise ProductNotFoundError()
    return delete_product_repository(db, product_id)


# decrease product stock
def decrease_product_stock(db: Session, product_id: int, quantity: int):
    product = get_product_by_id(db, product_id)

    if product is None:
        raise ProductNotFoundError()
    if product.stock < quantity:
        raise NotEnoughStockError()
    product.stock -= quantity
    return product


# increase product stock
def increase_product_stock(db: Session, product_id: int, quantity: int):
    product = get_product_by_id(db, product_id)
    if product is None:
        raise ProductNotFoundError()
    product.stock += quantity
    return product
