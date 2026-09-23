from sqlalchemy.orm import Session
from ..repository import (
    create_style_repository,
    get_styles_repository,
    get_style_by_id_repository,
    update_style_repository,
    delete_style_repository,
)
from ..schema import StyleCreate, StyleUpdate
from ..model import ProductStyleModel
from ..exception import StyleNotFound


# create style
def create_style_service(db: Session, style: StyleCreate):
    style = ProductStyleModel(name=style.name)
    return create_style_repository(db, style)


# get styles :
def get_styles_service(db: Session):
    return get_styles_repository(db)


# get style by id:
def get_style_by_id_service(db: Session, style_id: int):
    style = get_style_by_id_repository(db, style_id)
    if style is None:
        raise StyleNotFound()
    return style


# update style:
def update_style_service(db: Session, style_id: int, data: StyleUpdate):
    style = get_style_by_id_repository(db, style_id)
    if style is None:
        raise StyleNotFound()
    return update_style_repository(db, style_id, data)


# delet style:
def delete_style_service(db: Session, style_id: int):
    style = get_style_by_id_repository(db, style_id)
    if style is None:
        raise StyleNotFound()
    return delete_style_repository(db, style_id)
