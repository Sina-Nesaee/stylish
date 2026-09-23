from sqlalchemy.orm import Session
from ..repository import get_users_by_email_repository
from ..schema import LoginRequest, TokenResponse
from core.security.security import verify_password, create_access_token


def login_service(db: Session, login_data: LoginRequest):
    user = get_users_by_email_repository(db, login_data.email)
    if user is None:
        return None
    is_passwprd_correct = verify_password(login_data.password, user.password_hash)
    if not is_passwprd_correct:
        return None
    access_token = create_access_token(user.id)
    return access_token
