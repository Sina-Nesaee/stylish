from fastapi import APIRouter, Depends
from ..service import (
    get_profiles_service,
    get_profile_by_id_service,
    create_profile_service,
    delete_profile_service,
    update_profile_service,
)
from ..schema import ProfileUpdate, ProfileCreate, ProfileResponse
from core.database import get_db
from sqlalchemy.orm import Session

router = APIRouter()


# get profile:
@router.get("/", response_model=list[ProfileResponse])
def get_profiles_router(db: Session = Depends(get_db)):
    return get_profiles_service(db)


# get Profile by id:
@router.get("/{user_id}", response_model=list[ProfileResponse])
def get_profile_by_id_router(user_id: int, db: Session = Depends(get_db)):
    return get_profile_by_id_service(db, user_id)


# create Profile :
@router.post("/", status_code=201)
def create_profile_router(profile: ProfileCreate, db: Session = Depends(get_db)):
    return create_profile_service(db, profile)


# update profile:
@router.patch("/{user_id}", response_model=ProfileResponse)
def update_profile_router(
    user_id: int, data: ProfileUpdate, db: Session = Depends(get_db)
):
    return update_profile_service(db, user_id, data)


# delete profile:
@router.delete("/{user_id}", status_code=204)
def delete_profile_router(user_id: int, db: Session = Depends(get_db)):
    return delete_profile_service(db, user_id)
