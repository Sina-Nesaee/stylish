from sqlalchemy.orm import Session
from ..repository import (
    update_profile_repository,
    get_profiles_repository,
    get_profile_by_id_repository,
    delete_profile_repository,
    create_profile_repository,
)
from ..schema import ProfileUpdate, ProfileResponse, ProfileCreate
from ..model import ProfileModel
from ..exception import ProfileNotFound


def get_profiles_service(db: Session):
    return get_profiles_repository(db)


def get_profile_by_id_service(db: Session, user_id: int):
    profile = get_profile_by_id_repository(db, user_id)
    if profile is None:
        raise ProfileNotFound()
    return profile


def create_profile_service(db: Session, profile: ProfileCreate):
    profile = ProfileModel(
        user_id=profile.user_id,
        first_name=profile.first_name,
        last_name=profile.last_name,
        phone=profile.phone,
        avatar=profile.avatar,
    )

    return create_profile_repository(db, profile)


def update_profile_service(db: Session, user_id: int, profiles: ProfileUpdate):
    profile = get_profile_by_id_repository(db, user_id)
    if profile is None:
        raise ProfileNotFound()
    profile_data = profiles.model_dump(exclude_unset=True)
    return update_profile_repository(db, user_id, profile_data)


def delete_profile_service(db: Session, user_id: int):
    profile = get_profile_by_id_repository(db, user_id)
    if profile is None:
        raise ProfileNotFound()
    return delete_profile_repository(db, user_id)
