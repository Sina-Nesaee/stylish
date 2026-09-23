from sqlalchemy.orm import Session
from ..model import AdressModel


# get address :
def get_address_repository(db: Session):
    return db.query(AdressModel).all()


# get address by id:
def get_address_by_id_repository(db: Session, address_id: int):
    return db.query(AdressModel).filter(AdressModel.id == address_id).first()


# create address :
def create_address_repository(db: Session, address: AdressModel):
    db.add(address)
    db.commit()
    db.refresh(address)
    return address


# update address
def update_address_repository(db: Session, user_id: int, data: dict):
    address = db.query(AdressModel).filter(AdressModel.id == user_id).first()
    if address is None:
        return None
    for key, value in data.items():
        setattr(address, key, value)
    return address


# delete address :
def delete_address_repoistory(db: Session, user_id: int):
    address = db.query(AdressModel).filter(AdressModel.id == user_id).first()
    if address is None:
        return None
    db.delete(address)
    db.commit()
