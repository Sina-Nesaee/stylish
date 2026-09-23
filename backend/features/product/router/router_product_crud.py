from fastapi import APIRouter, Depends

from ..service.service_product_crud import (
    create_new_product,
    update_product,
    get_products as get_products_service,
    get_product,
    delete_product,
)
from ..schema import ProductCreate, ProductUpdate, ProductResponse
from core.database import get_db
from sqlalchemy.orm import Session

router = APIRouter()


# router get products
@router.get("/", response_model=list[ProductResponse])
def get_products(search: str | None = None, db: Session = Depends(get_db)):
    return get_products_service(db, search)


# router get product by id
@router.get("/{product_id}", response_model=ProductResponse)
def get_product_by_id(product_id: int, db: Session = Depends(get_db)):
    product = get_product(db, product_id)
    return product


# router create products
@router.post("/", status_code=201)
def Product_Creat(product: ProductCreate, db: Session = Depends(get_db)):
    return create_new_product(db, product)


# router patch products
@router.patch("/{product_id}")
def Update_Product_router(
    product_id: int, product: ProductUpdate, db: Session = Depends(get_db)
):
    data = product.model_dump(exclude_unset=True)
    updated_product = update_product(db, product_id, data)

    return updated_product


# router delete products
@router.delete("/{product_id}", status_code=204)
def delete_Product(product_id: int, db: Session = Depends(get_db)):
    delete_product(db, product_id)
