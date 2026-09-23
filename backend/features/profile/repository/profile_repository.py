from sqlalchemy.orm import Session
from ..model import ProfileModel


# get profiles
def get_profiles_repository(db: Session):
    return db.query(ProfileModel).all()


# get profile by id:
def get_profile_by_id_repository(db: Session, user_id: int):
    return db.query(ProfileModel).filter(ProfileModel.id == user_id).first()


# create Profile:
def create_profile_repository(db: Session, profile: ProfileModel):
    db.add(profile)
    db.commit()
    db.refresh(profile)
    return profile


# update profile:
def update_profile_repository(db: Session, user_id: int, profiles: dict):
    profile = db.query(ProfileModel).filter(ProfileModel.id == user_id).first()
    if profile is None:
        return None
    for key, value in profiles.items():
        setattr(profile, key, value)
    db.commit()
    db.refresh(profile)
    return profile


# delete profile:
def delete_profile_repository(db: Session, user_id: int):
    profile = db.query(ProfileModel).filter(ProfileModel.id == user_id).first()
    if profile is None:
        return None
    db.delete(profile)
    db.commit()
