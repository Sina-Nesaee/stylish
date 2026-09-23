from sqlalchemy.orm import Session
from ..model import UserModel


def get_users_repository(db: Session):
    return db.query(UserModel).all()


def get_user_by_id_repository(db: Session, user_id: int):
    return db.query(UserModel).filter(UserModel.id == user_id).first()


def create_user_repository(db: Session, user: UserModel):
    db.add(user)
    db.commit()
    db.refresh(user)
    return user


def update_user_repository(db: Session, user_id: int, user_data: dict):
    user = db.query(UserModel).filter(UserModel.id == user_id).first()
    if user is None:
        return None

    for key, value in user_data.items():
        setattr(user, key, value)
    db.commit()
    db.refresh(user)
    return user


def delete_user_repository(db: Session, user_id: int):
    user = db.query(UserModel).filter(UserModel.id == user_id).first()
    if user is None:
        return None
    db.delete(user)
    db.commit()
