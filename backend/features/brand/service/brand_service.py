from sqlalchemy.orm import Session
from ..schema import BrandCreate, BrandUpdate, BrandResponse
from ..repository import (
    create_brand_repository,
    get_brands_repository,
    get_brand_by_id_repository,
    update_brand_repository,
    delete_brand_repository,
)
from ..model import BrandModel
from ..exception import BrandNotFound


# create brand
def create_brand_service(db: Session, brand: BrandCreate):
    brand = BrandModel(name=brand.name)
    return create_brand_repository(db, brand)


# get brands :
def get_brands_service(db: Session):
    return get_brands_repository(db)


# get brand by id:
def get_brand_by_id_service(db: Session, brand_id: int):
    brand = get_brand_by_id_repository(db, brand_id)
    if brand is None:
        raise BrandNotFound()
    return get_brand_by_id_repository(db, brand_id)


# update brand:
def update_brand_service(db: Session, brand_id: int, data: BrandUpdate):
    brand = get_brand_by_id_repository(db, brand_id)
    if brand is None:
        raise BrandNotFound()
    return update_brand_repository(db, brand_id, data)


# delete brand repository :
def delete_brand_service(db: Session, brand_id: int):
    brand = get_brand_by_id_repository(db, brand_id)
    if brand is None:
        raise BrandNotFound()
    return delete_brand_repository(db, brand_id)
