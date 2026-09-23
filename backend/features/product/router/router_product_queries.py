from fastapi import APIRouter, Depends
from ..service.service_product_quries import (
    get_new_arrivals_product_service,
    get_discounted_products_service,
    get_trending_products_service,
    get_recommended_products_service,
)
from core.database import get_db
from sqlalchemy.orm import Session
from ..schema import ProductResponse

router = APIRouter()


# router get discounted products
@router.get("/discounted", response_model=list[ProductResponse])
def get_discount_products(db: Session = Depends(get_db)):
    return get_discounted_products_service(db)


# router get newArrivals products
@router.get("/newـarrivals", response_model=list[ProductResponse])
def get_new_arrivals_products(db: Session = Depends(get_db)):
    return get_new_arrivals_product_service(db)


# router get trending products
@router.get("/trending", response_model=list[ProductResponse])
def get_trending_product(db: Session = Depends(get_db)):
    return get_trending_products_service(db)


# router get recommended products
@router.get("/recommended", response_model=list[ProductResponse])
def get_recommended_products(db: Session = Depends(get_db)):
    return get_recommended_products_service(db)
