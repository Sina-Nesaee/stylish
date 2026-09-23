from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from core.database import get_db
from features.style.schema import StyleResponse, StyleCreate, StyleUpdate
from ..service import (
    create_style_service,
    get_styles_service,
    get_style_by_id_service,
    update_style_service,
    delete_style_service,
)

router = APIRouter()


# create styles
@router.post("/", response_model=StyleResponse)
def create_style_router(style: StyleCreate, db: Session = Depends(get_db)):
    return create_style_service(db, style)


# get styles :
@router.get("/")
def get_styles_router(db: Session = Depends(get_db)):
    return get_styles_service(db)


# get style by id:
@router.get("/{style_id}", response_model=StyleResponse)
def get_product_by_id_router(style_id: int, db: Session = Depends(get_db)):
    return get_style_by_id_service(db, style_id)


# update style :
@router.patch("/{style_id}", response_model=StyleResponse)
def update_style_router(
    style_id: int, data: StyleUpdate, db: Session = Depends(get_db)
):
    return update_style_service(db, style_id, data)


# delete style:
@router.delete("/{style_id}", response_model=StyleResponse)
def delete_style_router(style_id: int, db: Session = Depends(get_db)):
    return delete_style_service(db, style_id)
