from sqlalchemy.orm import Session
from ..model import BrandModel


# create brand:
def create_brand_repository(db: Session, brand: BrandModel):
    db.add(brand)
    db.commit()
    db.refresh(brand)
    return brand


# get brands:
def get_brands_repository(db: Session):
    return db.query(BrandModel).all()


# get brand by id :
def get_brand_by_id_repository(db: Session, brand_id: int):
    return db.query(BrandModel).filter(BrandModel.id == brand_id).first()


# update brand :
def update_brand_repository(db: Session, brand_id: int, data: dict):
    brand = db.query(BrandModel).filter(BrandModel.id == brand_id).first()
    if brand is None:
        return None
    for key, value in data.model_dump(exclude_unset=True).items():
        setattr(brand, key, value)
    db.commit()
    db.refresh(brand)
    return brand


# delete brand:
def delete_brand_repository(db: Session, brand_id: int):
    brand = db.query(BrandModel).filter(BrandModel.id == brand_id).first()
    if brand is None:
        return None
    db.delete(brand)
    db.commit()
    return brand
