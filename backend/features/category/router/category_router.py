from ..service import (
    create_category_service,
    get_categories_service,
    get_category_by_id_service,
    delete_category_service,
    update_category_service,
)

from ..schema.category_schema import CategoryCreate, CategoryResponse, CategoryUpdate
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from core.database import get_db

router = APIRouter()


# create category router:
@router.post("/", response_model=CategoryResponse)
def create_category_roter(category: CategoryCreate, db: Session = Depends(get_db)):
    return create_category_service(db, category)


# get categories :
@router.get("/")
def get_categories_router(search: str | None = None, db: Session = Depends(get_db)):
    return get_categories_service(db, search)


# get category by id router
@router.get("/{category_id}", response_model=CategoryResponse)
def get_category_by_id_router(category_id: int, db: Session = Depends(get_db)):
    return get_category_by_id_service(db, category_id)


# delete category
@router.delete("/{category_id}", response_model=CategoryResponse)
def delete_category_router(category_id: int, db: Session = Depends(get_db)):
    return delete_category_service(db, category_id)


# update category
@router.patch("/{category_id}", response_model=CategoryResponse)
def update_category_roruter(
    category_id: int, data: CategoryUpdate, db: Session = Depends(get_db)
):

    return update_category_service(db, category_id, data)
