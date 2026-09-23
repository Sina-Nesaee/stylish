from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from core.database import get_db
from ..schema import BrandCreate, BrandResponse, BrandUpdate
from ..service import (
    create_brand_service,
    get_brands_service,
    get_brand_by_id_service,
    update_brand_service,
    delete_brand_service,
)

router = APIRouter()


# create router
@router.post("/", response_model=BrandResponse)
def create_brand_router(brand: BrandCreate, db: Session = Depends(get_db)):
    return create_brand_service(db, brand)


# get brands:
@router.get("/")
def get_brands_router(db: Session = Depends(get_db)):
    return get_brands_service(db)


# get brand by id:
@router.get("/{brand_id}", response_model=BrandResponse)
def get_brand_by_id(brand_id: int, db: Session = Depends(get_db)):
    return get_brand_by_id_service(db, brand_id)


# update brand :
@router.patch("/{brand_id}", response_model=BrandResponse)
def update_brand(brand_id: int, data: BrandUpdate, db: Session = Depends(get_db)):
    return update_brand_service(db, brand_id, data)


# delete brand:
@router.delete("/{brand_id}", response_model=BrandResponse)
def delete_brand_router(brand_id: int, db: Session = Depends(get_db)):
    return delete_brand_service(db, brand_id)
