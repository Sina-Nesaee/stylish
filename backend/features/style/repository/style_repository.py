from sqlalchemy.orm import Session
from ..model import ProductStyleModel


# create style
def create_style_repository(db: Session, style: ProductStyleModel):
    db.add(style)
    db.commit()
    db.refresh(style)
    return style


# get styles
def get_styles_repository(db: Session):
    return db.query(ProductStyleModel).all()


# get style by id:
def get_style_by_id_repository(db: Session, style_id: int):
    return db.query(ProductStyleModel).filter(ProductStyleModel.id == style_id).first()


# update style :
def update_style_repository(db: Session, style_id: int, data: dict):
    style = db.query(ProductStyleModel).filter(ProductStyleModel.id == style_id).first()
    if style is None:
        return None
    for key, value in data.model_dump(exclude_unset=True).items():
        setattr(style, key, value)
    db.commit()
    db.refresh(style)
    return style


# delete style:
def delete_style_repository(db: Session, style_id: int):
    style = db.query(ProductStyleModel).filter(ProductStyleModel.id == style_id).first()
    if style is None:
        return None
    db.delete(style)
    db.commit()
    return style
