# create Category:
from sqlalchemy.orm import Session

from ..model import ProductCategoryModel

from ..schema import CategoryCreate, CategoryUpdate
from ..repository import (
    create_category_repository,
    get_categories_repository,
    get_category_by_id_repository,
    delete_category_repository,
    update_category_repository,
)

from ..exception import CategoryNotFound


# create category service:
def create_category_service(db: Session, category: CategoryCreate):
    category = ProductCategoryModel(name=category.name, image=category.image)
    return create_category_repository(db, category)


# get categories:
def get_categories_service(db: Session, search: str = None):
    categories = get_categories_repository(db)
    if search is None:
        return categories
    result = []
    for category in categories:
        if search.lower() in category.name.lower():
            result.append(category)
    return result


# get category by id:
def get_category_by_id_service(db: Session, category_id: int):
    category = get_category_by_id_repository(db, category_id)
    if category is None:
        raise CategoryNotFound
    return category


# delete category:
def delete_category_service(db: Session, category_id: int):
    category = get_category_by_id_repository(db, category_id)
    if category is None:
        raise CategoryNotFound
    return delete_category_repository(db, category_id)


# update category:
def update_category_service(db: Session, category_id: int, data: CategoryUpdate):
    category = get_category_by_id_repository(db, category_id)
    if category is None:
        raise CategoryNotFound
    return update_category_repository(db, category_id, data)
