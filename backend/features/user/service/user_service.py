from sqlalchemy.orm import Session
from ..repository import (
    create_user_repository,
    get_users_repository,
    update_user_repository,
    get_user_by_id_repository,
    delete_user_repository,
)
from ..schema import UserUpdate, UserResponse, UserCreate
from ..model import UserModel
from ..exception import UserNotFound
from core.security.security import password_hashed


def get_users_service(db: Session):
    return get_users_repository(db)


def get_users_by_id_service(db: Session, user_id: int):
    user = get_user_by_id_repository(db, user_id)
    if user is None:
        raise UserNotFound
    return user


def create_user_service(db: Session, user: UserCreate):
    hashed_password = password_hashed(user.password)
    user = UserModel(email=user.email, password_hash=hashed_password)
    return create_user_repository(db, user)


def update_user_service(db: Session, user_id: int, user_data: UserUpdate):
    user = get_user_by_id_repository(db, user_id)
    if user is None:
        raise UserNotFound

    data = user_data.model_dump(exclude_unset=True)
    return update_user_repository(db, user_id, data)


def delete_user_service(db: Session, user_id: int):
    user = get_user_by_id_repository(db, user_id)
    if user is None:
        raise UserNotFound
    return delete_user_repository(db, user_id)
