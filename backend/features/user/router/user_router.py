from fastapi import APIRouter, Depends
from ..schema import UserResponse, UserCreate, UserUpdate
from sqlalchemy.orm import Session
from ..service import (
    update_user_service,
    create_user_service,
    get_users_service,
    get_users_by_id_service,
    delete_user_service,
)
from core.security.security import get_current_user
from core.database import get_db
from ..model import UserModel

router = APIRouter()


@router.get("/me")
def get_me(current_user: UserModel = Depends(get_current_user)):
    return current_user


@router.delete("/admin-test")
def admin_test(current_admin: UserModel = Depends(get_current_user)):
    return {"message": "welcome admin", "user_id": current_admin.id}


@router.get("/", response_model=list[UserResponse])
def get_users_router(db: Session = Depends(get_db)):
    return get_users_service(db)


@router.get("/{user_id}", response_model=UserResponse)
def get_user_by_id_router(user_id: int, db: Session = Depends(get_db)):
    return get_users_by_id_service(db, user_id)


@router.post("/", status_code=201)
def create_user_router(user: UserCreate, db: Session = Depends(get_db)):
    return create_user_service(db, user)


@router.patch("/{user_id}", response_model=UserUpdate)
def update_user_router(user: UserUpdate, user_id: int, db: Session = Depends(get_db)):
    return update_user_service(db, user_id, user)


@router.delete("/{user_id}", status_code=204)
def delete_user_router(user_id: int, db: Session = Depends(get_db)):
    return delete_user_service(db, user_id)
