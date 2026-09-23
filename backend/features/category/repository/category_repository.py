# create category repository:
from sqlalchemy.orm import Session

from ..model import ProductCategoryModel


# create category repository:
def create_category_repository(db: Session, category: ProductCategoryModel):
    db.add(category)
    db.commit()
    db.refresh(category)
    return category


# get categories:
def get_categories_repository(db: Session):
    return db.query(ProductCategoryModel).all()


# get category by Id:
def get_category_by_id_repository(db: Session, category_id: int):
    return (
        db.query(ProductCategoryModel)
        .filter(ProductCategoryModel.id == category_id)
        .first()
    )


# delete category:
def delete_category_repository(db: Session, category_id: int):
    category = (
        db.query(ProductCategoryModel)
        .filter(ProductCategoryModel.id == category_id)
        .first()
    )
    if category is None:
        return None
    db.delete(category)
    db.commit()
    return category


# update category
def update_category_repository(db: Session, category_id: int, data: dict):
    category = (
        db.query(ProductCategoryModel)
        .filter(ProductCategoryModel.id == category_id)
        .first()
    )
    if category is None:
        return None
    for key, Value in data.model_dump(exclude_unset=True).items():
        setattr(category, key, Value)

    db.commit()
    db.refresh(category)
    return category
