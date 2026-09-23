from sqlalchemy.orm import Session
from features.user.model import UserModel


def get_users_by_email_repository(db: Session, email: str):
    return db.query(UserModel).filter(UserModel.email == email).first()
